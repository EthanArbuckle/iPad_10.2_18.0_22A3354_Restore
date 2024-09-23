@implementation SWHighlightCenter

void __44__SWHighlightCenter_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "noticeServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_sendCurrentNoticesToDaemonAndDisconnect");
    objc_msgSend(*(id *)(a1 + 40), "_sendCurrentClearNoticesToDaemonAndDisconnect");
  }
}

void __39__SWHighlightCenter_shareURLFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SharedWithYou.SWShareURLFetchQueue", v2);
  v1 = (void *)shareURLFetchQueue_shareURLFetchQueue;
  shareURLFetchQueue_shareURLFetchQueue = (uint64_t)v0;

}

void __39__SWHighlightCenter_noticeHandlerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SharedWithYou.NoticeHandlerQueue", v2);
  v1 = (void *)noticeHandlerQueue__noticeHandlerQueue;
  noticeHandlerQueue__noticeHandlerQueue = (uint64_t)v0;

}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SWHighlightCenter highlights](self, "highlights");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v5 = obj;
    if (v7)
    {
      -[SWHighlightCenter _notifyDelegateHighlightsDidChange](self, "_notifyDelegateHighlightsDidChange");
      v5 = obj;
    }
  }

}

- (NSArray)highlights
{
  void *v2;
  void *v3;
  void *v4;

  -[SWHighlightCenter _highlightCenterAdapter](self, "_highlightCenterAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SWHighlight highlightsForSLHighlights:](SWHighlight, "highlightsForSLHighlights:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (SLHighlightCenter)_highlightCenterAdapter
{
  return self->__highlightCenterAdapter;
}

- (void)serviceProxyDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SWHighlightCenter *v9;

  v4 = a3;
  +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SWHighlightCenter_serviceProxyDidConnect___block_invoke;
  v7[3] = &unk_1E2873DD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (SLDServiceProxy)noticeServiceProxy
{
  NSObject *v3;
  SLDServiceProxy *noticeServiceProxy;
  void *v5;
  uint64_t v6;
  void *v7;
  SLDServiceProxy *v8;
  SLDServiceProxy *v9;

  +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  noticeServiceProxy = self->_noticeServiceProxy;
  if (!noticeServiceProxy)
  {
    v5 = (void *)MEMORY[0x1E0DA8868];
    v6 = objc_opt_class();
    +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxyForServiceClass:targetSerialQueue:delegate:", v6, v7, self);
    v8 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
    v9 = self->_noticeServiceProxy;
    self->_noticeServiceProxy = v8;

    noticeServiceProxy = self->_noticeServiceProxy;
  }
  return noticeServiceProxy;
}

+ (id)noticeHandlerQueue
{
  if (noticeHandlerQueue_onceToken != -1)
    dispatch_once(&noticeHandlerQueue_onceToken, &__block_literal_global_55);
  return (id)noticeHandlerQueue__noticeHandlerQueue;
}

- (SWHighlightCenter)initWithAppIdentifier:(id)a3
{
  id v4;
  SWHighlightCenter *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *highlightArrayQueue;
  uint64_t v9;
  SLHighlightCenter *highlightCenterAdapter;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWHighlightCenter;
  v5 = -[SWHighlightCenter init](&v13, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.SharedWithYou.HighlightArrayQueue", v6);
    highlightArrayQueue = v5->__highlightArrayQueue;
    v5->__highlightArrayQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8880]), "initWithAppIdentifier:apiAdapterDelegate:", v4, v5);
    highlightCenterAdapter = v5->__highlightCenterAdapter;
    v5->__highlightCenterAdapter = (SLHighlightCenter *)v9;

    -[SWHighlightCenter cloudDocsServiceProxy](v5, "cloudDocsServiceProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connect");

  }
  return v5;
}

- (SLDServiceProxy)cloudDocsServiceProxy
{
  SLDServiceProxy *cloudDocsServiceProxy;
  void *v4;
  uint64_t v5;
  void *v6;
  SLDServiceProxy *v7;
  SLDServiceProxy *v8;

  cloudDocsServiceProxy = self->_cloudDocsServiceProxy;
  if (!cloudDocsServiceProxy)
  {
    v4 = (void *)MEMORY[0x1E0DA8868];
    v5 = objc_opt_class();
    +[SWHighlightCenter shareURLFetchQueue](SWHighlightCenter, "shareURLFetchQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxyForServiceClass:targetSerialQueue:delegate:", v5, v6, self);
    v7 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cloudDocsServiceProxy;
    self->_cloudDocsServiceProxy = v7;

    cloudDocsServiceProxy = self->_cloudDocsServiceProxy;
  }
  return cloudDocsServiceProxy;
}

+ (OS_dispatch_queue)shareURLFetchQueue
{
  if (shareURLFetchQueue_onceToken != -1)
    dispatch_once(&shareURLFetchQueue_onceToken, &__block_literal_global_0);
  return (OS_dispatch_queue *)(id)shareURLFetchQueue_shareURLFetchQueue;
}

- (SWHighlightCenter)init
{
  return -[SWHighlightCenter initWithAppIdentifier:](self, "initWithAppIdentifier:", 0);
}

+ (NSString)highlightCollectionTitle
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DA8880], "displayName");
}

+ (BOOL)isSystemCollaborationSupportAvailable
{
  return 1;
}

+ (BOOL)isEnabled
{
  return objc_msgSend(MEMORY[0x1E0DA8880], "isEnabled");
}

+ (id)SWVariantDefault
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8880], "SLVariantDefault");
}

+ (id)SWVariantNewsToday
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8880], "SLVariantNewsToday");
}

+ (id)signingQueue
{
  if (signingQueue_onceToken != -1)
    dispatch_once(&signingQueue_onceToken, &__block_literal_global_57);
  return (id)signingQueue_signingQueue;
}

void __33__SWHighlightCenter_signingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SharedWithYou.SigningQueue", v2);
  v1 = (void *)signingQueue_signingQueue;
  signingQueue_signingQueue = (uint64_t)v0;

}

