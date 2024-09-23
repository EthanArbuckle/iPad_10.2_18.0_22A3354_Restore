@implementation IKAppContext

- (void)evaluateFoundationJS
{
  void *v3;
  IKJSDevice *v4;
  IKJSDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  IKJSDeviceSettings *v9;
  IKJSDeviceSettings *v10;
  IKDOMImplementationRegistry *v11;
  IKJSApplication *v12;
  IKJSNavigationDocument *v13;
  IKJSNavigationDocument *v14;
  IKJSNavigationDocument *v15;
  IKJSNavigationDocument *v16;
  IKJSTabBar *v17;
  IKJSTabBar *v18;
  IKJSStorage *v19;
  void *v20;
  void *v21;
  IKJSStorage *v22;
  void *v23;
  void *v24;
  IKJSStorage *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  IKJSUserDefaults *v30;
  IKJSApplication *v31;
  void *v32;
  IKJSWeakMap *v33;
  void *v34;
  void *v35;
  void *v36;
  IKJSViewModelService *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  _QWORD v42[10];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  kdebug_trace();
  -[IKAppContext jsContext](self, "jsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__0;
  v69 = __Block_byref_object_dispose__0;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__0;
  v63 = __Block_byref_object_dispose__0;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v46 = +[IKUtilites isAppTrusted](IKUtilites, "isAppTrusted");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __40__IKAppContext_JS__evaluateFoundationJS__block_invoke;
  v42[3] = &unk_1E9F4B7A0;
  v42[4] = self;
  v42[5] = &v65;
  v42[6] = &v59;
  v42[7] = &v53;
  v42[8] = &v47;
  v42[9] = &v43;
  -[IKAppContext evaluateDelegateBlockSync:](self, "evaluateDelegateBlockSync:", v42);
  v4 = [IKJSDevice alloc];
  v5 = -[IKJSDevice initWithAppContext:deviceConfig:](v4, "initWithAppContext:deviceConfig:", self, v66[5]);
  if (*((_BYTE *)v44 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC158], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("guid"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Device"));
  v9 = [IKJSDeviceSettings alloc];
  v10 = -[IKJSDeviceSettings initWithAppContext:deviceConfig:](v9, "initWithAppContext:deviceConfig:", self, v66[5]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("Settings"));

  v11 = -[IKJSObject initWithAppContext:]([IKDOMImplementationRegistry alloc], "initWithAppContext:", self);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("DOMImplementationRegistry"));

  v12 = -[IKJSObject initWithAppContext:]([IKJSApplication alloc], "initWithAppContext:", self);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("App"));

  if (v60[5])
  {
    v13 = [IKJSNavigationDocument alloc];
    v14 = -[IKJSNavigationDocument initWithAppContext:navigationController:](v13, "initWithAppContext:navigationController:", self, v60[5]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("navigationDocument"));

  }
  if (v54[5])
  {
    v15 = [IKJSNavigationDocument alloc];
    v16 = -[IKJSNavigationDocument initWithAppContext:navigationController:](v15, "initWithAppContext:navigationController:", self, v54[5]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("modal"));

  }
  if (v48[5])
  {
    v17 = [IKJSTabBar alloc];
    v18 = -[IKJSTabBar initWithAppContext:appTabBar:](v17, "initWithAppContext:appTabBar:", self, v48[5]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("tabBar"));

  }
  v19 = -[IKJSStorage initWithAppContext:appStorage:]([IKJSStorage alloc], "initWithAppContext:appStorage:", self, 0);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sessionStorage"));

  -[IKAppContext app](self, "app");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = -[IKJSStorage initWithAppContext:appStorage:]([IKJSStorage alloc], "initWithAppContext:appStorage:", self, v21);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("localStorage"));

  }
  -[IKAppContext app](self, "app");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "vendorStorage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = -[IKJSStorage initWithAppContext:appStorage:]([IKJSStorage alloc], "initWithAppContext:appStorage:", self, v24);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("vendorStorage"));

  }
  -[IKAppContext app](self, "app");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    -[IKAppContext app](self, "app");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "userDefaultsStorage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = -[IKJSUserDefaults initWithAppContext:userDefaultsStorage:]([IKJSUserDefaults alloc], "initWithAppContext:userDefaultsStorage:", self, v29);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("userDefaults"));

    }
  }
  v31 = -[IKJSObject initWithAppContext:]([IKJSApplication alloc], "initWithAppContext:", self);
  -[IKAppContext setJsApp:](self, "setJsApp:", v31);

  -[IKAppContext jsApp](self, "jsApp");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("App"));

  v33 = -[IKJSWeakMap initWithAppContext:]([IKJSWeakMap alloc], "initWithAppContext:", self);
  -[IKAppContext setJsWeakMap:](self, "setJsWeakMap:", v33);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("CharacterData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Comment"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("CustomEvent"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Document"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("DocumentFragment"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("DOMException"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("DOMImplementation"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("DOMParser"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Element"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Event"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("HTMLCollection"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Impression"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("MediaItem"));
  v34 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("MediaItemChangeReason"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("NamedNodeMap"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Node"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("NodeList"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Player"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Playlist"));
  v35 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("PlaylistEndAction"));

  v36 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("PlaylistRepeatMode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Text"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("XMLHttpRequest"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("XMLSerializer"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("XPathException"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("XPathExpression"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("XPathResult"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Browser"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__block_literal_global, CFSTR("DataItem"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__block_literal_global_132, CFSTR("DataSource"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("NSError"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("LoadIndexesRequest"));
  v37 = -[IKJSObject initWithAppContext:]([IKJSViewModelService alloc], "initWithAppContext:", self);
  -[IKAppContext setJsViewModelService:](self, "setJsViewModelService:", v37);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("ViewModelLink"));
  -[IKAppContext jsViewModelService](self, "jsViewModelService");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("viewModelService"));

  -[IKAppContext _evaluateFoundationWithDeviceConfig:addPrivateInterfaces:](self, "_evaluateFoundationWithDeviceConfig:addPrivateInterfaces:", v66[5], 1);
  -[IKAppContext delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_respondsToSelector();

  if ((v40 & 1) != 0)
  {
    -[IKAppContext delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appContext:evaluateAppJavaScriptInContext:", self, v3);

  }
  kdebug_trace();

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
}

void __40__IKAppContext_JS__evaluateFoundationJS__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceConfigForContext:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationControllerForContext:", *(_QWORD *)(a1 + 32));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "modalControllerForContext:", *(_QWORD *)(a1 + 32));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tabBarForContext:", *(_QWORD *)(a1 + 32));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  objc_msgSend(v26, "app");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v25, "appIsTrusted");

}

id __40__IKAppContext_JS__evaluateFoundationJS__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[IKJSDataItem makeDataItem::](IKJSDataItem, "makeDataItem::", a2, a3);
}

id __40__IKAppContext_JS__evaluateFoundationJS__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[IKJSDataSource makeDataSource:::](IKJSDataSource, "makeDataSource:::", a2, a3, a4);
}

- (void)resetFoundationJS
{
  -[IKAppContext setJsApp:](self, "setJsApp:", 0);
  -[IKAppContext setJsFoundation:](self, "setJsFoundation:", 0);
  -[IKAppContext setJsWeakMap:](self, "setJsWeakMap:", 0);
  -[IKAppContext setJsViewModelService:](self, "setJsViewModelService:", 0);
}

- (void)launchAppWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppContext jsContext](self, "jsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ITMLKitGetLogObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[IKAppContext(JS) launchAppWithOptions:].cold.1((uint64_t)v4, v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("App"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toObjectOfClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "launchAppWithOptions:", v4);
}

- (void)exitAppWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[IKAppContext jsContext](self, "jsContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("App"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toObjectOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "exitAppWithOptions:", v4);
  -[IKAppContext jsFoundation](self, "jsFoundation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopTimers");

}

- (void)_evaluateFoundationWithDeviceConfig:(id)a3 addPrivateInterfaces:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  IKJSFoundation *v7;
  void *v8;
  uint64_t v9;
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
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id location[2];

  v4 = a4;
  v6 = a3;
  v7 = -[IKJSFoundation initWithAppContext:deviceConfig:]([IKJSFoundation alloc], "initWithAppContext:deviceConfig:", self, v6);
  -[IKAppContext setJsFoundation:](self, "setJsFoundation:", v7);

  -[IKAppContext jsContext](self, "jsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v9 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke;
    v59[3] = &unk_1E9F4B848;
    objc_copyWeak(&v60, location);
    v10 = (void *)MEMORY[0x1DF092410](v59);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("imageScaleFactor"));

    v57[0] = v9;
    v57[1] = 3221225472;
    v57[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_2;
    v57[3] = &unk_1E9F4B848;
    objc_copyWeak(&v58, location);
    v11 = (void *)MEMORY[0x1DF092410](v57);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("layeredImageScaleFactor"));

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v60);
    v55[0] = v9;
    v55[1] = 3221225472;
    v55[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_3;
    v55[3] = &unk_1E9F4B870;
    objc_copyWeak(&v56, location);
    v12 = (void *)MEMORY[0x1DF092410](v55);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("formatLocalizedNumber"));

    v53[0] = v9;
    v53[1] = 3221225472;
    v53[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_4;
    v53[3] = &unk_1E9F4B898;
    objc_copyWeak(&v54, location);
    v13 = (void *)MEMORY[0x1DF092410](v53);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("formatLocalizedLocaleIdentifier"));

    v51[0] = v9;
    v51[1] = 3221225472;
    v51[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_5;
    v51[3] = &unk_1E9F4B898;
    objc_copyWeak(&v52, location);
    v14 = (void *)MEMORY[0x1DF092410](v51);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("joinComponentsWithLocalizedCommaAndSpace"));

    v49[0] = v9;
    v49[1] = 3221225472;
    v49[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_6;
    v49[3] = &unk_1E9F4B898;
    objc_copyWeak(&v50, location);
    v15 = (void *)MEMORY[0x1DF092410](v49);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("joinComponentsWithLocalizedSemicolonAndSpace"));

    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_183, CFSTR("UUID"));
  v47[0] = v9;
  v47[1] = 3221225472;
  v47[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_8;
  v47[3] = &unk_1E9F4B900;
  objc_copyWeak(&v48, location);
  v16 = (void *)MEMORY[0x1DF092410](v47);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("makeXMLHttpRequest"));

  v45[0] = v9;
  v45[1] = 3221225472;
  v45[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_9;
  v45[3] = &unk_1E9F4B928;
  objc_copyWeak(&v46, location);
  v17 = (void *)MEMORY[0x1DF092410](v45);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("evaluateScripts"));

  v43[0] = v9;
  v43[1] = 3221225472;
  v43[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_10;
  v43[3] = &unk_1E9F4B950;
  objc_copyWeak(&v44, location);
  v18 = (void *)MEMORY[0x1DF092410](v43);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("setInterval"));

  v41[0] = v9;
  v41[1] = 3221225472;
  v41[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_11;
  v41[3] = &unk_1E9F4B978;
  objc_copyWeak(&v42, location);
  v19 = (void *)MEMORY[0x1DF092410](v41);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("clearInterval"));

  v39[0] = v9;
  v39[1] = 3221225472;
  v39[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_12;
  v39[3] = &unk_1E9F4B950;
  objc_copyWeak(&v40, location);
  v20 = (void *)MEMORY[0x1DF092410](v39);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("setTimeout"));

  v37[0] = v9;
  v37[1] = 3221225472;
  v37[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_13;
  v37[3] = &unk_1E9F4B978;
  objc_copyWeak(&v38, location);
  v21 = (void *)MEMORY[0x1DF092410](v37);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("clearTimeout"));

  v35[0] = v9;
  v35[1] = 3221225472;
  v35[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_14;
  v35[3] = &unk_1E9F4B9A0;
  objc_copyWeak(&v36, location);
  v22 = (void *)MEMORY[0x1DF092410](v35);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("formatDate"));

  v33[0] = v9;
  v33[1] = 3221225472;
  v33[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_15;
  v33[3] = &unk_1E9F4B898;
  objc_copyWeak(&v34, location);
  v23 = (void *)MEMORY[0x1DF092410](v33);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("formatDuration"));

  v31[0] = v9;
  v31[1] = 3221225472;
  v31[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_16;
  v31[3] = &unk_1E9F4B9C8;
  objc_copyWeak(&v32, location);
  v24 = (void *)MEMORY[0x1DF092410](v31);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("formatNumber"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_220, CFSTR("canOpenURL"));
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_18;
  v29[3] = &unk_1E9F4BA58;
  objc_copyWeak(&v30, location);
  v25 = (void *)MEMORY[0x1DF092410](v29);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("openURL"));

  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_20;
  v27[3] = &unk_1E9F4BAA8;
  objc_copyWeak(&v28, location);
  v26 = (void *)MEMORY[0x1DF092410](v27);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("getActiveDocument"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_235, CFSTR("sort"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_240, CFSTR("atob"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_245, CFSTR("btoa"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_249, CFSTR("localizedUppercaseString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_252, CFSTR("localizedLowercaseString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_255, CFSTR("localizedCapitalizedString"));
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(location);

}

double __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  float v5;
  id WeakRetained;

  v3 = a2;
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "floatValue");
    v4 = v5;
  }
  if (v4 != 3.0 && v4 != 1.0 && v4 != 2.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("Invalid Display Scale"));

    v4 = 1.0;
  }

  return v4;
}

