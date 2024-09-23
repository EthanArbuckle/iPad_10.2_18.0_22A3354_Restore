@implementation SWBackgroundSendUtility

- (SWBackgroundSendUtility)initWithItemProvider:(id)a3 faceTimeConversation:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SWBackgroundSendUtility *v14;
  objc_class *v15;
  objc_class *v16;
  uint64_t v17;
  SFCollaborationCompositionDictionaryProvider *compositionDictionaryProvider;
  void *v19;
  id completion;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SWBackgroundSendUtility;
  v14 = -[SWBackgroundSendUtility init](&v22, sel_init);
  if (v14)
  {
    v15 = (objc_class *)CUTWeakLinkClass();
    if (v15)
    {
      v16 = v15;
      if (-[objc_class instancesRespondToSelector:](v15, "instancesRespondToSelector:", sel_initWithItemProvider_delegate_))
      {
        v17 = objc_msgSend([v16 alloc], "initWithItemProvider:delegate:", v10, v14);
        compositionDictionaryProvider = v14->_compositionDictionaryProvider;
        v14->_compositionDictionaryProvider = (SFCollaborationCompositionDictionaryProvider *)v17;

      }
    }
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeStrong((id *)&v14->_faceTimeConversation, a4);
    v19 = _Block_copy(v13);
    completion = v14->_completion;
    v14->_completion = v19;

  }
  return v14;
}

- (void)dictionaryDidBecomeAvailable:(id)a3 forProvider:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    SWFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_18EAB1000, v8, OS_LOG_TYPE_DEFAULT, "Asking to initiate collaboration for dictionary %@", buf, 0xCu);
      }

      SWFrameworkLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[SWBackgroundSendUtility faceTimeConversation](self, "faceTimeConversation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_18EAB1000, v10, OS_LOG_TYPE_DEFAULT, "Asking to initiate collaboration for tuconversation: %@", buf, 0xCu);

      }
      -[SWBackgroundSendUtility faceTimeConversation](self, "faceTimeConversation");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject UUID](v8, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWBackgroundSendUtility completion](self, "completion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWBackgroundSendUtility sendCollaboration:faceTimeConversationUUID:completionHandler:](self, "sendCollaboration:faceTimeConversationUUID:completionHandler:", v6, v12, v13);

    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EAB1000, v8, OS_LOG_TYPE_DEFAULT, "Info dictionary could not be archived, so not sending collaboration", buf, 2u);
    }

  }
  else
  {
    SWFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EAB1000, v7, OS_LOG_TYPE_DEFAULT, "Received a nil collaboration composition dictionary so cannot send collaboration", buf, 2u);
    }
  }

}

- (void)_addCollaborationRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SWBackgroundSendUtility queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SWBackgroundSendUtility__addCollaborationRequest___block_invoke;
  v7[3] = &unk_1E28739E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__SWBackgroundSendUtility__addCollaborationRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionActive");

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    SWFrameworkLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_DEFAULT, "Not currently connected to shareable content service. We'll wait for the connection before servicing this request.", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setPendingCollaborationRequest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connect");

  }
}

- (void)_processPendingCollaborationRequest
{
  NSObject *v3;
  _QWORD block[5];

  -[SWBackgroundSendUtility queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SWBackgroundSendUtility__processPendingCollaborationRequest__block_invoke;
  block[3] = &unk_1E2873A08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __62__SWBackgroundSendUtility__processPendingCollaborationRequest__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "pendingCollaborationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingCollaborationRequest");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setPendingCollaborationRequest:", 0);
  }
}

- (void)sendCollaboration:(id)a3 faceTimeConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SWBackgroundSendUtility *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __88__SWBackgroundSendUtility_sendCollaboration_faceTimeConversationUUID_completionHandler___block_invoke;
  v18 = &unk_1E2873A30;
  v19 = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = _Block_copy(&v15);
  -[SWBackgroundSendUtility _addCollaborationRequest:](self, "_addCollaborationRequest:", v14, v15, v16, v17, v18, v19);

}

void __88__SWBackgroundSendUtility_sendCollaboration_faceTimeConversationUUID_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareCollaborationData:faceTimeConversationUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (SLDServiceProxy)serviceProxy
{
  SLDServiceProxy *serviceProxy;
  void *v4;
  uint64_t v5;
  void *v6;
  SLDServiceProxy *v7;
  SLDServiceProxy *v8;

  serviceProxy = self->_serviceProxy;
  if (!serviceProxy)
  {
    v4 = (void *)MEMORY[0x1E0DA8868];
    v5 = objc_opt_class();
    -[SWBackgroundSendUtility queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxyForServiceClass:targetSerialQueue:delegate:", v5, v6, self);
    v7 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
    v8 = self->_serviceProxy;
    self->_serviceProxy = v7;

    serviceProxy = self->_serviceProxy;
  }
  return serviceProxy;
}

- (id)remoteService
{
  void *v2;
  void *v3;

  -[SWBackgroundSendUtility serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)serviceProxyDidConnect:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SWFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_INFO, "Service proxy connected background send utility", v5, 2u);
  }

  -[SWBackgroundSendUtility _processPendingCollaborationRequest](self, "_processPendingCollaborationRequest");
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  NSObject *v4;
  int v5;
  SWBackgroundSendUtility *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SWFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_INFO, "Service proxy disconnected for background send utility: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (SFCollaborationCompositionDictionaryProvider)compositionDictionaryProvider
{
  return self->_compositionDictionaryProvider;
}

- (void)setCompositionDictionaryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_compositionDictionaryProvider, a3);
}

- (TUConversation)faceTimeConversation
{
  return self->_faceTimeConversation;
}

- (void)setFaceTimeConversation:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeConversation, a3);
}

- (id)pendingCollaborationRequest
{
  return self->_pendingCollaborationRequest;
}

- (void)setPendingCollaborationRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_pendingCollaborationRequest, 0);
  objc_storeStrong((id *)&self->_faceTimeConversation, 0);
  objc_storeStrong((id *)&self->_compositionDictionaryProvider, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