- (NSCache)urlToHighlightCache
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSCache allObjects](self->_urlToHighlightCache, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[SWHighlightCenter highlights](self, "highlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SWHighlightCenter highlights](self, "highlights", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[SWHighlightCenter setUrlToHighlightCache:](self, "setUrlToHighlightCache:", v7);
  }
  return self->_urlToHighlightCache;
}

- (NSCache)urlToCollaborationHighlightCache
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSCache allObjects](self->_urlToCollaborationHighlightCache, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[SWHighlightCenter highlights](self, "highlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SWHighlightCenter highlights](self, "highlights", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            objc_msgSend(v14, "URL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            SLURLMinusFragmentForCKURLs();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v14, v16);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[SWHighlightCenter setUrlToCollaborationHighlightCache:](self, "setUrlToCollaborationHighlightCache:", v7);
  }
  return self->_urlToCollaborationHighlightCache;
}

- (NSCache)supplementaryURLToCollaborationHighlightCache
{
  NSCache *supplementaryURLToCollaborationHighlightCache;
  NSCache *v4;
  NSCache *v5;

  supplementaryURLToCollaborationHighlightCache = self->_supplementaryURLToCollaborationHighlightCache;
  if (!supplementaryURLToCollaborationHighlightCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_supplementaryURLToCollaborationHighlightCache;
    self->_supplementaryURLToCollaborationHighlightCache = v4;

    -[NSCache setCountLimit:](self->_supplementaryURLToCollaborationHighlightCache, "setCountLimit:", 50);
    supplementaryURLToCollaborationHighlightCache = self->_supplementaryURLToCollaborationHighlightCache;
  }
  return supplementaryURLToCollaborationHighlightCache;
}

- (NSCache)fileURLToShareURLCache
{
  NSCache *fileURLToShareURLCache;
  NSCache *v4;
  NSCache *v5;

  fileURLToShareURLCache = self->_fileURLToShareURLCache;
  if (!fileURLToShareURLCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_fileURLToShareURLCache;
    self->_fileURLToShareURLCache = v4;

    -[NSCache setCountLimit:](self->_fileURLToShareURLCache, "setCountLimit:", 50);
    fileURLToShareURLCache = self->_fileURLToShareURLCache;
  }
  return fileURLToShareURLCache;
}

- (NSCache)identifierToCollaborationHighlightCache
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSCache allObjects](self->_identifierToCollaborationHighlightCache, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[SWHighlightCenter highlights](self, "highlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SWHighlightCenter highlights](self, "highlights", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            objc_msgSend(v14, "collaborationIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v14, v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    -[SWHighlightCenter setIdentifierToCollaborationHighlightCache:](self, "setIdentifierToCollaborationHighlightCache:", v7);
  }
  return self->_identifierToCollaborationHighlightCache;
}

- (NSCache)pendingEventCache
{
  NSCache *pendingEventCache;
  NSCache *v4;
  NSCache *v5;

  pendingEventCache = self->_pendingEventCache;
  if (!pendingEventCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_pendingEventCache;
    self->_pendingEventCache = v4;

    pendingEventCache = self->_pendingEventCache;
  }
  return pendingEventCache;
}

- (NSCache)pendingClearCache
{
  NSCache *pendingClearCache;
  NSCache *v4;
  NSCache *v5;

  pendingClearCache = self->_pendingClearCache;
  if (!pendingClearCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_pendingClearCache;
    self->_pendingClearCache = v4;

    pendingClearCache = self->_pendingClearCache;
  }
  return pendingClearCache;
}

- (void)getSignedIdentityProofForCollaborationHighlight:(SWCollaborationHighlight *)collaborationHighlight usingData:(NSData *)data completionHandler:(void *)completionHandler
{
  SWCollaborationHighlight *v7;
  void *v8;
  objc_class *v9;
  NSData *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  SWCollaborationHighlight *v22;
  _QWORD v23[4];
  SWCollaborationHighlight *v24;
  id v25;

  v7 = collaborationHighlight;
  v8 = completionHandler;
  v9 = (objc_class *)MEMORY[0x1E0DA8840];
  v10 = data;
  v11 = [v9 alloc];
  +[SWHighlightCenter signingQueue](SWHighlightCenter, "signingQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTargetSerialQueue:synchronous:", v12, 1);

  -[SWCollaborationHighlight localIdentity](v7, "localIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackingPreventionSalt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    SWFrameworkLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter getSignedIdentityProofForCollaborationHighlight:usingData:completionHandler:].cold.1(v7, v17);
    goto LABEL_7;
  }
  -[SWCollaborationHighlight localProofOfInclusion](v7, "localProofOfInclusion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    SWFrameworkLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter getSignedIdentityProofForCollaborationHighlight:usingData:completionHandler:].cold.2(v7, v17);
LABEL_7:

  }
  -[SWCollaborationHighlight collaborationIdentifier](v7, "collaborationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationHighlight localIdentity](v7, "localIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trackingPreventionSalt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__SWHighlightCenter_getSignedIdentityProofForCollaborationHighlight_usingData_completionHandler___block_invoke;
  v23[3] = &unk_1E2873C18;
  v24 = v7;
  v25 = v8;
  v21 = v8;
  v22 = v7;
  objc_msgSend(v13, "signData:forCollaborationIdentifier:trackingPreventionSalt:timeout:completion:", v10, v18, v20, v23, 3.0);

}

void __97__SWHighlightCenter_getSignedIdentityProofForCollaborationHighlight_usingData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("Unable to sign data.");
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = (const __CFString **)v19;
    v14 = &v18;
LABEL_6:
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 1, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    goto LABEL_7;
  }
  v7 = objc_alloc(MEMORY[0x1E0CD73F0]);
  objc_msgSend(*(id *)(a1 + 32), "localProofOfInclusion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithPersonIdentityProof:signatureData:", v8, v5);

  if (!v9)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2938];
    v17 = CFSTR("Unable to create a signed identity proof.");
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v17;
    v14 = &v16;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)clearNoticesForHighlight:(SWCollaborationHighlight *)highlight
{
  SWCollaborationHighlight *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SWCollaborationHighlight *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = highlight;
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SWHighlightCenter clearNoticesForHighlight:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_INFO, "%s: received clearNotices for highlight: %@", (uint8_t *)&v6, 0x16u);
  }

  -[SWHighlightCenter _processClearNoticesFor:](self, "_processClearNoticesFor:", v4);
}