double __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  float v5;
  id WeakRetained;

  v3 = a2;
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "floatValue");
    v4 = v5;
  }
  if (v4 != 3.0 && v4 != 1.0 && v4 != 2.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("Invalid Display Scale"));

    v4 = 1.0;
  }

  return v4;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *WeakRetained;
  void *v22;
  void *v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a2, "toObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isString"))
  {
    objc_msgSend(v11, "toString");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v12, "isString"))
  {
    objc_msgSend(v12, "toString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v13, "isString"))
  {
    objc_msgSend(v13, "toString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v24 = v11;
  if (objc_msgSend(v14, "isString"))
  {
    objc_msgSend(v14, "toString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatLocalizedNumber:style:postiveFormat:negativeFormat:currencyCode:", v15, v20, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatLocalizedNumber expects a Number object"));
    v22 = 0;
  }

  return v22;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *WeakRetained;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isString"))
  {
    objc_msgSend(v3, "toString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatLocalizedLocaleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatLocalizedLocaleIdentifier expects a String object"));
    v6 = 0;
  }

  return v6;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *WeakRetained;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isArray"))
  {
    objc_msgSend(v3, "toArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "joinComponentsWithLocalizedCommaAndSpace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("joinComponentsWithLocalizedCommaAndSpace expects a String object"));
    v6 = 0;
  }

  return v6;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *WeakRetained;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isArray"))
  {
    objc_msgSend(v3, "toArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "joinComponentsWithLocalizedSemicolonAndSpace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("joinComponentsWithLocalizedSemicolonAndSpace expects a String object"));
    v6 = 0;
  }

  return v6;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_7()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

IKJSXMLHTTPRequest *__77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_8(uint64_t a1)
{
  IKJSXMLHTTPRequest *v2;
  id WeakRetained;
  IKJSXMLHTTPRequest *v4;

  v2 = [IKJSXMLHTTPRequest alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = -[IKJSXMLHTTPRequest initWithAppContext:jingleRequest:](v2, "initWithAppContext:jingleRequest:", WeakRetained, 0);

  return v4;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  IKScriptsEvaluator *v7;
  id WeakRetained;
  IKScriptsEvaluator *v9;

  v5 = a3;
  v6 = a2;
  v7 = [IKScriptsEvaluator alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = -[IKScriptsEvaluator initWithScripts:withContext:callback:jingleRequest:](v7, "initWithScripts:withContext:callback:jingleRequest:", v6, WeakRetained, v5, 0);

  -[IKScriptsEvaluator evaluate](v9, "evaluate");
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "jsFoundation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterval:time:", v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_11(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "jsFoundation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearInterval:", v3);

}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "jsFoundation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeout:time:", v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_13(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "jsFoundation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearTimeout:", v3);

}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *WeakRetained;
  void *v9;

  v5 = a3;
  objc_msgSend(a2, "toObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isString"))
  {
    objc_msgSend(v5, "toString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatDate:format:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatDate expects a Date object"));
    v9 = 0;
  }

  return v9;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  void *v5;

  objc_msgSend(a2, "toObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatDuration:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatDuration expects a Number object"));
    v5 = 0;
  }

  return v5;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *WeakRetained;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(a2, "toObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isString"))
  {
    objc_msgSend(v9, "toString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v10, "isString"))
  {
    objc_msgSend(v10, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v11, "isString"))
  {
    objc_msgSend(v11, "toString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatNumber:style:postiveFormat:negativeFormat:", v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatNumber expects a Number object"));
    v17 = 0;
  }

  return v17;
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_17(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a2)
    return 0;
  v2 = (objc_class *)MEMORY[0x1E0C99E98];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithString:", v3);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenURL:", v4);

  return v6;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E98];
    v7 = a2;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_19;
    v11[3] = &unk_1E9F4BA30;
    v12 = v8;
    v13 = v5;
    v10 = v8;
    objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v11);

  }
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = +[IKUtilites isAppTrusted](IKUtilites, "isAppTrusted");
  objc_msgSend(v3, "app");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_msgSend(v8, "appIsTrusted") & 1) == 0)
      goto LABEL_6;
  }
  else if (!v4)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:", *(_QWORD *)(a1 + 32));

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if ((v6 & 1) == 0)
    goto LABEL_6;
LABEL_7:

}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_20(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_21;
  v4[3] = &unk_1E9F4BA80;
  v4[4] = &v5;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v4);

  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "app");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "activeDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "jsDocument");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  char isKindOfClass;
  void *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7 = 0;
    }
    else
    {
      +[IKUtilites sort:options:](IKUtilites, "sort:options:", v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_23(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0C99D50];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithBase64EncodedString:options:", v3, 0);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  return v5;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  if (objc_msgSend(v2, "isString"))
  {
    objc_msgSend(v2, "toString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v2, "isInstanceOf:", objc_opt_class()))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "toObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v5;
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedUppercaseString");
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_26(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedLowercaseString");
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCapitalizedString");
}

- (IKJSArrayBufferStore)arrayBufferStore
{
  return self->_arrayBufferStore;
}

+ (id)currentAppContext
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("itmlAppContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (IKAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 cache:(BOOL)a5 delegate:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  IKAppContext *v12;
  IKAppContext *v13;
  void *v14;
  id WeakRetained;
  char v16;
  id v17;
  uint64_t v18;
  IKViewElementRegistry *viewElementRegistry;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  NSMutableArray *onStartQueue;
  IKJSArrayBufferStore *v30;
  IKJSArrayBufferStore *arrayBufferStore;
  IKAppCache *v32;
  id v33;
  uint64_t v34;
  IKAppCache *appCache;
  dispatch_source_t v36;
  OS_dispatch_source *lowMemoryWarningSource;
  NSObject *v38;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  +[IKPreference setupJSCoreConsoleLogging](IKPreference, "setupJSCoreConsoleLogging");
  v43.receiver = self;
  v43.super_class = (Class)IKAppContext;
  v12 = -[IKAppContext init](&v43, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_app, v10);
    v13->_remoteInspectionEnabled = 1;
    v13->_running = 0;
    +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_isAirplaneModeEnabled = objc_msgSend(v14, "isAirplaneModeEnabled");

    WeakRetained = objc_loadWeakRetained((id *)&v13->_app);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&v13->_app);
      objc_msgSend(v17, "viewElementRegistry");
      v18 = objc_claimAutoreleasedReturnValue();
      viewElementRegistry = v13->_viewElementRegistry;
      v13->_viewElementRegistry = (IKViewElementRegistry *)v18;

    }
    v13->_appUsesDefaultStyleSheets = 1;
    v20 = objc_loadWeakRetained((id *)&v13->_app);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&v13->_app);
      v13->_appUsesDefaultStyleSheets = objc_msgSend(v22, "appUsesDefaultStyleSheets");

    }
    v23 = objc_loadWeakRetained((id *)&v13->_app);
    v13->_respondsToTraitCollection = objc_opt_respondsToSelector() & 1;

    v13->_mode = a4;
    v24 = objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_delegateFlags.respondsToHighlightViewForOneElement = objc_opt_respondsToSelector() & 1;

    v25 = objc_loadWeakRetained((id *)&v13->_delegate);
    v13->_delegateFlags.respondsToHighlightViewsForManyElements = objc_opt_respondsToSelector() & 1;

    v26 = objc_loadWeakRetained((id *)&v13->_delegate);
    v13->_delegateFlags.respondsToCancelHighlightForAppContext = objc_opt_respondsToSelector() & 1;

    v27 = objc_loadWeakRetained((id *)&v13->_delegate);
    v13->_delegateFlags.respondsToDidInspectElementModeChanged = objc_opt_respondsToSelector() & 1;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v28 = objc_claimAutoreleasedReturnValue();
    onStartQueue = v13->_onStartQueue;
    v13->_onStartQueue = (NSMutableArray *)v28;

    v13->_appScriptTimeoutInterval = 30.0;
    v30 = -[IKJSArrayBufferStore initWithAppContext:]([IKJSArrayBufferStore alloc], "initWithAppContext:", v13);
    arrayBufferStore = v13->_arrayBufferStore;
    v13->_arrayBufferStore = v30;

    v13->_canRequireSystemTrustForXHRs = 1;
    if (!CFPreferencesGetAppBooleanValue(CFSTR("IgnoreCachedJS"), CFSTR("com.apple.ITMLKit"), 0) && v7)
    {
      v32 = [IKAppCache alloc];
      v33 = objc_loadWeakRetained((id *)&v13->_app);
      v34 = -[IKAppCache initWithApplication:](v32, "initWithApplication:", v33);
      appCache = v13->_appCache;
      v13->_appCache = (IKAppCache *)v34;

      -[IKAppCache setDelegate:](v13->_appCache, "setDelegate:", v13);
      -[IKAppCache setAppContextDelegate:](v13->_appCache, "setAppContextDelegate:", v11);
      -[IKAppCache cleanBlobStorageWithCompletion:](v13->_appCache, "cleanBlobStorageWithCompletion:", 0);
    }
    v36 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, MEMORY[0x1E0C80D38]);
    lowMemoryWarningSource = v13->_lowMemoryWarningSource;
    v13->_lowMemoryWarningSource = (OS_dispatch_source *)v36;

    if (v13->_lowMemoryWarningSource)
    {
      objc_initWeak(&location, v13);
      v38 = v13->_lowMemoryWarningSource;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __56__IKAppContext_initWithApplication_mode_cache_delegate___block_invoke;
      v40[3] = &unk_1E9F4BCC8;
      objc_copyWeak(&v41, &location);
      dispatch_source_set_event_handler(v38, v40);
      dispatch_resume((dispatch_object_t)v13->_lowMemoryWarningSource);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

void __56__IKAppContext_initWithApplication_mode_cache_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isValid");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "evaluate:completionBlock:", &__block_literal_global_11, 0);
      v2 = v4;
    }
  }

}

