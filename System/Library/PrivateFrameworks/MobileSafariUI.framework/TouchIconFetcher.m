@implementation TouchIconFetcher

- (TouchIconFetcher)initWithWebView:(id)a3
{
  id v4;
  TouchIconFetcher *v5;
  TouchIconFetcher *v6;
  uint64_t v7;
  NSMutableArray *completionBlocks;
  TouchIconFetcher *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TouchIconFetcher;
  v5 = -[TouchIconFetcher init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    completionBlocks = v6->_completionBlocks;
    v6->_completionBlocks = (NSMutableArray *)v7;

    -[TouchIconFetcher _setUpTouchIconFetcherObserver](v6, "_setUpTouchIconFetcherObserver");
    v9 = v6;
  }

  return v6;
}

- (void)_setUpTouchIconFetcherObserver
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *touchIconFetcherObserver;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1F020CB90);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  touchIconFetcherObserver = self->_touchIconFetcherObserver;
  self->_touchIconFetcherObserver = v3;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](self->_touchIconFetcherObserver, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didFetchTouchIconURLs_forURL_, 0, 0);
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](self->_touchIconFetcherObserver, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didFetchTouchIconURLs_forURL_, 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_remoteObjectRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerExportedObject:interface:", self, self->_touchIconFetcherObserver);

}

- (void)invalidate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  _WKRemoteObjectInterface *touchIconFetcherObserver;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_invalidated)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_completionBlocks;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v11);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unregisterExportedObject:interface:", self, self->_touchIconFetcherObserver);

    touchIconFetcherObserver = self->_touchIconFetcherObserver;
    self->_touchIconFetcherObserver = 0;

    self->_invalidated = 1;
  }
}

- (id)_webProcessActivityProxy
{
  TouchIconFetcherWebProcessController *activityProxy;
  void *v4;
  id WeakRetained;
  void *v6;
  TouchIconFetcherWebProcessController *v7;
  TouchIconFetcherWebProcessController *v8;

  activityProxy = self->_activityProxy;
  if (!activityProxy)
  {
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1F024BF18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithInterface:", v4);
    v7 = (TouchIconFetcherWebProcessController *)objc_claimAutoreleasedReturnValue();
    v8 = self->_activityProxy;
    self->_activityProxy = v7;

    activityProxy = self->_activityProxy;
  }
  return activityProxy;
}

- (void)fetchTouchIconURLsWithCompletion:(id)a3
{
  NSMutableArray *completionBlocks;
  void *v5;
  id v6;

  if (self->_invalidated)
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x1E0C9AA60]);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    v5 = _Block_copy(a3);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v5);

    if (!self->_fetchingURLs)
    {
      self->_fetchingURLs = 1;
      -[TouchIconFetcher _webProcessActivityProxy](self, "_webProcessActivityProxy");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchTouchIconURLs");

    }
  }
}

- (void)didFetchTouchIconURLs:(id)a3 forURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D4EF98], "deviceIdealDefaultTouchIconURLsWithURL:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addObjectsFromArray:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_completionBlocks;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v14);
  self->_fetchingURLs = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIconFetcherObserver, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_destroyWeak((id *)&self->_webView);
}

@end