- (void)postNoticeForHighlightEvent:(id)event
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = event;
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SWHighlightCenter postNoticeForHighlightEvent:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_INFO, "%s: received postNoticeForHighlightEvent for event: %@", (uint8_t *)&v7, 0x16u);
  }

  if (+[_SWHighlightEventAllowList eventTypeForClass:](_SWHighlightEventAllowList, "eventTypeForClass:", objc_opt_class()))
  {
    -[SWHighlightCenter _processPendingHighlightEvent:](self, "_processPendingHighlightEvent:", v4);
  }
  else
  {
    SWFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter postNoticeForHighlightEvent:].cold.1((uint64_t)v4, v6);

  }
}

- (id)fetchAttributionForAttributionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SWHighlightCenter _highlightCenterAdapter](self, "_highlightCenterAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAttributionForAttributionIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)originalSenderForCollaborationHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "attributions"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    objc_msgSend(v5, "attributions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 2)
    {
      SWFrameworkLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v27 = 136315138;
        v28 = "-[SWHighlightCenter originalSenderForCollaborationHighlight:]";
        _os_log_impl(&dword_18EAB1000, v10, OS_LOG_TYPE_INFO, "%s: Found more than 1 attributions for the highlight, defaulting to the first.", (uint8_t *)&v27, 0xCu);
      }

    }
    objc_msgSend(v5, "attributions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "earliestAttributionIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SWFrameworkLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v27 = 136315394;
      v28 = "-[SWHighlightCenter originalSenderForCollaborationHighlight:]";
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_18EAB1000, v16, OS_LOG_TYPE_INFO, "%s: Refetching Earliest attribution with ID: %@.", (uint8_t *)&v27, 0x16u);
    }

    -[SWHighlightCenter fetchAttributionForAttributionIdentifier:](self, "fetchAttributionForAttributionIdentifier:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0CD7430]);
      objc_msgSend(v17, "sender");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sender");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "displayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v18, "initWithHandle:identity:displayName:thumbnailImageData:", v20, 0, v22, 0);

      SWFrameworkLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v27 = 136315394;
        v28 = "-[SWHighlightCenter originalSenderForCollaborationHighlight:]";
        v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_18EAB1000, v24, OS_LOG_TYPE_INFO, "%s: Returning original sender %@.", (uint8_t *)&v27, 0x16u);
      }

    }
    else
    {
      v23 = 0;
    }
    v25 = v23;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)fetchAttributionsForHighlight:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SWCollaborationHighlight *v8;
  SWCollaborationHighlight *v9;

  v4 = a3;
  -[SWHighlightCenter _highlightCenterAdapter](self, "_highlightCenterAdapter");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slHighlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "fetchAttributionsForHighlight:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0)
    v8 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:]([SWCollaborationHighlight alloc], "initWithSLCollaborationHighlight:", v7);
  else
    v8 = -[SWHighlight initWithSLHighlight:]([SWHighlight alloc], "initWithSLHighlight:", v7);
  v9 = v8;

  return v9;
}

- (double)highlightsRankingScore
{
  void *v2;
  double v3;
  double v4;

  -[SWHighlightCenter _highlightCenterAdapter](self, "_highlightCenterAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightsRankingScore");
  v4 = v3;

  return v4;
}

- (void)_getShareURLForFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  void (**v17)(id, void *);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ((objc_msgSend(v6, "isFileURL") & 1) != 0)
  {
    -[SWHighlightCenter fileURLToShareURLCache](self, "fileURLToShareURLCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SWHighlightCenter fileURLToShareURLCache](self, "fileURLToShareURLCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      SWFrameworkLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]";
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_18EAB1000, v12, OS_LOG_TYPE_INFO, "%s: Found cached shareURL: %@ for URL: %@.", buf, 0x20u);
      }

      v7[2](v7, v11);
    }
    else
    {
      +[SWHighlightCenter shareURLFetchQueue](SWHighlightCenter, "shareURLFetchQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke;
      block[3] = &unk_1E2873B10;
      block[4] = self;
      v16 = v6;
      v17 = v7;
      dispatch_async(v14, block);

    }
  }
  else
  {
    SWFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]";
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_18EAB1000, v13, OS_LOG_TYPE_INFO, "%s: URL passed in NOT a file URL: %@.", buf, 0x16u);
    }

    v7[2](v7, 0);
  }

}

void __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  _BYTE buf[32];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cloudDocsServiceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x4010000000;
  v24 = &unk_18EAF300D;
  v4 = MEMORY[0x1E0C809B0];
  v25 = 0u;
  v26 = 0u;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2;
  v20[3] = &unk_1E2873C40;
  v20[4] = &v21;
  objc_msgSend(v3, "prepareConnectionWithReply:", v20);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *((_OWORD *)v22 + 3);
  *(_OWORD *)buf = *((_OWORD *)v22 + 2);
  *(_OWORD *)&buf[16] = v7;
  objc_msgSend(v5, "_sandboxExtensionIssueFileURL:withAuditToken:", v6, buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    SWFrameworkLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v8;
      _os_log_impl(&dword_18EAB1000, v9, OS_LOG_TYPE_INFO, "%s: Sending request to fetch the shareURL for URL: %@. tokenData: %@", buf, 0x20u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v16[0] = v4;
      v16[1] = 3221225472;
      v16[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_83;
      v16[3] = &unk_1E2873C68;
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 32);
      v17 = v12;
      v18 = v13;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v3, "shareURLForFileURL:sandboxTokenData:reply:", v12, v8, v16);

    }
  }
  else
  {
    SWFrameworkLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_18EAB1000, v14, OS_LOG_TYPE_INFO, "%s: Failed to get tokendata for URL: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(&v21, 8);
}

void __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;

}