void __56__IKAppContext_initWithApplication_mode_cache_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  JSGarbageCollect((JSContextRef)objc_msgSend(a2, "JSGlobalContextRef"));
}

- (IKAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  IKAppContext *v12;

  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "appJSCachePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = -[IKAppContext initWithApplication:mode:cache:delegate:](self, "initWithApplication:mode:cache:delegate:", v8, a4, objc_msgSend(v11, "length") != 0, v9);

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IKAppContext;
  -[IKAppContext dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_1D95F2000, v0, v1, "We have a preferredLaunchURL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __21__IKAppContext_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ITMLKitGetLogObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __21__IKAppContext_start__block_invoke_cold_1();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __21__IKAppContext_start__block_invoke_86;
    v9[3] = &unk_1E9F4C198;
    objc_copyWeak(&v11, (id *)(a1 + 48));
    v10 = v5;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "contextDidFailWithError:", v8);

  }
}

void __21__IKAppContext_start__block_invoke_86(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_prepareStartWithURL:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __21__IKAppContext_start__block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  id v27;
  void **v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD block[5];
  id v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
    goto LABEL_19;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__14;
  v55 = __Block_byref_object_dispose__14;
  v56 = 0;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(WeakRetained, "appCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    ITMLKitGetLogObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __21__IKAppContext_start__block_invoke_2_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(WeakRetained, "appCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __21__IKAppContext_start__block_invoke_88;
    v46[3] = &unk_1E9F4D3E0;
    objc_copyWeak(&v50, v2);
    v49 = &v51;
    v47 = a1[4];
    v16 = v4;
    v48 = v16;
    objc_msgSend(v15, "appJSURLWithCompletion:", v46);

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v50);
  }
  if (!v52[5])
  {
    +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isNetworkReachable") & 1) == 0)
    {
      v18 = a1[5];

      if (!v18)
        goto LABEL_13;
      ITMLKitGetLogObject(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __21__IKAppContext_start__block_invoke_2_cold_2((uint64_t)(a1 + 5), v19, v20, v21, v22, v23, v24, v25);

      v26 = v52;
      v27 = a1[5];
      v17 = (void *)v26[5];
      v26[5] = (uint64_t)v27;
    }

  }
LABEL_13:
  if (!v52[5])
  {
    v29 = a1[4];
    v28 = a1 + 4;
    if (v29)
    {
      ITMLKitGetLogObject(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        __21__IKAppContext_start__block_invoke_2_cold_1((uint64_t)v28, v30, v31, v32, v33, v34, v35, v36);

      +[IKURLBagCache sharedCache](IKURLBagCache, "sharedCache");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *v28;
      v42[0] = v6;
      v42[1] = 3221225472;
      v42[2] = __21__IKAppContext_start__block_invoke_90;
      v42[3] = &unk_1E9F4D408;
      v45 = &v51;
      v43 = v38;
      v39 = v4;
      v44 = v39;
      objc_msgSend(v37, "loadValueForKey:completion:", v43, v42);

      dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __21__IKAppContext_start__block_invoke_91;
  block[3] = &unk_1E9F4D430;
  objc_copyWeak(&v41, v2);
  block[4] = &v51;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v41);

  _Block_object_dispose(&v51, 8);
LABEL_19:

}

void __21__IKAppContext_start__block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;

  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_16;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    ITMLKitGetLogObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __21__IKAppContext_start__block_invoke_88_cold_1(a1 + 48, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_msgSend(WeakRetained, "nextJSChecksum");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "isEqualToString:", v16);

  objc_msgSend(WeakRetained, "app");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appJSURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    if (v6)
      v20 = v17;
    else
      v20 = 1;
LABEL_14:
    if ((v20 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "appCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "refreshWithCompletion:", 0);

    }
    goto LABEL_16;
  }
  v21 = *(_QWORD *)(a1 + 32);

  if (v6)
    v20 = v17;
  else
    v20 = 1;
  if (v21)
    goto LABEL_14;
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __21__IKAppContext_start__block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    ITMLKitGetLogObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __21__IKAppContext_start__block_invoke_90_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __21__IKAppContext_start__block_invoke_91(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", WeakRetained, sel__networkPropertiesChanged_, CFSTR("IKNetworkPropertiesChangedNotification"), 0);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(WeakRetained, "_prepareStartWithURL:");
    }
    else
    {
      objc_msgSend(WeakRetained, "app");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appJSURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_prepareStartWithURL:", v4);

    }
  }

}

- (void)suspendWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__IKAppContext_suspendWithOptions___block_invoke;
  v6[3] = &unk_1E9F4C198;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[IKAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __35__IKAppContext_suspendWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__IKAppContext_suspendWithOptions___block_invoke_2;
  v3[3] = &unk_1E9F4C1C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v3, 0);

}

void __35__IKAppContext_suspendWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const OpaqueJSContext *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toObjectOfClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
    v5 = *(_QWORD *)(a1 + 32);
  else
    v5 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v7, "suspendAppWithOptions:", v5);
  v6 = (const OpaqueJSContext *)objc_msgSend(v3, "JSGlobalContextRef");

  JSGarbageCollect(v6);
}

- (void)resumeWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__IKAppContext_resumeWithOptions___block_invoke;
  v6[3] = &unk_1E9F4D458;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[IKAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __34__IKAppContext_resumeWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppContext_resumeWithOptions___block_invoke_2;
  v4[3] = &unk_1E9F4C2F0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v4, 0);

}

void __34__IKAppContext_resumeWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[16];

  v3 = a2;
  ITMLKitGetLogObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D95F2000, v4, OS_LOG_TYPE_INFO, "[StartQueue] resumeWithOptions evaluated", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
    v5 = "yes";
  else
    v5 = "no";
  v6 = *(_QWORD *)(a1 + 40);
  v7 = objc_opt_class();
  NSLog(CFSTR("Valid Context? %s. Resume options: %@, class: %@"), v5, v6, v7);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "toObjectOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
    v10 = *(_QWORD *)(a1 + 40);
  else
    v10 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v9, "resumeAppWithOptions:", v10);

}

- (void)openURLWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__IKAppContext_openURLWithOptions___block_invoke;
  v6[3] = &unk_1E9F4C198;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[IKAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __35__IKAppContext_openURLWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__IKAppContext_openURLWithOptions___block_invoke_2;
  v3[3] = &unk_1E9F4C1C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v3, 0);

}

void __35__IKAppContext_openURLWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "openURLWithOptions:", v4);

}

- (void)appTraitCollectionChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__IKAppContext_appTraitCollectionChanged___block_invoke;
  v6[3] = &unk_1E9F4C198;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[IKAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __42__IKAppContext_appTraitCollectionChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__IKAppContext_appTraitCollectionChanged___block_invoke_2;
  v3[3] = &unk_1E9F4C1C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v3, 0);

}

void __42__IKAppContext_appTraitCollectionChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "traitCollectionChanged:", v4);

}

- (void)reload
{
  -[IKAppContext _addStopRecordToPendingQueueWithReload:](self, "_addStopRecordToPendingQueueWithReload:", 1);
}

- (void)stop
{
  -[IKAppContext _addStopRecordToPendingQueueWithReload:](self, "_addStopRecordToPendingQueueWithReload:", 0);
}

