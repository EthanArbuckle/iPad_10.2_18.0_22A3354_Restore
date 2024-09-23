@implementation IKJSInspectorStorageAgent

- (IKJSInspectorStorageAgent)initWithInspectorController:(id)a3
{
  id v4;
  IKJSInspectorStorageAgent *v5;
  IKJSInspectorStorageAgent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKJSInspectorStorageAgent;
  v5 = -[IKJSInspectorStorageAgent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IKJSInspectorStorageAgent;
  -[IKJSInspectorStorageAgent dealloc](&v4, sel_dealloc);
}

- (void)startListeningForStorageNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__itemAdded_, CFSTR("IKJSStorageItemAddedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__itemUpdated_, CFSTR("IKJSStorageItemUpdatedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__itemRemoved_, CFSTR("IKJSStorageItemRemovedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__itemsCleared_, CFSTR("IKJSStorageItemsClearedNotification"), 0);

}

- (void)stopListeningForStorageNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("unsupported"));
}

- (void)getDOMStorageItemsWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(id, void *);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = (void (**)(id, void *))a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  -[IKJSInspectorStorageAgent _storageForStorageId:](self, "_storageForStorageId:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keysAndValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (__CFString *)v15;
        else
          v17 = &stru_1E9F50578;
        v18 = v17;

        v27[0] = v14;
        v27[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v19);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }
  v22[2](v22, v8);

}

- (void)setDOMStorageItemWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5 key:(id)a6 value:(id)a7
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;

  v11 = a7;
  v12 = a6;
  v13 = (void (**)(_QWORD))a4;
  -[IKJSInspectorStorageAgent _storageForStorageId:](self, "_storageForStorageId:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItem::", v12, v11);

  v13[2](v13);
}

- (void)removeDOMStorageItemWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5 key:(id)a6
{
  id v9;
  void (**v10)(_QWORD);
  id v11;

  v9 = a6;
  v10 = (void (**)(_QWORD))a4;
  -[IKJSInspectorStorageAgent _storageForStorageId:](self, "_storageForStorageId:", a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeItem:", v9);

  v10[2](v10);
}

- (void)_itemAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[IKJSInspectorStorageAgent controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__IKJSInspectorStorageAgent__itemAdded___block_invoke;
  v11[3] = &unk_1E9F4CBC8;
  objc_copyWeak(&v14, &location);
  v9 = v5;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v8, "evaluate:completionBlock:", v11, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __40__IKJSInspectorStorageAgent__itemAdded___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inspector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domStorageEventDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_storageIdForStorage:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("IKJSStorageKeyKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("IKJSStorageValueKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safe_domStorageItemAddedWithStorageId:key:newValue:", v7, v8, v9);

    }
    WeakRetained = v10;
  }

}

- (void)_itemUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[IKJSInspectorStorageAgent controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__IKJSInspectorStorageAgent__itemUpdated___block_invoke;
  v11[3] = &unk_1E9F4CBC8;
  objc_copyWeak(&v14, &location);
  v9 = v5;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v8, "evaluate:completionBlock:", v11, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __42__IKJSInspectorStorageAgent__itemUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inspector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domStorageEventDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_storageIdForStorage:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("IKJSStorageKeyKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("IKJSStorageOldValueKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("IKJSStorageValueKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safe_domStorageItemUpdatedWithStorageId:key:oldValue:newValue:", v7, v8, v9, v10);

    }
    WeakRetained = v11;
  }

}

- (void)_itemRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[IKJSInspectorStorageAgent controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__IKJSInspectorStorageAgent__itemRemoved___block_invoke;
  v11[3] = &unk_1E9F4CBC8;
  objc_copyWeak(&v14, &location);
  v9 = v5;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v8, "evaluate:completionBlock:", v11, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __42__IKJSInspectorStorageAgent__itemRemoved___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inspector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domStorageEventDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_storageIdForStorage:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("IKJSStorageKeyKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safe_domStorageItemRemovedWithStorageId:key:", v7, v8);

    }
    WeakRetained = v9;
  }

}

- (void)_itemsCleared:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[IKJSInspectorStorageAgent controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__IKJSInspectorStorageAgent__itemsCleared___block_invoke;
  v9[3] = &unk_1E9F4CB00;
  objc_copyWeak(&v11, &location);
  v8 = v5;
  v10 = v8;
  objc_msgSend(v7, "evaluate:completionBlock:", v9, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __43__IKJSInspectorStorageAgent__itemsCleared___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inspector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domStorageEventDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_storageIdForStorage:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "safe_domStorageItemsClearedWithStorageId:", v7);

    WeakRetained = v8;
  }

}

- (id)_storageIdForStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  -[IKJSInspectorStorageAgent controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localStorage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toObjectOfClass:", objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorStorageAgent controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sessionStorage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toObjectOfClass:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4 || v14 == v4)
  {
    objc_msgSend(MEMORY[0x1E0DD9630], "safe_initWithSecurityOrigin:isLocalStorage:", CFSTR("Page"), v9 == v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_storageForStorageId:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v4 = objc_msgSend(a3, "isLocalStorage");
  -[IKJSInspectorStorageAgent controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = CFSTR("localStorage");
  else
    v9 = CFSTR("sessionStorage");
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "toObjectOfClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IKJSInspectorController)controller
{
  return (IKJSInspectorController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