void __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2_84;
  v8[3] = &unk_1E2873A30;
  v9 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2_84(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  SWFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v11 = 136315650;
      v12 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke_2";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_18EAB1000, v3, OS_LOG_TYPE_INFO, "%s: Obtained shareURL: %@ for URL: %@.", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "fileURLToShareURLCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if (v4)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 136315394;
      v12 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_18EAB1000, v3, OS_LOG_TYPE_INFO, "%s: Failed to fetch shareURL for URL: %@.", (uint8_t *)&v11, 0x16u);
    }

    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v8();
}

- (void)_getCollaborationHighlightForShareURL:(id)a3 fileURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(id, void *);
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (v8 && v9)
  {
    -[SWHighlightCenter supplementaryURLToCollaborationHighlightCache](self, "supplementaryURLToCollaborationHighlightCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SWHighlightCenter supplementaryURLToCollaborationHighlightCache](self, "supplementaryURLToCollaborationHighlightCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      SWFrameworkLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]";
        v24 = 2112;
        v25 = v14;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_18EAB1000, v15, OS_LOG_TYPE_INFO, "%s: Found cached highlight: %@ for URL: %@.", buf, 0x20u);
      }

      v10[2](v10, v14);
    }
    else
    {
      +[SWHighlightCenter shareURLFetchQueue](SWHighlightCenter, "shareURLFetchQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke;
      v18[3] = &unk_1E2873A30;
      v18[4] = self;
      v19 = v9;
      v20 = v8;
      v21 = v10;
      dispatch_async(v17, v18);

    }
  }
  else
  {
    SWFrameworkLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]";
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_18EAB1000, v16, OS_LOG_TYPE_INFO, "%s: invalid URL passed in shareURL:%@ fileURL: %@.", buf, 0x20u);
    }

    v10[2](v10, 0);
  }

}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD block[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  _BYTE buf[32];
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cloudDocsServiceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v40 = &v39;
  v41 = 0x4010000000;
  v42 = &unk_18EAF300D;
  v4 = MEMORY[0x1E0C809B0];
  v43 = 0u;
  v44 = 0u;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2;
  v38[3] = &unk_1E2873C40;
  v38[4] = &v39;
  objc_msgSend(v3, "prepareConnectionWithReply:", v38);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *((_OWORD *)v40 + 3);
  *(_OWORD *)buf = *((_OWORD *)v40 + 2);
  *(_OWORD *)&buf[16] = v7;
  objc_msgSend(v5, "_sandboxExtensionIssueFileURL:withAuditToken:", v6, buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SWFrameworkLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_18EAB1000, v17, OS_LOG_TYPE_INFO, "%s: Failed to get tokendata for URL: %@", buf, 0x16u);
    }

    v29[0] = v4;
    v29[1] = 3221225472;
    v29[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_93;
    v29[3] = &unk_1E2873CE0;
    v16 = &v30;
    v30 = *(id *)(a1 + 56);
    v19 = MEMORY[0x1E0C80D38];
    v20 = v29;
    goto LABEL_12;
  }
  SWFrameworkLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v11;
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_18EAB1000, v9, OS_LOG_TYPE_INFO, "%s: Sending request to fetch the collaboration highlight for shareURL: %@ fileURL: %@ tokenData: %@", buf, 0x2Au);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    SWFrameworkLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);

    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_92;
    block[3] = &unk_1E2873CE0;
    v16 = &v32;
    v32 = *(id *)(a1 + 56);
    v19 = MEMORY[0x1E0C80D38];
    v20 = block;
LABEL_12:
    dispatch_async(v19, v20);
    goto LABEL_13;
  }
  v13 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_89;
  v33[3] = &unk_1E2873CB8;
  v34 = v12;
  v14 = *(id *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v35 = v14;
  v36 = v15;
  v37 = *(id *)(a1 + 56);
  objc_msgSend(v3, "getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:", v34, v13, v8, v33);

  v16 = &v34;
LABEL_13:

  _Block_object_dispose(&v39, 8);
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;

}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_90;
  block[3] = &unk_1E2873C90;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_90(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SWCollaborationHighlight *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  SWFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v11 = 136315906;
      v12 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke_2";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_INFO, "%s: Obtained collaborationHighlight: %@ for shareURL: %@ fileURL: %@", (uint8_t *)&v11, 0x2Au);
    }

    v8 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:]([SWCollaborationHighlight alloc], "initWithSLCollaborationHighlight:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 56), "supplementaryURLToCollaborationHighlightCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_90_cold_1(a1, v4, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getHighlightForURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  NSURL *v6;
  void *v7;
  uint64_t v8;
  NSURL *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[5];
  NSURL *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSURL *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = URL;
  v7 = completionHandler;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E2873C68;
  aBlock[4] = self;
  v9 = v6;
  v28 = v9;
  v10 = v7;
  v29 = v10;
  v11 = _Block_copy(aBlock);
  -[SWHighlightCenter urlToHighlightCache](self, "urlToHighlightCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  SWFrameworkLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SWHighlightCenter getHighlightForURL:completionHandler:]";
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_18EAB1000, v16, OS_LOG_TYPE_INFO, "%s: Fetching highlight for URL: %@.", buf, 0x16u);
    }

    SLURLMinusFragmentForCKURLs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isFileURL"))
    {
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_97;
      v25[3] = &unk_1E2873D08;
      v26 = v11;
      -[SWHighlightCenter _getShareURLForFileURL:completionHandler:](self, "_getShareURLForFileURL:completionHandler:", v17, v25);

    }
    else
    {
      (*((void (**)(void *, void *))v11 + 2))(v11, v17);
    }

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter getHighlightForURL:completionHandler:].cold.1(v16, v18, v19, v20, v21, v22, v23, v24);

    (*((void (**)(void *, NSURL *))v11 + 2))(v11, v9);
  }

}