- (void)evaluate:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  IKAppContext *v8;
  IKRunLoopSourceRecord *v9;
  IKRunLoopSourceRecord *v10;
  void *v11;
  __CFRunLoopSource *jsThreadRunLoopSource;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (-[IKAppContext canAccessPendingQueue](v8, "canAccessPendingQueue"))
  {
    objc_initWeak(&location, v8);
    v9 = [IKRunLoopSourceRecord alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__IKAppContext_evaluate_completionBlock___block_invoke;
    v16[3] = &unk_1E9F4BCF0;
    objc_copyWeak(&v18, &location);
    v17 = v6;
    v10 = -[IKRunLoopSourceRecord initWithEvaluateBlock:completionBlock:](v9, "initWithEvaluateBlock:completionBlock:", v16, v7);
    -[IKAppContext pendingQueue](v8, "pendingQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

    if (v8->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v8->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v8->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__IKAppContext_evaluate_completionBlock___block_invoke_2;
    v14[3] = &unk_1E9F4C318;
    v15 = v7;
    dispatch_async(v13, v14);

  }
  objc_sync_exit(v8);

}

void __41__IKAppContext_evaluate_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_evaluate:", *(_QWORD *)(a1 + 32));

}

uint64_t __41__IKAppContext_evaluate_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)evaluateDelegateBlockSync:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  dispatch_semaphore_t v9;
  id v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__IKAppContext_evaluateDelegateBlockSync___block_invoke;
  block[3] = &unk_1E9F4C480;
  v9 = v5;
  v10 = v4;
  block[4] = self;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __42__IKAppContext_evaluateDelegateBlockSync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)addPostEvaluateBlock:(id)a3
{
  id v4;
  void *v5;
  IKAppContext *v6;
  void *v7;
  IKRunLoopSourceRecord *v8;
  IKRunLoopSourceRecord *v9;
  void *v10;
  __CFRunLoopSource *jsThreadRunLoopSource;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[IKAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IKAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
    v6 = (IKAppContext *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "copy");
    -[IKAppContext addObject:](v6, "addObject:", v7);

  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    if (-[IKAppContext canAccessPendingQueue](v6, "canAccessPendingQueue"))
    {
      objc_initWeak(&location, v6);
      v8 = [IKRunLoopSourceRecord alloc];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __37__IKAppContext_addPostEvaluateBlock___block_invoke;
      v12[3] = &unk_1E9F4BCF0;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      v9 = -[IKRunLoopSourceRecord initWithEvaluateBlock:completionBlock:](v8, "initWithEvaluateBlock:completionBlock:", v12, 0);
      -[IKAppContext pendingQueue](v6, "pendingQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObject:atIndex:", v9, 0);

      if (v6->_jsThreadRunLoop)
      {
        jsThreadRunLoopSource = v6->_jsThreadRunLoopSource;
        if (jsThreadRunLoopSource)
        {
          CFRunLoopSourceSignal(jsThreadRunLoopSource);
          CFRunLoopWakeUp(v6->_jsThreadRunLoop);
        }
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v6);
  }

}

void __37__IKAppContext_addPostEvaluateBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doEvaluate:", *(_QWORD *)(a1 + 32));

}

- (void)setException:(id)a3 withErrorMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[IKAppContext jsContext](self, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v11, v7);
  else
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithNewErrorFromMessage:inContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithBool:inContext:", 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("errorDispatched"));

  objc_msgSend(v7, "setException:", v8);
  -[IKAppContext _errorWithMessage:](self, "_errorWithMessage:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppContext _dispatchError:](self, "_dispatchError:", v10);

}

+ (void)registerPrivateProtocols:(id)a3 forClass:(Class)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (a4 && v7)
  {
    objc_msgSend(a1, "currentAppContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "isPrivileged"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            class_addProtocol(a4, *(Protocol **)(*((_QWORD *)&v15 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v12);
      }

    }
  }

}

- (BOOL)validateDOMDocument:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  -[IKAppContext delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IKAppContext jsContext](self, "jsContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v9 = objc_msgSend(v7, "appContext:validateDOMDocument:inContext:error:", self, v6, v8, &v15);
    v10 = v15;

    if ((v9 & 1) == 0 && a4 && v10)
    {
      if (objc_msgSend(v10, "code") == 2)
        v11 = 201;
      else
        v11 = 200;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v10, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), v11, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)handleReloadWithUrgencyType:(unint64_t)a3 minInterval:(double)a4 data:(id)a5
{
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12[3];
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke;
  block[3] = &unk_1E9F4D480;
  objc_copyWeak(v12, &location);
  v11 = v8;
  v12[1] = (id)a3;
  v12[2] = *(id *)&a4;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setReloadData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "setReloadContext:", v3);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = CFSTR("IKAppReloadUrgencyMinSuspensionTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appContext:needsReloadWithUrgency:options:", WeakRetained, v5, v7);

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    ITMLKitGetLogObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(WeakRetained, v6);
    goto LABEL_7;
  }
  objc_msgSend(WeakRetained, "setReloadContext:", v3);
  objc_msgSend(v4, "appContext:needsReloadWithUrgency:", WeakRetained, *(_QWORD *)(a1 + 48));
LABEL_8:

}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  -[IKAppContext setResponseError:](self, "setResponseError:", a4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    -[IKAppContext setResponseScript:](self, "setResponseScript:", v5);

  }
}

- (BOOL)_prepareStartWithURL:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  IKAppContext *v25;
  void *v26;
  void *v27;
  id v28;
  IKRunLoopSourceRecord *v29;
  void *v30;
  IKRunLoopSourceRecord *v31;
  IKRunLoopSourceRecord *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  char v44;
  id location;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  IKAppContext *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = -[IKAppContext mode](self, "mode");
  v6 = v4;
  if (!v6)
    goto LABEL_25;
  ITMLKitGetLogObject(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[IKAppContext mode](self, "mode");
    *(_DWORD *)buf = 138412802;
    v47 = v9;
    v48 = 2048;
    v49 = v10;
    v50 = 2048;
    v51 = self;
    _os_log_impl(&dword_1D95F2000, v7, OS_LOG_TYPE_INFO, "<%@ (%lu): %p> Launching JavaScript app", buf, 0x20u);

  }
  if (+[IKAppContext isInFactoryMode](IKAppContext, "isInFactoryMode"))
    goto LABEL_5;
  v13 = +[IKUtilites isAppTrusted](IKUtilites, "isAppTrusted");
  -[IKAppContext app](self, "app");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0)
  {
    if (!v13)
      goto LABEL_9;
LABEL_12:
    v11 = 1;
    v12 = 1;
    goto LABEL_13;
  }
  -[IKAppContext app](self, "app");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "appIsTrusted");

  if ((v17 & 1) != 0)
    goto LABEL_12;
LABEL_9:
  -[IKAppContext app](self, "app");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
  {
LABEL_5:
    v11 = 0;
    v12 = 0;
    goto LABEL_13;
  }
  -[IKAppContext app](self, "app");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v20, "appIsPrivileged");

  v11 = 0;
LABEL_13:
  -[IKAppContext setPrivileged:](self, "setPrivileged:", v12);
  objc_msgSend(v6, "scheme");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lowercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isEqualToString:", CFSTR("https")))
  {
    -[IKAppContext app](self, "app");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "shouldIgnoreJSValidation");

    if ((v24 & 1) != 0)
      goto LABEL_16;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, 0);
    v25 = (IKAppContext *)objc_claimAutoreleasedReturnValue();
    -[IKAppContext contextDidFailWithError:](self, "contextDidFailWithError:", v25);
    LOBYTE(self) = 0;
    goto LABEL_26;
  }

LABEL_16:
  v25 = self;
  objc_sync_enter(v25);
  -[IKAppContext pendingQueue](v25, "pendingQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = v26 == 0;

  if ((_DWORD)self)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IKAppContext setPendingQueue:](v25, "setPendingQueue:", v28);

    -[IKAppContext setCanAccessPendingQueue:](v25, "setCanAccessPendingQueue:", 1);
    if (v5 != 1000)
    {
      v29 = -[IKRunLoopSourceRecord initWithEvaluateBlock:completionBlock:]([IKRunLoopSourceRecord alloc], "initWithEvaluateBlock:completionBlock:", &__block_literal_global_123, 0);
      -[IKAppContext pendingQueue](v25, "pendingQueue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v29);

    }
    v31 = [IKRunLoopSourceRecord alloc];
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __37__IKAppContext__prepareStartWithURL___block_invoke_2;
    v41 = &unk_1E9F4D4C8;
    objc_copyWeak(&v43, &location);
    v42 = v6;
    v44 = v11;
    v32 = -[IKRunLoopSourceRecord initWithEvaluateBlock:completionBlock:](v31, "initWithEvaluateBlock:completionBlock:", &v38, 0);
    -[IKAppContext pendingQueue](v25, "pendingQueue", v38, v39, v40, v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v32);

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", v25, sel__jsThreadMain, 0);
    v35 = v34;
    if (v5 == 1000)
      v36 = 9;
    else
      v36 = 25;
    objc_msgSend(v34, "setQualityOfService:", v36);
    objc_msgSend(v35, "setName:", CFSTR("ITMLKit"));
    objc_msgSend(v35, "start");

    objc_destroyWeak(&v43);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 100, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKAppContext contextDidFailWithError:](v25, "contextDidFailWithError:", v27);

  }
  objc_sync_exit(v25);
LABEL_26:

  objc_destroyWeak(&location);
  return (char)self;
}

uint64_t __37__IKAppContext__prepareStartWithURL___block_invoke()
{
  return +[IKTemplateStyleSheet loadStyleSheets](IKTemplateStyleSheet, "loadStyleSheets");
}

void __37__IKAppContext__prepareStartWithURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startWithURL:urlTrusted:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)_startWithURL:(id)a3 urlTrusted:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_semaphore_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  dispatch_semaphore_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  dispatch_semaphore_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  BOOL v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  objc_class *v67;
  id v68;
  unint64_t v69;
  uint64_t v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  IKAppContext *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  IKAppContext *v79;
  _QWORD v80[4];
  id v81;
  IKAppContext *v82;
  id v83;
  _QWORD v84[4];
  NSObject *v85;
  _QWORD v86[4];
  NSObject *v87;
  _BYTE *v88;
  _QWORD block[6];
  _QWORD v90[4];
  NSObject *v91;
  _BYTE *v92;
  uint64_t *v93;
  _QWORD *v94;
  _QWORD v95[4];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint8_t v102[4];
  id v103;
  __int16 v104;
  unint64_t v105;
  __int16 v106;
  IKAppContext *v107;
  __int16 v108;
  uint64_t v109;
  _BYTE buf[24];
  IKAppContext *v111;
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;

  v4 = a4;
  v114 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  kdebug_trace();
  objc_storeStrong((id *)&self->_resolvedBootURL, a3);
  -[IKAppContext appScriptTimeoutInterval](self, "appScriptTimeoutInterval");
  v9 = v8;
  if (+[IKPreference ignoreHTTPCache](IKPreference, "ignoreHTTPCache"))
  {
    v10 = 1;
  }
  else
  {
    -[IKAppContext reloadContext](self, "reloadContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;

  }
  -[IKAppContext delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F01E4E80))
  {
    -[IKAppContext delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
      goto LABEL_9;
    -[IKAppContext delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "shouldForceIgnoreHTTPCacheForAppContext:", self))
      v10 = 1;
  }

