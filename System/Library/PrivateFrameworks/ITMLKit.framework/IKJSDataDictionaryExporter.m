@implementation IKJSDataDictionaryExporter

id __65___IKJSDataDictionaryExporter_initWithAppContext_dataObservable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_opt_class();
    objc_msgSend(WeakRetained, "dataObservable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataDictionaryObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dataObservable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentAccessorSequence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_dataDictionaryObjectFromObject:forAccessorSequence:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

JSObjectRef __78___IKJSDataDictionaryExporter__dataDictionaryObjectFromValueRef_inContextRef___block_invoke(uint64_t a1, const OpaqueJSValue *a2)
{
  JSObjectRef v3;
  void *v4;
  void *v5;
  const OpaqueJSValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const OpaqueJSContext *v12;
  void *v13;
  JSObjectRef v14;

  v3 = JSValueToObject(*(JSContextRef *)(a1 + 32), a2, 0);
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsWeakMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const OpaqueJSValue *)objc_msgSend(v5, "valueRefForWeakKeyRef:", v3);

  if (!JSValueIsObject(*(JSContextRef *)(a1 + 32), v6))
    return v3;
  v7 = (void *)MEMORY[0x1E0CBE108];
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithJSValueRef:inContext:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(const OpaqueJSContext **)(a1 + 32);
  objc_msgSend(v11, "targetValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = JSValueToObject(v12, (JSValueRef)objc_msgSend(v13, "JSValueRef"), 0);

  return v14;
}

@end