void __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "scheme"), (v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v6 = (void *)v5,
        objc_msgSend(v4, "host"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    SWFrameworkLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "urlToHighlightCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Highlight not found or hasn't yet been loaded for: %@"), v4, *MEMORY[0x1E0CB2938]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCollaborationHighlightForURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  NSURL *v6;
  void *v7;
  uint64_t v8;
  NSURL *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  NSURL *v23;
  id v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = URL;
  v7 = completionHandler;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E2873C68;
  aBlock[4] = self;
  v9 = v6;
  v23 = v9;
  v10 = v7;
  v24 = v10;
  v11 = _Block_copy(aBlock);
  SWFrameworkLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SWHighlightCenter getCollaborationHighlightForURL:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_18EAB1000, v12, OS_LOG_TYPE_INFO, "%s: Fetching collaboration highlight for URL: %@.", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  SLURLMinusFragmentForCKURLs();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isFileURL"))
  {
    v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_101;
    v20[3] = &unk_1E2873D80;
    v20[4] = self;
    v21 = v11;
    -[SWHighlightCenter _getShareURLForFileURL:completionHandler:](self, "_getShareURLForFileURL:completionHandler:", v13, v20);

  }
  else
  {
    -[SWHighlightCenter _highlightCenterAdapter](self, "_highlightCenterAdapter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_103;
    v17[3] = &unk_1E2873DA8;
    v19 = buf;
    v18 = v11;
    v15 = MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
    objc_msgSend(v14, "runAfterInitialFetch:onQueue:", v17, v15);

  }
  _Block_object_dispose(buf, 8);

}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  if (!v3
    || (objc_msgSend(v3, "scheme"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend(v4, "host"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = v6 == 0,
        v6,
        v5,
        v7))
  {
    SWFrameworkLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v35[5];
    v35[5] = v12;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "urlToCollaborationHighlightCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v29[5];
  v29[5] = v9;

  if (v29[5])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  objc_msgSend(v4, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsString:", CFSTR("www.icloud.com/iclouddrive"));

  if (!v15)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Highlight not found or hasn't yet been loaded for: %@"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v35[5];
    v35[5] = v21;

LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  SWFrameworkLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_2();

  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_98;
  v23[3] = &unk_1E2873D30;
  v26 = &v28;
  v27 = &v34;
  v24 = v4;
  v25 = *(id *)(a1 + 48);
  objc_msgSend(v17, "_getCollaborationHighlightForShareURL:fileURL:completionHandler:", v24, v18, v23);

LABEL_10:
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_98(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Highlight not found or hasn't yet been loaded for: %@"), a1[4], *MEMORY[0x1E0CB2938]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_highlightCenterAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2;
  v6[3] = &unk_1E2873D58;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "runAfterInitialFetch:onQueue:", v6, MEMORY[0x1E0C80D38]);

}

uint64_t __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SWFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_INFO, "getCollaborationHighlightForURL: highlight center has finished its first fetch. Now performing lookup for URL: %@.", (uint8_t *)&v14, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_103(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SWFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_103_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_INFO, "getCollaborationHighlightForURL: highlight center has finished its first fetch. Now performing lookup for URL: %@.", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SWCollaborationHighlight)collaborationHighlightForIdentifier:(SWCollaborationIdentifier)collaborationIdentifier error:(NSError *)error
{
  NSString *v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = collaborationIdentifier;
  SWFrameworkLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[SWHighlightCenter collaborationHighlightForIdentifier:error:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_18EAB1000, v7, OS_LOG_TYPE_INFO, "%s: Fetching collaboration highlight for identifier: %@.", (uint8_t *)&v12, 0x16u);
  }

  if (v6)
  {
    -[SWHighlightCenter identifierToCollaborationHighlightCache](self, "identifierToCollaborationHighlightCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, 0);
    v9 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  SWFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[SWHighlightCenter collaborationHighlightForIdentifier:error:]";
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_18EAB1000, v10, OS_LOG_TYPE_INFO, "%s: Returning highlight: %@.", (uint8_t *)&v12, 0x16u);
  }

  return (SWCollaborationHighlight *)v9;
}

- (void)_notifyDelegateHighlightsDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SWHighlightCenter__notifyDelegateHighlightsDidChange__block_invoke;
  block[3] = &unk_1E2873A08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__SWHighlightCenter__notifyDelegateHighlightsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "highlightCenterHighlightsDidChange:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SWHighlightCenter *v9;

  v4 = a3;
  +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SWHighlightCenter_serviceProxyDidDisconnect___block_invoke;
  v7[3] = &unk_1E2873DD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__SWHighlightCenter_serviceProxyDidDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "noticeServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "pendingEventCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "pendingClearCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
        return;
    }
    objc_msgSend(*(id *)(a1 + 40), "noticeServiceProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connect");

  }
}

- (id)_fetchHighlightFromAnyCacheForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  SLURLMinusFragmentForCKURLs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWHighlightCenter urlToHighlightCache](self, "urlToHighlightCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    SWFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = "-[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:]";
      _os_log_impl(&dword_18EAB1000, v8, OS_LOG_TYPE_INFO, "%s: Returning highlight from urlToHighlightCache", (uint8_t *)&v19, 0xCu);
    }

    v9 = v7;
  }
  else
  {
    -[SWHighlightCenter urlToCollaborationHighlightCache](self, "urlToCollaborationHighlightCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    if (v12)
    {
      SWFrameworkLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = 136315138;
        v20 = "-[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:]";
        _os_log_impl(&dword_18EAB1000, v13, OS_LOG_TYPE_INFO, "%s: Returning highlight from urlToCollaborationHighlightCache", (uint8_t *)&v19, 0xCu);
      }

      v9 = v12;
    }
    else
    {
      -[SWHighlightCenter supplementaryURLToCollaborationHighlightCache](self, "supplementaryURLToCollaborationHighlightCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v15, "copy");

      if (v9)
      {
        SWFrameworkLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v19 = 136315138;
          v20 = "-[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:]";
          _os_log_impl(&dword_18EAB1000, v16, OS_LOG_TYPE_INFO, "%s: Returning highlight from supplementaryURLToCollaborationHighlightCache", (uint8_t *)&v19, 0xCu);
        }

        v17 = v9;
      }

    }
  }

  return v9;
}