LABEL_9:
  ITMLKitGetLogObject(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = -[IKAppContext mode](self, "mode");
    *(_WORD *)&buf[22] = 2048;
    v111 = self;
    _os_log_impl(&dword_1D95F2000, v15, OS_LOG_TYPE_INFO, "<%@ (%lu): %p> Attempting to start context with script", buf, 0x20u);

  }
  -[IKAppContext delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "conformsToProtocol:", &unk_1F020C928))
  {
    -[IKAppContext delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

  }
  else
  {
    v20 = 0;
  }

  -[IKAppContext setTrusted:](self, "setTrusted:", v4);
  if (objc_msgSend(v7, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v7, 4, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self, "_startWithScript:scriptUrl:wasLoadedFromFallback:", v21, v7, 0);
    goto LABEL_71;
  }
  if ((v20 & 1) != 0)
  {
    ITMLKitGetLogObject(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D95F2000, v22, OS_LOG_TYPE_INFO, "Fetch application script using App Script Loader", buf, 2u);
    }

    v23 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v111 = (IKAppContext *)__Block_byref_object_copy__14;
    v112 = __Block_byref_object_dispose__14;
    v113 = 0;
    v96 = 0;
    v97 = &v96;
    v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__14;
    v100 = __Block_byref_object_dispose__14;
    v101 = 0;
    v95[0] = 0;
    v95[1] = v95;
    v95[2] = 0x2020000000;
    v95[3] = 0;
    -[IKAppContext delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke;
    v90[3] = &unk_1E9F4D4F0;
    v92 = buf;
    v93 = &v96;
    v94 = v95;
    v21 = v23;
    v91 = v21;
    objc_msgSend(v24, "appContext:scriptForURL:cachePolicy:completion:", self, v7, v10, v90);
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (v97[5] || !objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length"))
    {
      -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
      ITMLKitGetLogObject(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v68 = (id)objc_claimAutoreleasedReturnValue();
        v69 = -[IKAppContext mode](self, "mode");
        v70 = v97[5];
        *(_DWORD *)v102 = 138413058;
        v103 = v68;
        v104 = 2048;
        v105 = v69;
        v106 = 2048;
        v107 = self;
        v108 = 2112;
        v109 = v70;
        _os_log_error_impl(&dword_1D95F2000, v26, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v102, 0x2Au);

      }
      block[0] = v25;
      block[1] = 3221225472;
      block[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_229;
      block[3] = &unk_1E9F4C0D0;
      block[4] = self;
      block[5] = v95;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      ITMLKitGetLogObject(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v102 = 0;
        _os_log_impl(&dword_1D95F2000, v32, OS_LOG_TYPE_INFO, "Downloaded application script sussessfully. Starting script...", v102, 2u);
      }

      -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self, "_startWithScript:scriptUrl:wasLoadedFromFallback:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v7, 0);
    }

    _Block_object_dispose(v95, 8);
    _Block_object_dispose(&v96, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_71;
  }
  if (v4)
  {
    v27 = 1;
    goto LABEL_34;
  }
  if (!+[IKUtilites isAppleTV](IKUtilites, "isAppleTV"))
  {
    objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activeAccount");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "uniqueIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserIdentifier:", v36);

    objc_msgSend(MEMORY[0x1E0DAF658], "URLBagForContext:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v111) = 0;
    v38 = dispatch_semaphore_create(0);
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_2;
    v86[3] = &unk_1E9F4BF40;
    v88 = buf;
    v39 = v38;
    v87 = v39;
    objc_msgSend(v37, "getTrustForURL:completionBlock:", v7, v86);
    dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    v27 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    -[IKAppContext setTrusted:](self, "setTrusted:");

    _Block_object_dispose(buf, 8);
LABEL_34:
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C8]), "initWithURL:", v7);
    v21 = v40;
    if (v10)
      -[NSObject setCachePolicy:](v40, "setCachePolicy:", 1);
    -[NSObject setAllowedRetryCount:](v21, "setAllowedRetryCount:", 0);
    -[NSObject setTimeoutInterval:](v21, "setTimeoutInterval:", v9);
    -[IKAppContext delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v41, "sourceApplicationBundleIdentifierForContext:", self);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClientAuditBundleIdentifier:](v21, "setClientAuditBundleIdentifier:", v42);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v41, "sourceApplicationAuditTokenDataForContext:", self);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClientAuditTokenData:](v21, "setClientAuditTokenData:", v43);

    }
    if (v27)
    {
      v44 = objc_alloc_init(MEMORY[0x1E0DDC1B0]);
      objc_msgSend(v44, "setNeedsURLBag:", 0);
      objc_msgSend(v44, "setUrlKnownToBeTrusted:", 1);
      +[IKJSITunesStore setITunesStoreHeaders:](IKJSITunesStore, "setITunesStoreHeaders:", v21);
    }
    else
    {
      v44 = objc_alloc_init(MEMORY[0x1E0DDC1C0]);
    }
    objc_msgSend(v44, "setDelegate:", self);
    v45 = (void *)objc_opt_new();
    objc_msgSend(v44, "setDataProvider:", v45);

    objc_msgSend(v44, "setRequestProperties:", v21);
    objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addOperation:", v44);

    v47 = dispatch_semaphore_create(0);
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_3;
    v84[3] = &unk_1E9F4BD18;
    v48 = v47;
    v85 = v48;
    objc_msgSend(v44, "setCompletionBlock:", v84);
    dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);
    v49 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v44, "response");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "numberWithInteger:", objc_msgSend(v50, "itunes_statusCode"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKAppContext responseError](self, "responseError");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      -[IKAppContext appScriptFallbackHandler](self, "appScriptFallbackHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKAppContext responseError](self, "responseError");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "canFallbackForError:", v53);

      if (v54)
      {
        ITMLKitGetLogObject(0);
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          -[IKAppContext _startWithURL:urlTrusted:].cold.4((uint64_t)self, v55);

        -[IKAppContext appScriptFallbackHandler](self, "appScriptFallbackHandler");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0;
        objc_msgSend(v56, "retrieveScript:", &v83);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v83;

        if (v57)
        {
          -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self, "_startWithScript:scriptUrl:wasLoadedFromFallback:", v57, v7, 1);
        }
        else
        {
          -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
          ITMLKitGetLogObject(0);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            -[IKAppContext _startWithURL:urlTrusted:].cold.3(self);

          ITMLKitGetLogObject(0);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            -[IKAppContext _startWithURL:urlTrusted:].cold.2(self);

          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_242;
          v80[3] = &unk_1E9F4C170;
          v81 = v71;
          v82 = self;
          dispatch_async(MEMORY[0x1E0C80D38], v80);

        }
        goto LABEL_70;
      }
    }
    -[IKAppContext responseError](self, "responseError");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {

    }
    else
    {
      -[IKAppContext responseScript](self, "responseScript");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "length") == 0;

      if (!v62)
      {
        -[IKAppContext responseScript](self, "responseScript");
        v58 = (id)objc_claimAutoreleasedReturnValue();
        -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self, "_startWithScript:scriptUrl:wasLoadedFromFallback:", v58, v7, 0);
LABEL_70:

        -[IKAppContext setResponseScript:](self, "setResponseScript:", 0);
        -[IKAppContext setResponseError:](self, "setResponseError:", 0);

        goto LABEL_71;
      }
    }
    -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
    ITMLKitGetLogObject(0);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[IKAppContext _startWithURL:urlTrusted:].cold.1(self);

    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_243;
    v77[3] = &unk_1E9F4C170;
    v78 = v71;
    v79 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v77);
    v58 = v78;
    goto LABEL_70;
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:cachePolicy:timeoutInterval:", v7, v10, v9);
  v75 = 0;
  v76 = 0;
  objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v21, &v76, &v75);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v76;
  v30 = v75;
  if (v30 || !objc_msgSend(v28, "length"))
    v31 = 0;
  else
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v28, 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v29, "itunes_statusCode"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
  {
    -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self, "_startWithScript:scriptUrl:wasLoadedFromFallback:", v31, v7, 0);
  }
  else
  {
    -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
    ITMLKitGetLogObject(0);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[IKAppContext _startWithURL:urlTrusted:].cold.5(self);

    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_246;
    v72[3] = &unk_1E9F4C170;
    v73 = v63;
    v74 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v72);

  }
LABEL_71:

}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a4;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_229(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = CFSTR("ITMLKitErrorHTTPStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contextDidFailWithError:", v5);
}

intptr_t __41__IKAppContext__startWithURL_urlTrusted___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __41__IKAppContext__startWithURL_urlTrusted___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_242(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("ITMLKitErrorHTTPStatus");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contextDidFailWithError:", v5);
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_243(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("ITMLKitErrorHTTPStatus");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contextDidFailWithError:", v5);
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_246(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("ITMLKitErrorHTTPStatus");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contextDidFailWithError:", v5);
}

- (void)_startWithScript:(id)a3 scriptUrl:(id)a4 wasLoadedFromFallback:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  id v20;
  char v21;
  id v22;
  id v23;
  IKJSInspectorController *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  objc_class *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  IKAppContext *v40;
  _QWORD block[5];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  IKAppContext *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    -[IKAppContext delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1F01E4E80) & 1) != 0)
    {
      -[IKAppContext delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[IKAppContext delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "appContext:shouldStartWithScript:scriptURL:loadedFromFallback:", self, v8, v9, v5);

        if ((v14 & 1) == 0)
        {
          ITMLKitGetLogObject(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:].cold.2((uint64_t)self, (uint64_t)v9, v15);

          -[IKAppContext stop](self, "stop");
          goto LABEL_24;
        }
      }
    }
    else
    {

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_app);
    objc_msgSend(WeakRetained, "appIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[IKAppContext remoteInspectionEnabled](self, "remoteInspectionEnabled");
    v20 = objc_loadWeakRetained((id *)&self->_app);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->_app);
      v19 = objc_msgSend(v22, "shouldAllowRemoteInspection");

    }
    JSRemoteInspectorGetInspectionEnabledByDefault();
    JSRemoteInspectorSetInspectionEnabledByDefault();
    v23 = objc_alloc_init(MEMORY[0x1E0CBE0F0]);
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v23, "setName:", v18);
    objc_msgSend(v23, "_setITMLDebuggableType");
    objc_msgSend(v23, "_setDebuggerRunLoop:", self->_jsThreadRunLoop);
    objc_msgSend(v23, "_setRemoteInspectionEnabled:", v19);
    JSRemoteInspectorSetInspectionEnabledByDefault();
    -[IKAppContext setJsContext:](self, "setJsContext:", v23);
    v24 = -[IKJSInspectorController initWithAppContext:]([IKJSInspectorController alloc], "initWithAppContext:", self);
    -[IKJSInspectorController setDelegate:](v24, "setDelegate:", self);
    -[IKAppContext setWebInspectorController:](self, "setWebInspectorController:", v24);
    -[IKAppContext evaluateFoundationJS](self, "evaluateFoundationJS");
    +[IKDOMNode setup](IKDOMNode, "setup");
    v25 = (id)objc_msgSend(v23, "evaluateScript:withSourceURL:", v8, v9);
    objc_msgSend(v23, "exception");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v23, "exception");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ITMLKitGetLogObject(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[IKAppContext mode](self, "mode");
        objc_msgSend(v27, "toDictionary");
        *(_DWORD *)buf = 138413570;
        v43 = v32;
        v44 = 2048;
        v45 = v33;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v9;
        v50 = 2112;
        v51 = v27;
        v52 = 2112;
        v53 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v53;
        _os_log_error_impl(&dword_1D95F2000, v28, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Unable to start script (%@) because of %@: %@", buf, 0x3Eu);

      }
      objc_msgSend(v23, "setException:", 0);
      -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_253;
      v38[3] = &unk_1E9F4C170;
      v39 = v27;
      v40 = self;
      v29 = v27;
      dispatch_async(MEMORY[0x1E0C80D38], v38);

    }
    else
    {
      -[IKAppContext setIsValid:](self, "setIsValid:", 1);
      if (!v5)
      {
        -[IKAppContext appScriptFallbackHandler](self, "appScriptFallbackHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "scriptEvaluated:", v8);

      }
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_2;
      v35[3] = &unk_1E9F4D518;
      v35[4] = self;
      v37 = v5;
      v36 = v8;
      -[IKAppContext _evaluate:](self, "_evaluate:", v35);

    }
  }
  else
  {
    ITMLKitGetLogObject(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:].cold.1();

    -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke;
    block[3] = &unk_1E9F4BD18;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_24:

}

