@implementation INStartSendingUpdatesForwardingAction

- (INStartSendingUpdatesForwardingAction)initWithIntent:(id)a3 endpointProvider:(id)a4 observer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  INStartSendingUpdatesForwardingAction *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  INIntentResponseObserverXPCInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xpcListenerEndpointWithInterface:object:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INStartSendingUpdatesForwardingAction initWithIntent:endpoint:observer:](self, "initWithIntent:endpoint:observer:", v10, v12, v8);
  return v13;
}

- (INStartSendingUpdatesForwardingAction)initWithIntent:(id)a3 endpoint:(id)a4 observer:(id)a5
{
  id v9;
  id v10;
  INStartSendingUpdatesForwardingAction *v11;
  INStartSendingUpdatesForwardingAction *v12;
  uint64_t v13;
  NSXPCConnection *connection;
  NSXPCConnection *v15;
  void *v16;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)INStartSendingUpdatesForwardingAction;
  v11 = -[INIntentForwardingAction initWithIntent:](&v18, sel_initWithIntent_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_endpoint, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v9);
    connection = v12->_connection;
    v12->_connection = (NSXPCConnection *)v13;

    v15 = v12->_connection;
    INIntentResponseObserverXPCInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v15, "setRemoteObjectInterface:", v16);

    if (v10)
    {
      objc_storeStrong((id *)&v12->_observer, a5);
      -[NSXPCConnection resume](v12->_connection, "resume");
    }
  }

  return v12;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INIntentForwardingAction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intent"));

  -[INStartSendingUpdatesForwardingAction endpoint](self, "endpoint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v6, CFSTR("endpoint"));

}

- (INStartSendingUpdatesForwardingAction)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  INStartSendingUpdatesForwardingAction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("endpoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
      objc_msgSend(v7, "_setEndpoint:", v6);
      self = -[INStartSendingUpdatesForwardingAction initWithIntent:endpoint:observer:](self, "initWithIntent:endpoint:observer:", v5, v7, 0);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, INIntentForwardingActionResponse *);
  void *v8;
  void *v9;
  INIntentForwardingActionResponse *v10;
  BOOL v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, INIntentForwardingActionResponse *))a4;
  v14.receiver = self;
  v14.super_class = (Class)INStartSendingUpdatesForwardingAction;
  if (-[INIntentForwardingAction executeRemotelyWithVendorRemote:completionHandler:](&v14, sel_executeRemotelyWithVendorRemote_completionHandler_, v6, v7))
  {
    goto LABEL_4;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[INIntentForwardingAction intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INStartSendingUpdatesForwardingAction observer](self, "observer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startSendingUpdatesForIntent:toObserver:", v8, v9);

    v10 = -[INIntentForwardingActionResponse initWithError:]([INIntentForwardingActionResponse alloc], "initWithError:", 0);
    v7[2](v7, v10);

LABEL_4:
    v11 = 1;
    goto LABEL_8;
  }
  v12 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[INStartSendingUpdatesForwardingAction executeRemotelyWithVendorRemote:completionHandler:]";
    _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s The extension context doesn't implement startSendingUpdatesForIntent:toObserver:", buf, 0xCu);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  INStartSendingUpdatesForwardingAction *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  INStartSendingUpdatesForwardingAction *v17;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection resume](self->_connection, "resume");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__96048;
  v16[4] = __Block_byref_object_dispose__96049;
  v8 = self;
  v17 = v8;
  -[INIntentForwardingAction intent](v8, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INStartSendingUpdatesForwardingAction observer](v8, "observer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__INStartSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke;
  v13[3] = &unk_1E2292798;
  v12 = v7;
  v14 = v12;
  v15 = v16;
  objc_msgSend(v6, "startSendingUpdatesForIntent:toObserver:completionHandler:", v9, v11, v13);
  if (!v10)

  _Block_object_dispose(v16, 8);
}

- (INIntentResponseObserver)observer
{
  return self->_observer;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

void __93__INStartSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  INIntentForwardingActionResponse *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[INIntentForwardingActionResponse initWithError:]([INIntentForwardingActionResponse alloc], "initWithError:", 0);
  (*(void (**)(uint64_t, INIntentForwardingActionResponse *))(v2 + 16))(v2, v3);

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end