- (void)_processPendingHighlightEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  NSObject *v12;

  v4 = a3;
  objc_msgSend(v4, "highlightURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:](self, "_fetchHighlightFromAnyCacheForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SWCachedHighlightEvent cachedEvent:forHighlight:](SWCachedHighlightEvent, "cachedEvent:forHighlight:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");

    if (v8)
    {
      +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__SWHighlightCenter__processPendingHighlightEvent___block_invoke;
      v11[3] = &unk_1E2873DD0;
      v11[4] = self;
      v8 = v8;
      v12 = v8;
      dispatch_async(v9, v11);

    }
    else
    {
      SWFrameworkLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SWHighlightCenter _processPendingHighlightEvent:].cold.2();

    }
  }
  else
  {
    SWFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter _processPendingHighlightEvent:].cold.1();
  }

}

void __51__SWHighlightCenter__processPendingHighlightEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pendingEventCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "noticeServiceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "connectionActive");

  v6 = *(void **)(a1 + 32);
  if ((_DWORD)v3)
  {
    objc_msgSend(v6, "_sendCurrentNoticesToDaemonAndDisconnect");
  }
  else
  {
    objc_msgSend(v6, "noticeServiceProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connect");

  }
}

- (void)_processClearNoticesFor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SWHighlightCenter__processClearNoticesFor___block_invoke;
  v7[3] = &unk_1E2873DD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__SWHighlightCenter__processClearNoticesFor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pendingClearCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "collaborationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "noticeServiceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "connectionActive");

  v6 = *(void **)(a1 + 32);
  if ((_DWORD)v3)
  {
    objc_msgSend(v6, "_sendCurrentClearNoticesToDaemonAndDisconnect");
  }
  else
  {
    objc_msgSend(v6, "noticeServiceProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connect");

  }
}

- (void)_sendCurrentClearNoticesToDaemonAndDisconnect
{
  NSObject *v3;
  _QWORD block[5];

  +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke;
  block[3] = &unk_1E2873A08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  id obj;
  id obja;
  _QWORD v32[6];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  id location;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "noticeServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "connectionActive");

  objc_msgSend(*v2, "noticeServiceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v5;
  if (v4)
  {
    objc_msgSend(v5, "synchronousRemoteService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "pendingClearCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3032000000;
      v38[3] = __Block_byref_object_copy_;
      v38[4] = __Block_byref_object_dispose_;
      v39 = (id)objc_msgSend(v11, "mutableCopy");
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      obja = v11;
      v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      if (v12)
      {
        v14 = *(_QWORD *)v35;
        *(_QWORD *)&v13 = 136315394;
        v29 = v13;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(obja);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "_attributionIdentifiersForHighlight:", v16, v29);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v17, "count"))
            {
              SWFrameworkLogHandle();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);

              _Block_object_dispose(v38, 8);
              objc_destroyWeak(&location);
              goto LABEL_21;
            }
            SWFrameworkLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v16, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v42 = "-[SWHighlightCenter _sendCurrentClearNoticesToDaemonAndDisconnect]_block_invoke";
              v43 = 2112;
              v44 = v19;
              _os_log_impl(&dword_18EAB1000, v18, OS_LOG_TYPE_INFO, "%s: Sending clear notice for highlight: '%@'", buf, 0x16u);

            }
            objc_msgSend(v16, "collaborationIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_110;
            v32[3] = &unk_1E2873DF8;
            objc_copyWeak(&v33, &location);
            v32[4] = v16;
            v32[5] = v38;
            objc_msgSend(v6, "sendClearNoticesFor:forAttributionIdentifiers:reply:", v20, v17, v32);

            objc_destroyWeak(&v33);
          }
          v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          if (v12)
            continue;
          break;
        }
      }

      _Block_object_dispose(v38, 8);
      objc_destroyWeak(&location);
    }
LABEL_21:

  }
  else
  {
    objc_msgSend(v5, "connect");

  }
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_110(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_18EAB1000, v6, OS_LOG_TYPE_INFO, "Received success for clear notice for highlight: '%@'", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_110_cold_1(a1, v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    objc_msgSend(WeakRetained, "_disconnectNoticeServiceConnectionIfNecessary");

}

- (void)_sendCurrentNoticesToDaemonAndDisconnect
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SWHighlightCenter _sendCurrentNoticesToDaemonAndDisconnect]";
  _os_log_debug_impl(&dword_18EAB1000, log, OS_LOG_TYPE_DEBUG, "%s: Not currently connected to notice service. We'll wait for the connection to finish posting pending notices.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __61__SWHighlightCenter__sendCurrentNoticesToDaemonAndDisconnect__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_18EAB1000, v6, OS_LOG_TYPE_INFO, "Received success for notice for event: '%@' highlight: '%@'", (uint8_t *)&v9, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __61__SWHighlightCenter__sendCurrentNoticesToDaemonAndDisconnect__block_invoke_cold_1(a1, v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    objc_msgSend(WeakRetained, "_disconnectNoticeServiceConnectionIfNecessary");

}

- (void)_disconnectNoticeServiceConnectionIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  +[SWHighlightCenter noticeHandlerQueue](SWHighlightCenter, "noticeHandlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SWHighlightCenter__disconnectNoticeServiceConnectionIfNecessary__block_invoke;
  block[3] = &unk_1E2873A08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __66__SWHighlightCenter__disconnectNoticeServiceConnectionIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingEventCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingClearCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      SWFrameworkLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[SWHighlightCenter _disconnectNoticeServiceConnectionIfNecessary]_block_invoke";
        _os_log_impl(&dword_18EAB1000, v6, OS_LOG_TYPE_INFO, "%s: No more notices to post, disconnecting from service proxy.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "noticeServiceProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "disconnect");

    }
  }
}

- (id)_attributionIdentifiersForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "attributions", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "uniqueIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
  }
  else
  {
    SWFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter _attributionIdentifiersForHighlight:].cold.1((uint64_t)self, v4, v8);
  }

  return v5;
}