void __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contextDidFailWithError:", v2);

}

void __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_253(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(*(id *)(a1 + 32), "toDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contextDidFailWithError:", v4);
}

void __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_2(uint64_t a1)
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
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;

  if (objc_msgSend(*(id *)(a1 + 32), "mode") == 1000)
    goto LABEL_29;
  objc_msgSend(*(id *)(a1 + 32), "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "app");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bagBootURLKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "app");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offlineJSURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "app");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "app");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appLaunchParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    goto LABEL_12;
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "resolvedBootURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolvedBootURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v7);

  if ((v14 & 1) == 0)
  {
    if (!v4)
      goto LABEL_17;
    v15 = (void *)MEMORY[0x1E0C99E98];
    +[IKURLBagCache sharedCache](IKURLBagCache, "sharedCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = v18;
      v20 = v19;
    }
    else
    {
LABEL_17:
      objc_msgSend(*(id *)(a1 + 32), "app");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appJSURL");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;

    v12 = v21;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("location"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !v22)
  {
    objc_msgSend(v12, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v23, CFSTR("location"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_preferredLaunchURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "reloadContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reloadData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "reloadContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reloadData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v28, CFSTR("reloadData"));

  }
  if (v24)
  {
    objc_msgSend(v24, "absoluteString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v29, CFSTR("itml.location"));

  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("itml.loadedFromFallback"));
  v30 = *(void **)(a1 + 32);
  v31 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v30, "launchAppWithOptions:", v31);

LABEL_29:
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_3;
  v33[3] = &unk_1E9F4C170;
  v32 = *(void **)(a1 + 40);
  v33[4] = *(_QWORD *)(a1 + 32);
  v34 = v32;
  dispatch_async(MEMORY[0x1E0C80D38], v33);

}

uint64_t __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contextDidStartWithJS:options:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_addStopRecordToPendingQueueWithReload:(BOOL)a3
{
  IKAppContext *v4;
  IKRunLoopSourceRecord *v5;
  IKRunLoopSourceRecord *v6;
  void *v7;
  __CFRunLoopSource *jsThreadRunLoopSource;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  v4 = self;
  objc_sync_enter(v4);
  if (-[IKAppContext canAccessPendingQueue](v4, "canAccessPendingQueue"))
  {
    -[IKAppContext setCanAccessPendingQueue:](v4, "setCanAccessPendingQueue:", 0);
    objc_initWeak(&location, v4);
    v5 = [IKRunLoopSourceRecord alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__IKAppContext__addStopRecordToPendingQueueWithReload___block_invoke;
    v9[3] = &unk_1E9F4D540;
    objc_copyWeak(&v10, &location);
    v11 = a3;
    v6 = -[IKRunLoopSourceRecord initWithEvaluateBlock:completionBlock:](v5, "initWithEvaluateBlock:completionBlock:", v9, 0);
    -[IKAppContext pendingQueue](v4, "pendingQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

    if (v4->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v4->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);

}

void __55__IKAppContext__addStopRecordToPendingQueueWithReload___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopAndReload:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_stopAndReload:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  IKAppContext *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("IKNetworkPropertiesChangedNotification"), 0);

  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__IKAppContext__stopAndReload___block_invoke;
  v11[3] = &unk_1E9F4D568;
  v11[4] = self;
  v12 = a3;
  -[IKAppContext _evaluate:](self, "_evaluate:", v11);
  -[IKAppContext setIsValid:](self, "setIsValid:", 0);
  -[IKAppContext resetFoundationJS](self, "resetFoundationJS");
  -[IKAppContext setJsContext:](self, "setJsContext:", 0);
  if (a3)
  {
    -[IKAppContext setWebInspectorController:](self, "setWebInspectorController:", 0);
    -[IKAppContext _invalidateJSThread](self, "_invalidateJSThread");
  }
  else
  {
    -[IKAppContext setNextJSChecksum:](self, "setNextJSChecksum:", 0);
    v7 = self;
    objc_sync_enter(v7);
    -[IKAppContext onStartQueue](v7, "onStartQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    objc_sync_exit(v7);
    -[IKAppContext setWebInspectorController:](v7, "setWebInspectorController:", 0);
    -[IKAppContext _invalidateJSThread](v7, "_invalidateJSThread");
    -[IKAppContext setReloadContext:](v7, "setReloadContext:", 0);
  }
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __31__IKAppContext__stopAndReload___block_invoke_2;
  v9[3] = &unk_1E9F4D590;
  v9[4] = self;
  v10 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v9);
}

void __31__IKAppContext__stopAndReload___block_invoke(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = CFSTR("true");
  if (!*(_BYTE *)(a1 + 40))
    v2 = CFSTR("false");
  v4 = CFSTR("reloading");
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "exitAppWithOptions:", v3);

}

uint64_t __31__IKAppContext__stopAndReload___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "contextDidStopWithOptions:", 0);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "start");
  return result;
}

- (void)_jsThreadMain
{
  void *v3;
  IKAppContext *v4;
  CFRunLoopRef Current;
  __CFRunLoopSource *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  CFRunLoopRunResult v11;
  IKAppContext *v12;
  __CFRunLoopSource *jsThreadRunLoopSource;
  IKAppContext *v15;
  void *v16;
  CFRunLoopSourceContext v17;

  v3 = (void *)MEMORY[0x1DF092260](self, a2);
  v17.version = 0;
  v17.info = self;
  memset(&v17.retain, 0, 40);
  v17.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))IKRunLoopSourceScheduleCallBack;
  v17.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))IKRunLoopSourceCancelCallBack;
  v17.perform = (void (__cdecl *)(void *))IKRunLoopSourcePerformCallBack;
  v4 = self;
  objc_sync_enter(v4);
  Current = CFRunLoopGetCurrent();
  v4->_jsThreadRunLoop = Current;
  CFRetain(Current);
  v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v17);
  v4->_jsThreadRunLoopSource = v6;
  v7 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread", v17.version, v17.info, *(_OWORD *)&v17.retain, *(_OWORD *)&v17.copyDescription, v17.hash, v17.schedule, v17.cancel, v17.perform);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("itmlAppContext"));

  objc_sync_exit(v4);
  do
  {
    v10 = (void *)MEMORY[0x1DF092260]();
    v11 = CFRunLoopRunInMode(v7, 1.0e10, 1u);
    objc_autoreleasePoolPop(v10);
    v12 = v4;
    objc_sync_enter(v12);
    jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
    objc_sync_exit(v12);

  }
  while ((v11 - 3) <= 0xFFFFFFFD && jsThreadRunLoopSource == v6);
  v15 = v12;
  objc_sync_enter(v15);
  objc_msgSend(v8, "threadDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", CFSTR("itmlAppContext"));
  CFRelease(v6);
  CFRelease(Current);

  objc_sync_exit(v15);
  objc_autoreleasePoolPop(v3);
}

- (void)_sourceScheduledOnRunLoop:(__CFRunLoop *)a3
{
  CFRunLoopSourceSignal(self->_jsThreadRunLoopSource);
  CFRunLoopWakeUp(self->_jsThreadRunLoop);
}

- (void)_sourcePerform
{
  IKAppContext *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(void);
  uint64_t v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v2 = self;
  objc_sync_enter(v2);
  -[IKAppContext pendingQueue](v2, "pendingQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __30__IKAppContext__sourcePerform__block_invoke;
  v15[3] = &unk_1E9F4D5B8;
  v15[4] = v2;
  v5 = v3;
  v16 = v5;
  v6 = (void (**)(void))MEMORY[0x1DF092410](v15);
  v6[2]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(v8, "evaluateBlock");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

      objc_msgSend(v8, "completionBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        dispatch_get_global_queue(0, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = v4;
        block[1] = 3221225472;
        block[2] = __30__IKAppContext__sourcePerform__block_invoke_2;
        block[3] = &unk_1E9F4BD18;
        v14 = v8;
        dispatch_async(v11, block);

      }
      ((void (*)(void (**)(void)))v6[2])(v6);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    while (v12);
  }

}

id __30__IKAppContext__sourcePerform__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
  objc_sync_exit(v2);

  return v3;
}

void __30__IKAppContext__sourcePerform__block_invoke_2(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 1);

}

- (void)_sourceCanceledOnRunLoop:(__CFRunLoop *)a3
{
  IKAppContext *obj;

  obj = self;
  objc_sync_enter(obj);
  CFRunLoopRemoveSource(obj->_jsThreadRunLoop, obj->_jsThreadRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRunLoopStop(obj->_jsThreadRunLoop);
  objc_sync_exit(obj);

}

- (void)_evaluate:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppContext setPostEvaluationBlocks:](self, "setPostEvaluationBlocks:", v4);

  -[IKAppContext _doEvaluate:](self, "_doEvaluate:", v16);
  -[IKAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      -[IKAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

      -[IKAppContext jsContext](self, "jsContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v8);

      -[IKAppContext jsContext](self, "jsContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exception");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[IKAppContext jsContext](self, "jsContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "exception");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKAppContext _dispatchError:](self, "_dispatchError:", v12);

        -[IKAppContext jsContext](self, "jsContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setException:", 0);

      }
      -[IKAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void (**)(_QWORD, _QWORD))v15;
    }
    while (v15);
  }
  -[IKAppContext setPostEvaluationBlocks:](self, "setPostEvaluationBlocks:", 0);

}

