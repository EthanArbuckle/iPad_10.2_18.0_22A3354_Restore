@implementation _SFSafariViewControllerPrewarmingSession

+ (id)_sharedSessionCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedSessionCreateIfNeeded__onceToken != -1)
    dispatch_once(&_sharedSessionCreateIfNeeded__onceToken, &__block_literal_global_30);
  return (id)_sharedSessionCreateIfNeeded__sharedSession;
}

+ (_SFSafariViewControllerPrewarmingSession)sharedSession
{
  return (_SFSafariViewControllerPrewarmingSession *)objc_msgSend(a1, "_sharedSessionCreateIfNeeded:", 1);
}

+ (_SFSafariViewControllerPrewarmingSession)sharedSessionIfExists
{
  return (_SFSafariViewControllerPrewarmingSession *)objc_msgSend(a1, "_sharedSessionCreateIfNeeded:", 0);
}

- (_SFSafariViewControllerPrewarmingSession)init
{
  _SFSafariViewControllerPrewarmingSession *v2;
  SFQueueingServiceViewControllerProxy *v3;
  SFServiceViewControllerProtocol *serviceProxy;
  uint64_t v5;
  NSHashTable *tokens;
  void *v7;
  _SFSafariViewControllerPrewarmingSession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFSafariViewControllerPrewarmingSession;
  v2 = -[_SFSafariViewControllerPrewarmingSession init](&v10, sel_init);
  if (v2)
  {
    v3 = -[SFQueueingServiceViewControllerProxy initWithProtocol:]([SFQueueingServiceViewControllerProxy alloc], "initWithProtocol:", &unk_1EE756350);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = (SFServiceViewControllerProtocol *)v3;

    -[SFServiceViewControllerProtocol setDelegate:](v2->_serviceProxy, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    tokens = v2->_tokens;
    v2->_tokens = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__suspend, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__resume, *MEMORY[0x1E0DC4860], 0);
    v8 = v2;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFSafariViewControllerPrewarmingSession;
  -[_SFSafariViewControllerPrewarmingSession dealloc](&v4, sel_dealloc);
}

- (id)prewarmConnectionsToURLs:(id)a3
{
  id v4;
  uint64_t v5;
  SFSafariViewControllerPrewarmingToken *v6;
  void *v7;
  SFSafariViewControllerPrewarmingToken *v8;
  SFServiceViewControllerProtocol *serviceProxy;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = [SFSafariViewControllerPrewarmingToken alloc];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFSafariViewControllerPrewarmingToken initWithURLs:](v6, "initWithURLs:", v7);

    -[NSHashTable addObject:](self->_tokens, "addObject:", v8);
    if (!self->_suspended)
    {
      if (!self->_remoteViewController && !self->_cancelViewServiceRequest)
        -[_SFSafariViewControllerPrewarmingSession _connectToService](self, "_connectToService");
      serviceProxy = self->_serviceProxy;
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFServiceViewControllerProtocol requestPrewarmingWithTokens:](serviceProxy, "requestPrewarmingWithTokens:", v10);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFSafariViewControllerPrewarmingToken initWithURLs:](v6, "initWithURLs:", v11);

  }
  return v8;
}

- (void)tokenWithIDDidInvalidate:(unint64_t)a3
{
  _QWORD block[5];

  if (self->_remoteViewController)
    -[SFServiceViewControllerProtocol invalidatePrewarmingTokenWithID:](self->_serviceProxy, "invalidatePrewarmingTokenWithID:", a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___SFSafariViewControllerPrewarmingSession_tokenWithIDDidInvalidate___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)restart
{
  -[_SFSafariViewControllerPrewarmingSession _suspend](self, "_suspend");
  -[_SFSafariViewControllerPrewarmingSession _resume](self, "_resume");
}

- (void)_suspend
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXPrewarming();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "Suspending", v4, 2u);
  }
  self->_suspended = 1;
  -[_SFSafariViewControllerPrewarmingSession _disconnectFromService](self, "_disconnectFromService");
}

- (void)_resume
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = WBS_LOG_CHANNEL_PREFIXPrewarming();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "Resuming", v5, 2u);
  }
  self->_suspended = 0;
  -[_SFSafariViewControllerPrewarmingSession _validTokens](self, "_validTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[_SFSafariViewControllerPrewarmingSession _connectToService](self, "_connectToService");
    -[SFServiceViewControllerProtocol requestPrewarmingWithTokens:](self->_serviceProxy, "requestPrewarmingWithTokens:", v4);
  }

}

- (BOOL)_hasValidTokens
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_tokens;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isValid", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_validTokens
{
  void *v2;
  void *v3;

  -[NSHashTable allObjects](self->_tokens, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_disconnectFromService
{
  id v3;
  _UIAsyncInvocation *cancelViewServiceRequest;
  SFBrowserRemoteViewController *remoteViewController;

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = 0;

  -[SFServiceViewControllerProtocol setTarget:](self->_serviceProxy, "setTarget:", 0);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

}

- (void)_connectToService
{
  id v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelViewServiceRequest;
  SFServiceViewControllerProtocol *serviceProxy;
  SFSafariViewControllerConfiguration *v7;
  _QWORD v8[5];

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke;
  v8[3] = &unk_1E4AC3A80;
  v8[4] = self;
  +[SFBrowserRemoteViewController requestViewControllerWithConnectionHandler:](SFBrowserRemoteViewController, "requestViewControllerWithConnectionHandler:", v8);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;

  serviceProxy = self->_serviceProxy;
  v7 = objc_alloc_init(SFSafariViewControllerConfiguration);
  -[SFServiceViewControllerProtocol setConfiguration:](serviceProxy, "setConfiguration:", v7);

}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest)
    -[_SFSafariViewControllerPrewarmingSession _connectToService](self, "_connectToService", a3);
}

- (void)remoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  SFBrowserRemoteViewController *v6;
  id v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = (SFBrowserRemoteViewController *)a3;
  v7 = a4;
  if (self->_remoteViewController == v6)
  {
    objc_initWeak(&location, self);
    -[_SFSafariViewControllerPrewarmingSession _suspend](self, "_suspend");
    v8 = dispatch_time(0, 1500000000);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __98___SFSafariViewControllerPrewarmingSession_remoteViewController_viewServiceDidTerminateWithError___block_invoke;
    v9[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v10, &location);
    dispatch_after(v8, MEMORY[0x1E0C80D38], v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (SFBrowserRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