- (void)apiAdapterHighlightsDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWHighlightCenter _highlightCenterAdapter](self, "_highlightCenterAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SWHighlightCenter setUrlToHighlightCache:](self, "setUrlToHighlightCache:", 0);
    -[SWHighlightCenter setSupplementaryURLToCollaborationHighlightCache:](self, "setSupplementaryURLToCollaborationHighlightCache:", 0);
    -[SWHighlightCenter setUrlToCollaborationHighlightCache:](self, "setUrlToCollaborationHighlightCache:", 0);
    -[SWHighlightCenter setIdentifierToCollaborationHighlightCache:](self, "setIdentifierToCollaborationHighlightCache:", 0);
    -[SWHighlightCenter _notifyDelegateHighlightsDidChange](self, "_notifyDelegateHighlightsDidChange");
  }
}

- (id)_sandboxExtensionIssueFileURL:(id)a3 withAuditToken:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasDirectoryPath");

  if (v7)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("/"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "fileSystemRepresentation");
  v13 = *(_OWORD *)a4->var0;
  v14 = *(_OWORD *)&a4->var0[4];
  v10 = (const char *)sandbox_extension_issue_file_to_process();
  v11 = (void *)v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, strlen(v10) + 1, 1, v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)_highlightArrayQueue
{
  return self->__highlightArrayQueue;
}

- (void)setUrlToHighlightCache:(id)a3
{
  objc_storeStrong((id *)&self->_urlToHighlightCache, a3);
}

- (void)setUrlToCollaborationHighlightCache:(id)a3
{
  objc_storeStrong((id *)&self->_urlToCollaborationHighlightCache, a3);
}

- (void)setSupplementaryURLToCollaborationHighlightCache:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryURLToCollaborationHighlightCache, a3);
}

- (void)setIdentifierToCollaborationHighlightCache:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToCollaborationHighlightCache, a3);
}

- (void)setFileURLToShareURLCache:(id)a3
{
  objc_storeStrong((id *)&self->_fileURLToShareURLCache, a3);
}

- (void)setNoticeServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_noticeServiceProxy, a3);
}

- (void)setPendingEventCache:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEventCache, a3);
}

- (void)setPendingClearCache:(id)a3
{
  objc_storeStrong((id *)&self->_pendingClearCache, a3);
}

- (void)setCloudDocsServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDocsServiceProxy, a3);
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong((id *)&self->_variant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_cloudDocsServiceProxy, 0);
  objc_storeStrong((id *)&self->_pendingClearCache, 0);
  objc_storeStrong((id *)&self->_pendingEventCache, 0);
  objc_storeStrong((id *)&self->_noticeServiceProxy, 0);
  objc_storeStrong((id *)&self->_fileURLToShareURLCache, 0);
  objc_storeStrong((id *)&self->_identifierToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_supplementaryURLToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_urlToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_urlToHighlightCache, 0);
  objc_storeStrong((id *)&self->__highlightCenterAdapter, 0);
  objc_storeStrong((id *)&self->__highlightArrayQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlights, 0);
}

- (id)highlightForURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SWHighlightCenter urlToHighlightCache](self, "urlToHighlightCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  SWFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v28 = 136315394;
      v29 = "-[SWHighlightCenter(Deprecations) highlightForURL:error:]";
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_18EAB1000, v11, OS_LOG_TYPE_INFO, "%s: Fetching collaboration highlight for URL: %@.", (uint8_t *)&v28, 0x16u);
    }

    SLURLMinusFragmentForCKURLs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isFileURL"))
    {
      -[SWHighlightCenter getShareURLForFileURL:](self, "getShareURLForFileURL:", v6);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    if (v12
      && (objc_msgSend(v12, "scheme"), (v14 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v15 = (void *)v14,
          objc_msgSend(v12, "host"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      -[SWHighlightCenter urlToHighlightCache](self, "urlToHighlightCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, 0);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v11 = v18;

    v26 = v11;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter(Deprecations) highlightForURL:error:].cold.1(v11, v19, v20, v21, v22, v23, v24, v25);
    v26 = 0;
  }

  return v26;
}

- (id)collaborationHighlightForURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SWFrameworkLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v29 = 136315394;
    v30 = "-[SWHighlightCenter(Deprecations) collaborationHighlightForURL:error:]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_18EAB1000, v7, OS_LOG_TYPE_INFO, "%s: Fetching collaboration highlight for URL: %@.", (uint8_t *)&v29, 0x16u);
  }

  -[SWHighlightCenter urlToCollaborationHighlightCache](self, "urlToCollaborationHighlightCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    SLURLMinusFragmentForCKURLs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isFileURL"))
    {
      -[SWHighlightCenter getShareURLForFileURL:](self, "getShareURLForFileURL:", v6);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    if (v11
      && (objc_msgSend(v11, "scheme"), (v13 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v14 = (void *)v13,
          objc_msgSend(v11, "host"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      -[SWHighlightCenter urlToCollaborationHighlightCache](self, "urlToCollaborationHighlightCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYou.SWHighlightErrorDomain"), 2, 0);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    SWFrameworkLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v29 = 136315394;
      v30 = "-[SWHighlightCenter(Deprecations) collaborationHighlightForURL:error:]";
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_18EAB1000, v27, OS_LOG_TYPE_INFO, "%s: Returning highlight: %@.", (uint8_t *)&v29, 0x16u);
    }

    v18 = v17;
    v26 = v18;
  }
  else
  {
    SWFrameworkLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SWHighlightCenter(Deprecations) collaborationHighlightForURL:error:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v26 = 0;
  }

  return v26;
}

- (id)getShareURLForFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  SWHighlightCenter *v30;
  uint64_t *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[32];
  _BYTE buf[24];
  void *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v4 = a3;
  v38 = v4;
  if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
  {
    -[SWHighlightCenter fileURLToShareURLCache](self, "fileURLToShareURLCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      -[SWHighlightCenter fileURLToShareURLCache](self, "fileURLToShareURLCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v34[5];
      v34[5] = v9;

      SWFrameworkLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = v34[5];
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v41 = v4;
        v13 = "%s: Obtained cached shareURL: %@ for URL: %@.";
        v14 = v11;
        v15 = 32;
LABEL_7:
        _os_log_impl(&dword_18EAB1000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    -[SWHighlightCenter cloudDocsServiceProxy](self, "cloudDocsServiceProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connect");

    -[SWHighlightCenter cloudDocsServiceProxy](self, "cloudDocsServiceProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "synchronousRemoteService");
    v11 = objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4010000000;
    v41 = &unk_18EAF300D;
    v18 = MEMORY[0x1E0C809B0];
    v42 = 0u;
    v43 = 0u;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke;
    v32[3] = &unk_1E2873C40;
    v32[4] = buf;
    -[NSObject prepareConnectionWithReply:](v11, "prepareConnectionWithReply:", v32);
    v19 = v34[5];
    v20 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
    *(_OWORD *)v39 = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
    *(_OWORD *)&v39[16] = v20;
    -[SWHighlightCenter _sandboxExtensionIssueFileURL:withAuditToken:](self, "_sandboxExtensionIssueFileURL:withAuditToken:", v19, v39);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      SWFrameworkLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = v34[5];
        *(_DWORD *)v39 = 136315650;
        *(_QWORD *)&v39[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
        *(_WORD *)&v39[12] = 2112;
        *(_QWORD *)&v39[14] = v23;
        *(_WORD *)&v39[22] = 2112;
        *(_QWORD *)&v39[24] = v21;
        _os_log_impl(&dword_18EAB1000, v22, OS_LOG_TYPE_INFO, "%s: Trying to fetch the shareURL for URL: %@. tokenData: %@", v39, 0x20u);
      }

      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_17;
      v28[0] = v18;
      v28[1] = 3221225472;
      v28[2] = __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke_251;
      v28[3] = &unk_1E2873E48;
      v30 = self;
      v31 = &v33;
      v29 = v4;
      -[NSObject shareURLForFileURL:sandboxTokenData:reply:](v11, "shareURLForFileURL:sandboxTokenData:reply:", v29, v21, v28);
      v24 = v29;
    }
    else
    {
      SWFrameworkLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v39 = 136315394;
        *(_QWORD *)&v39[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
        *(_WORD *)&v39[12] = 2112;
        *(_QWORD *)&v39[14] = v4;
        _os_log_impl(&dword_18EAB1000, v25, OS_LOG_TYPE_INFO, "%s: Failed to get tokendata for URL: %@", v39, 0x16u);
      }

      v24 = (void *)v34[5];
      v34[5] = 0;
    }

LABEL_17:
    _Block_object_dispose(buf, 8);
    goto LABEL_18;
  }
  SWFrameworkLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    v13 = "%s: Obtained URL is NOT a file URL: %@.";
    v14 = v11;
    v15 = 22;
    goto LABEL_7;
  }
LABEL_18:

  v26 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v26;
}

void __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;

}