- (void)_invalidateJSThread
{
  void *v2;
  IKAppContext *obj;

  obj = self;
  objc_sync_enter(obj);
  CFRunLoopSourceInvalidate(obj->_jsThreadRunLoopSource);
  CFRunLoopWakeUp(obj->_jsThreadRunLoop);
  obj->_jsThreadRunLoop = 0;
  obj->_jsThreadRunLoopSource = 0;
  -[IKAppContext pendingQueue](obj, "pendingQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  -[IKAppContext setPendingQueue:](obj, "setPendingQueue:", 0);
  -[IKAppContext setCanAccessPendingQueue:](obj, "setCanAccessPendingQueue:", 0);
  -[IKAppContext setRunning:](obj, "setRunning:", 0);
  objc_sync_exit(obj);

}

- (void)_doEvaluate:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void (**)(id, void *))a3;
  if (!-[IKAppContext isValid](self, "isValid"))
  {
    ITMLKitGetLogObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[IKAppContext _doEvaluate:].cold.1((uint64_t)self, v5);

  }
  -[IKAppContext jsContext](self, "jsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

  -[IKAppContext jsContext](self, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exception");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IKAppContext jsContext](self, "jsContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exception");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKAppContext _dispatchError:](self, "_dispatchError:", v10);

    -[IKAppContext jsContext](self, "jsContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setException:", 0);

  }
}

- (id)_errorWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKAppContext jsContext](self, "jsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constructWithArguments:", MEMORY[0x1E0C9AA60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("message"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stack"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("[native code]")) & 1) == 0)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("sourceURL"));
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          if (v17 >= 3)
          {
            v18 = v17;
            objc_msgSend(v16, "objectAtIndex:", v17 - 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndex:", v18 - 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("line"));
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("column"));
            }

          }
          goto LABEL_16;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_16:

  return v7;
}

- (void)_dispatchError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  IKAppContext *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDispatched"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "toBool");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("line"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("column"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ITMLKitGetLogObject(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v23 = v21;
        v24 = 2048;
        v25 = -[IKAppContext mode](self, "mode");
        v26 = 2048;
        v27 = self;
        v28 = 2112;
        v29 = v8;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v15;
        _os_log_error_impl(&dword_1D95F2000, v16, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Error: %@ - %@ - line:%@", buf, 0x3Eu);

      }
      -[IKAppContext jsContext](self, "jsContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("App"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "toObjectOfClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "dispatchErrorWithMessage:sourceURL:line:", v8, v10, v15);
    }

  }
}

- (id)_preferredLaunchURL
{
  void *v2;
  void *v3;

  if (+[IKUtilites runningAnInternalBuild](IKUtilites, "runningAnInternalBuild"))
  {
    v2 = (void *)CFPreferencesCopyAppValue(CFSTR("JSURL"), CFSTR("com.apple.ITMLKit"));
    if (objc_msgSend(v2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_enqueueOnStartOrExecute:(id)a3
{
  IKAppContext *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (-[IKAppContext isValid](self, "isValid"))
  {
    v7[2]();
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    -[IKAppContext onStartQueue](v4, "onStartQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1DF092410](v7);
    objc_msgSend(v5, "addObject:", v6);

    objc_sync_exit(v4);
  }

}

- (void)_drainOnStartQueue
{
  IKAppContext *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[IKAppContext onStartQueue](v2, "onStartQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[IKAppContext onStartQueue](v2, "onStartQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_sync_exit(v2);
  if (objc_msgSend(v4, "count"))
  {
    ITMLKitGetLogObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D95F2000, v6, OS_LOG_TYPE_INFO, "[StartQueue] Draining start Queue", buf, 2u);
    }

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v7, "count", (_QWORD)v12))
  {
    ITMLKitGetLogObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D95F2000, v11, OS_LOG_TYPE_INFO, "[StartQueue] Done Draining start Queue!", buf, 2u);
    }

  }
}

- (void)contextDidStopWithOptions:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[IKAppContext delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IKAppContext delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appContext:didStopWithOptions:", self, 0);

  }
}

- (void)contextDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKAppContext app](self, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IKAppContext app](self, "app");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offlineJSURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  v8 = -[IKAppContext mode](self, "mode");
  -[IKAppContext setRunning:](self, "setRunning:", 0);
  if (v8 == 1000
    || (-[IKAppContext resolvedBootURL](self, "resolvedBootURL"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", v7),
        v9,
        (v10 & 1) != 0)
    || !v7)
  {
    -[IKAppContext resolvedBootURL](self, "resolvedBootURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v7);

    if (v14)
    {
      ITMLKitGetLogObject(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[IKAppContext contextDidFailWithError:].cold.1();

    }
    -[IKAppContext delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[IKAppContext delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appContext:didFailWithError:", self, v4);

    }
  }
  else
  {
    ITMLKitGetLogObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IKAppContext resolvedBootURL](self, "resolvedBootURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1D95F2000, v11, OS_LOG_TYPE_INFO, "This isn't a validation context, the resolved URL (%@) isn't the offline JS and we actually have an offline JS (%@). Starting offline JS...", (uint8_t *)&v19, 0x16u);

    }
    -[IKAppContext _prepareStartWithURL:](self, "_prepareStartWithURL:", v7);
  }

}

- (void)contextDidStartWithJS:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  kdebug_trace();
  -[IKAppContext app](self, "app");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IKAppContext app](self, "app");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "offlineJSURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[IKAppContext resolvedBootURL](self, "resolvedBootURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IKAppContext mode](self, "mode");
  -[IKAppContext delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1F01E4E80) & 1) != 0)
  {
    -[IKAppContext delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[IKAppContext delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appContext:didStartWithOptions:validatedJSString:", self, v7, v6);
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {

  }
  -[IKAppContext delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[IKAppContext delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appContext:didStartWithOptions:", self, v7);
    goto LABEL_9;
  }
LABEL_10:
  if (v12 != 1000 && (objc_msgSend(v11, "isEqual:", v9) & 1) == 0 && (objc_msgSend(v11, "isFileURL") & 1) == 0)
  {
    -[IKAppContext appCache](self, "appCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__IKAppContext_contextDidStartWithJS_options___block_invoke;
    v20[3] = &unk_1E9F4D5E0;
    v21 = v11;
    objc_msgSend(v19, "updateCacheWithValidatedJS:completion:", v6, v20);

  }
  -[IKAppContext _drainOnStartQueue](self, "_drainOnStartQueue");

}

void __46__IKAppContext_contextDidStartWithJS_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ITMLKitGetLogObject(2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D95F2000, v5, OS_LOG_TYPE_INFO, "Cached remote URL (%@) with checksum %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __46__IKAppContext_contextDidStartWithJS_options___block_invoke_cold_1(a1, v5);
  }

}

- (id)_appTraitCollection
{
  id WeakRetained;
  void *v3;

  if (self->_respondsToTraitCollection)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_app);
    objc_msgSend(WeakRetained, "appTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v3;
}

- (BOOL)highlightViewsForElementsWithIDs:(id)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD v19[4];
  id v20;
  IKAppContext *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  id v27;
  id location;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToHighlightViewsForManyElements)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__IKAppContext_highlightViewsForElementsWithIDs_contentColor_paddingColor_borderColor_marginColor___block_invoke;
    v19[3] = &unk_1E9F4D608;
    objc_copyWeak(&v27, &location);
    v26 = &v29;
    v20 = v12;
    v21 = self;
    v22 = v13;
    v23 = v14;
    v24 = v15;
    v25 = v16;
    -[IKAppContext evaluateDelegateBlockSync:](self, "evaluateDelegateBlockSync:", v19);

    objc_destroyWeak(&v27);
  }
  v17 = *((_BYTE *)v30 + 24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __99__IKAppContext_highlightViewsForElementsWithIDs_contentColor_paddingColor_borderColor_marginColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "app");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v7, "_viewElementForNodeID:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "unsignedIntegerValue", (_QWORD)v16));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v15, "appContext:highlightViewsForElements:contentColor:paddingColor:borderColor:marginColor:", v3, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
}

- (BOOL)highlightViewForElementWithID:(int64_t)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id v24[2];
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToHighlightViewForOneElement)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __96__IKAppContext_highlightViewForElementWithID_contentColor_paddingColor_borderColor_marginColor___block_invoke;
    v18[3] = &unk_1E9F4D630;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    v23 = &v26;
    v19 = v12;
    v20 = v13;
    v21 = v14;
    v22 = v15;
    -[IKAppContext evaluateDelegateBlockSync:](self, "evaluateDelegateBlockSync:", v18);

    objc_destroyWeak(v24);
  }
  v16 = *((_BYTE *)v27 + 24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __96__IKAppContext_highlightViewForElementWithID_contentColor_paddingColor_borderColor_marginColor___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "app");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_viewElementForNodeID:", *(_QWORD *)(a1 + 80));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v8, "appContext:highlightViewForElement:contentColor:paddingColor:borderColor:marginColor:", v9, v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
  }

}

- (BOOL)cancelHighlightView
{
  char v3;
  _QWORD v5[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToCancelHighlightForAppContext)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__IKAppContext_cancelHighlightView__block_invoke;
    v5[3] = &unk_1E9F4D658;
    objc_copyWeak(&v6, &location);
    v5[4] = &v8;
    -[IKAppContext evaluateDelegateBlockSync:](self, "evaluateDelegateBlockSync:", v5);
    objc_destroyWeak(&v6);
  }
  v3 = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __35__IKAppContext_cancelHighlightView__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "cancelHighlightViewForAppContext:", v6);

  }
}

- (void)inspectElementModeChanged:(BOOL)a3
{
  _QWORD v5[5];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToDidInspectElementModeChanged)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__IKAppContext_inspectElementModeChanged___block_invoke;
    v5[3] = &unk_1E9F4D680;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    v7 = a3;
    -[IKAppContext evaluateDelegateBlockSync:](self, "evaluateDelegateBlockSync:", v5);
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __42__IKAppContext_inspectElementModeChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appContext:didChangeInspectElementMode:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

    WeakRetained = v4;
  }

}

- (BOOL)isInspectElementModeEnabled
{
  void *v2;
  char v3;

  -[IKAppContext webInspectorController](self, "webInspectorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInspectElementModeEnabled");

  return v3;
}

- (void)inspectElement:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "itmlID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ITMLKitGetLogObject(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[IKAppContext inspectElement:].cold.1();

  -[IKAppContext webInspectorController](self, "webInspectorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inspectNodeWithID:", +[IKDOMNode ITMLIDForITMLIDString:](IKDOMNode, "ITMLIDForITMLIDString:", v5));

}

