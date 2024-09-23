@implementation IKJSInspectorNetworkAgent

- (IKJSInspectorNetworkAgent)initWithInspectorController:(id)a3
{
  id v4;
  IKJSInspectorNetworkAgent *v5;
  IKJSInspectorNetworkAgent *v6;
  uint64_t v7;
  NSMutableDictionary *loaders;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IKJSInspectorNetworkAgent;
  v5 = -[IKJSInspectorNetworkAgent init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    loaders = v6->_loaders;
    v6->_loaders = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (id)registerLoaderWithIdentifier:(id)a3
{
  id v4;
  _IKJSInspectorNetworkLoader *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_loaders, "objectForKey:", v4);
    v5 = (_IKJSInspectorNetworkLoader *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[IKJSInspectorNetworkAgent controller](self, "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inspector");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "networkEventDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = -[_IKJSInspectorNetworkLoader initWithIdentifier:parentIdentifier:agent:dispatcher:]([_IKJSInspectorNetworkLoader alloc], "initWithIdentifier:parentIdentifier:agent:dispatcher:", v4, CFSTR("Page"), self, v9);
      -[NSMutableDictionary setObject:forKey:](self->_loaders, "setObject:forKey:", v5, v4);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)unregisterLoaderWithIdentifier:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_loaders, "removeObjectForKey:");
}

- (void)clearAllTrackedLoaders
{
  -[NSMutableDictionary removeAllObjects](self->_loaders, "removeAllObjects");
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)setExtraHTTPHeadersWithErrorCallback:(id)a3 successCallback:(id)a4 headers:(id)a5
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)getResponseBodyWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5
{
  void (**v8)(id, id, uint64_t);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v8 = (void (**)(id, id, uint64_t))a4;
  v9 = a5;
  v10 = (void *)-[NSMutableDictionary mutableCopy](self->_loaders, "mutableCopy");
  -[IKJSInspectorNetworkAgent controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v13);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "requestRecords");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {

          objc_msgSend(v21, "responseBodyData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "resourceType") == 3 || !objc_msgSend(v21, "resourceType"))
          {
            objc_msgSend(v23, "base64EncodedStringWithOptions:", 0);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v25;
            v27 = &stru_1E9F50578;
            if (v25)
              v27 = (__CFString *)v25;
            v24 = v27;

            v8[2](v8, v24, 1);
          }
          else
          {
            v24 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 4);
            v8[2](v8, v24, 0);
          }
          v22 = v28;

          goto LABEL_17;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
        continue;
      break;
    }
  }

  v22 = v28;
  (*((void (**)(id, const __CFString *))v28 + 2))(v28, CFSTR("Unknown requestId"));
LABEL_17:

}

- (void)setResourceCachingDisabledWithErrorCallback:(id)a3 successCallback:(id)a4 disabled:(BOOL)a5
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v5 = a5;
  v6 = (void *)MEMORY[0x1E0C99EA0];
  v8 = (void (**)(void))a4;
  objc_msgSend(v6, "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v5, CFSTR("IgnoreLocalHTTPCache"));

  v8[2]();
}

- (void)loadResourceWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)resolveWebSocketWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5 objectGroup:(id *)a6
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)getSerializedCertificateWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)setInterceptionEnabledWithErrorCallback:(id)a3 successCallback:(id)a4 enabled:(BOOL)a5
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)addInterceptionWithErrorCallback:(id)a3 successCallback:(id)a4 url:(id)a5 stage:(int64_t *)a6
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)removeInterceptionWithErrorCallback:(id)a3 successCallback:(id)a4 url:(id)a5 stage:(int64_t *)a6
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)interceptContinueWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (void)interceptWithResponseWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5 content:(id)a6 base64Encoded:(BOOL)a7 mimeType:(id *)a8 status:(int *)a9 statusText:(id *)a10 headers:(id *)a11
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Unsupported"));
}

- (IKJSInspectorController)controller
{
  return (IKJSInspectorController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_loaders, 0);
}

@end