void __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke_251(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 136315650;
      v12 = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]_block_invoke";
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_INFO, "%s: Obtained shareURL: %@ for URL: %@.", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 40), "fileURLToShareURLCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      v9 = *(void **)(a1 + 32);
      v11 = 136315394;
      v12 = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]_block_invoke";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_INFO, "%s: Failed to fetch shareURL for URL: %@.", (uint8_t *)&v11, 0x16u);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;
  }

}

- (void)getSignedIdentityProofForCollaborationHighlight:(void *)a1 usingData:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[SWHighlightCenter getSignedIdentityProofForCollaborationHighlight:usingData:completionHandler:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, a2, v4, "%s Local identity for highlight %@ did not contain a tps. This may prevent the client app from verifying the proof of inclusion correctly.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

- (void)getSignedIdentityProofForCollaborationHighlight:(void *)a1 usingData:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[SWHighlightCenter getSignedIdentityProofForCollaborationHighlight:usingData:completionHandler:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, a2, v4, "%s Highlight %@ did not contain a local proof of inclusion.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

- (void)postNoticeForHighlightEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v6 = 136315394;
  v7 = "-[SWHighlightCenter postNoticeForHighlightEvent:]";
  OUTLINED_FUNCTION_3();
  v4 = v3;
  OUTLINED_FUNCTION_1(&dword_18EAB1000, a2, v5, "%s: Event type '%@' is not an allowed type. Dropping notice.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_5();
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EAB1000, a1, a3, "%s: Remote service does not respond to getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_90_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 136315650;
  v6 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  OUTLINED_FUNCTION_9(&dword_18EAB1000, a2, a3, "%s: Failed to fetch collaborationHighlight for shareURL: %@ fileURL: %@", (uint8_t *)&v5);
}

- (void)getHighlightForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EAB1000, a1, a3, "%s: No highlights, early return!.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, v0, v1, "%s: Failed to fetch a highlight for URL: %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, v0, v1, "%s: Failed to fetch a collaboration highlight for URL: %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  v3[0] = 136315650;
  OUTLINED_FUNCTION_6();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_9(&dword_18EAB1000, v2, (uint64_t)v2, "%s: Requesting an all collaborations lookup for fileURL: %@ shareURL: %@.", (uint8_t *)v3);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EAB1000, a2, a3, "getCollaborationHighlightForURL: timed out waiting for initial fetch of highlights. There may not yet be highlights in the cache. Now performing lookup for: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_103_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_18EAB1000, v0, v1, "getCollaborationHighlightForURL: timed out waiting for initial fetch of highlights. There may not be highlights in the cache. Now performing lookup for: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_processPendingHighlightEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SWHighlightCenter _processPendingHighlightEvent:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, v0, v1, "%s: no current highlight found for highlightEvent: %@. Dropping notice.", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

- (void)_processPendingHighlightEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SWHighlightCenter _processPendingHighlightEvent:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, v0, v1, "%s: no cached event found for highlightEvent: %@. Dropping notice.", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EAB1000, a1, a3, "%s: No attribution identifiers for this highlight so we cannot clear the notices.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_110_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2(&dword_18EAB1000, a2, v4, "Unsuccessful sending clear notice for highlight: '%@'", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

void __61__SWHighlightCenter__sendCurrentNoticesToDaemonAndDisconnect__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, a2, v5, "Unsuccessful sending notice for event: '%@'  highlight: '%@'", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

- (void)_attributionIdentifiersForHighlight:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18EAB1000, a3, v6, "[SLHighlightPillView: %p] Highlight does not have any attributions! We won't be able to display a pill for this highlight: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

@end