- (id)registerLoaderWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IKAppContext webInspectorController](self, "webInspectorController");
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
  -[IKAppContext webInspectorController](self, "webInspectorController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterLoaderWithIdentifier:", v4);

}

- (void)appCache:(id)a3 didUpdateWithChecksum:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke;
    v8[3] = &unk_1E9F4C198;
    objc_copyWeak(&v10, &location);
    v9 = v7;
    -[IKAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  ITMLKitGetLogObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_300;
  v4[3] = &unk_1E9F4CB00;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v4, 0);

  objc_destroyWeak(&v6);
}

void __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_300(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setNextJSChecksum:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toObjectOfClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("checksum");
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updatedAppWithOptions:", v9);

  }
}

- (void)handleCacheUpdate
{
  id v2;

  -[IKAppContext appCache](self, "appCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshWithCompletion:", 0);

}

- (void)_networkPropertiesChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  _BOOL4 isAirplaneModeEnabled;
  id v8;

  +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAirplaneModeEnabled");

  if (self->_isAirplaneModeEnabled != v5)
  {
    -[IKAppContext appCache](self, "appCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      isAirplaneModeEnabled = self->_isAirplaneModeEnabled;

      self->_isAirplaneModeEnabled = v5;
      if (isAirplaneModeEnabled && (v5 & 1) == 0)
      {
        -[IKAppContext appCache](self, "appCache");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "refreshWithCompletion:", 0);

      }
    }
    else
    {
      self->_isAirplaneModeEnabled = v5;
    }
  }
}

+ (BOOL)isInFactoryMode
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("com.apple.ITMLKit");
  v5 = CFPreferencesGetAppBooleanValue(CFSTR("FactoryMode"), v4, 0) != 0;

  return v5;
}

- (void)willPerformXhrRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[IKAppContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appContext:willPerformXhrRequest:", self, v5);

}

- (IKApplication)app
{
  return (IKApplication *)objc_loadWeakRetained((id *)&self->_app);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (IKAppContextDelegate)delegate
{
  return (IKAppContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)remoteInspectionEnabled
{
  return self->_remoteInspectionEnabled;
}

- (void)setRemoteInspectionEnabled:(BOOL)a3
{
  self->_remoteInspectionEnabled = a3;
}

- (BOOL)mescalPrimeEnabledForXHRRequests
{
  return self->_mescalPrimeEnabledForXHRRequests;
}

- (void)setMescalPrimeEnabledForXHRRequests:(BOOL)a3
{
  self->_mescalPrimeEnabledForXHRRequests = a3;
}

- (BOOL)canRequireSystemTrustForXHRs
{
  return self->_canRequireSystemTrustForXHRs;
}

- (void)setCanRequireSystemTrustForXHRs:(BOOL)a3
{
  self->_canRequireSystemTrustForXHRs = a3;
}

- (IKAppScriptFallbackHandler)appScriptFallbackHandler
{
  return self->_appScriptFallbackHandler;
}

- (void)setAppScriptFallbackHandler:(id)a3
{
  objc_storeStrong((id *)&self->_appScriptFallbackHandler, a3);
}

- (double)appScriptTimeoutInterval
{
  return self->_appScriptTimeoutInterval;
}

- (void)setAppScriptTimeoutInterval:(double)a3
{
  self->_appScriptTimeoutInterval = a3;
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (void)setJsContext:(id)a3
{
  objc_storeStrong((id *)&self->_jsContext, a3);
}

- (IKAppCache)appCache
{
  return self->_appCache;
}

- (NSString)nextJSChecksum
{
  return self->_nextJSChecksum;
}

- (void)setNextJSChecksum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMutableArray)onStartQueue
{
  return self->_onStartQueue;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (BOOL)canAccessPendingQueue
{
  return self->_canAccessPendingQueue;
}

- (void)setCanAccessPendingQueue:(BOOL)a3
{
  self->_canAccessPendingQueue = a3;
}

- (NSString)responseScript
{
  return self->_responseScript;
}

- (void)setResponseScript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
  objc_storeStrong((id *)&self->_responseError, a3);
}

- (IKAppReloadContext)reloadContext
{
  return self->_reloadContext;
}

- (void)setReloadContext:(id)a3
{
  objc_storeStrong((id *)&self->_reloadContext, a3);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSMutableArray)pendingQueue
{
  return self->_pendingQueue;
}

- (void)setPendingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingQueue, a3);
}

- (NSURL)resolvedBootURL
{
  return self->_resolvedBootURL;
}

- (NSMutableArray)postEvaluationBlocks
{
  return self->_postEvaluationBlocks;
}

- (void)setPostEvaluationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_postEvaluationBlocks, a3);
}

- (IKJSApplication)jsApp
{
  return self->_jsApp;
}

- (void)setJsApp:(id)a3
{
  objc_storeStrong((id *)&self->_jsApp, a3);
}

- (IKJSFoundation)jsFoundation
{
  return self->_jsFoundation;
}

- (void)setJsFoundation:(id)a3
{
  objc_storeStrong((id *)&self->_jsFoundation, a3);
}

- (IKJSWeakMap)jsWeakMap
{
  return self->_jsWeakMap;
}

- (void)setJsWeakMap:(id)a3
{
  objc_storeStrong((id *)&self->_jsWeakMap, a3);
}

- (IKJSViewModelService)jsViewModelService
{
  return self->_jsViewModelService;
}

- (void)setJsViewModelService:(id)a3
{
  objc_storeStrong((id *)&self->_jsViewModelService, a3);
}

- (BOOL)isPrivileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (IKViewElementRegistry)viewElementRegistry
{
  return self->_viewElementRegistry;
}

- (BOOL)appUsesDefaultStyleSheets
{
  return self->_appUsesDefaultStyleSheets;
}

- (IKJSInspectorController)webInspectorController
{
  return self->_webInspectorController;
}

- (void)setWebInspectorController:(id)a3
{
  objc_storeStrong((id *)&self->_webInspectorController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webInspectorController, 0);
  objc_storeStrong((id *)&self->_viewElementRegistry, 0);
  objc_storeStrong((id *)&self->_jsViewModelService, 0);
  objc_storeStrong((id *)&self->_jsWeakMap, 0);
  objc_storeStrong((id *)&self->_jsFoundation, 0);
  objc_storeStrong((id *)&self->_jsApp, 0);
  objc_storeStrong((id *)&self->_postEvaluationBlocks, 0);
  objc_storeStrong((id *)&self->_resolvedBootURL, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_reloadContext, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseScript, 0);
  objc_storeStrong((id *)&self->_onStartQueue, 0);
  objc_storeStrong((id *)&self->_nextJSChecksum, 0);
  objc_storeStrong((id *)&self->_appCache, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_appScriptFallbackHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_app);
  objc_storeStrong((id *)&self->_lowMemoryWarningSource, 0);
  objc_storeStrong((id *)&self->_arrayBufferStore, 0);
}

void __21__IKAppContext_start__block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_16(&dword_1D95F2000, v2, (uint64_t)v2, "Using bag boot url key (%@) for validation context (%@): %@", v3);
}

void __21__IKAppContext_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D95F2000, a2, a3, "Trying to load from bag using \"%@\" key...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __21__IKAppContext_start__block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D95F2000, a2, a3, "We seem to be offline. Using offline JS: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __21__IKAppContext_start__block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1D95F2000, a1, a3, "Trying to load from app cache...", a5, a6, a7, a8, 0);
}

void __21__IKAppContext_start__block_invoke_88_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D95F2000, a2, a3, "Cache URL is \"%@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __21__IKAppContext_start__block_invoke_90_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1D95F2000, v0, v1, "Bag URL using \"%@\" key is \"%@\");
  OUTLINED_FUNCTION_3();
}

void __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(void *a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OUTLINED_FUNCTION_8();
  objc_msgSend(a1, "app");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  v13 = 2048;
  v14 = a1;
  v15 = 2112;
  v16 = v8;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> %@ hasn't implemented reload API", (uint8_t *)&v9, 0x2Au);

  OUTLINED_FUNCTION_2_1();
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.1(void *a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  objc_msgSend(a1, "responseError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1D95F2000, v5, v6, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.2(void *a1)
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mode");
  OUTLINED_FUNCTION_1_1(&dword_1D95F2000, v4, v5, "<%@ (%lu): %p> Failed to load bootstrap fallback with error: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.3(void *a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  objc_msgSend(a1, "responseError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1D95F2000, v5, v6, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

- (void)_startWithURL:(uint64_t)a1 urlTrusted:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  void *v2;
  objc_class *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16(&dword_1D95F2000, a2, v5, "<%@ (%lu): %p> Failed to load launch URL, trying bootstrap fallback", v6);

  OUTLINED_FUNCTION_14();
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.5(void *a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  objc_msgSend(a1, "responseError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1D95F2000, v5, v6, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

- (void)_startWithScript:scriptUrl:wasLoadedFromFallback:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1D95F2000, v2, v3, "<%@ (%lu): %p> Trying to load a script with zero length from %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)_startWithScript:(uint64_t)a1 scriptUrl:(uint64_t)a2 wasLoadedFromFallback:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[56];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1D95F2000, a3, OS_LOG_TYPE_DEBUG, "<%@ (%lu): %p> Delegate opted to stop script loading from %@", v6, 0x2Au);

  OUTLINED_FUNCTION_6();
}

- (void)_doEvaluate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v2;
  objc_class *v4;
  uint8_t v5[40];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Evaluating block without JSContext", v5, 0x20u);

  OUTLINED_FUNCTION_14();
}

- (void)contextDidFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "Offline JS (%@) has failed startup!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__IKAppContext_contextDidStartWithJS_options___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v2;
  v5 = 2112;
  v6 = 0;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Unable to cache remote URL (%@): %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)inspectElement:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_1D95F2000, v0, v1, "Want to inspect itmlID (%@): %@");
  OUTLINED_FUNCTION_3();
}

void __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = OUTLINED_FUNCTION_15();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OUTLINED_FUNCTION_15();
  v8 = objc_msgSend(v7, "mode");
  v9 = OUTLINED_FUNCTION_15();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = 138413314;
  v12 = v6;
  v13 = 2048;
  v14 = v8;
  v15 = 2048;
  v16 = v9;
  v17 = 2112;
  v18 = v9;
  v19 = 2112;
  v20 = v10;
  _os_log_debug_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_DEBUG, "<%@ (%lu): %p> Notifying App object on %@ about new AppJS with %@", (uint8_t *)&v11, 0x34u);

}

@end
