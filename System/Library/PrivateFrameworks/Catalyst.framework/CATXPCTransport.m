@implementation CATXPCTransport

- (int)auditSessionIdentifier
{
  return -[NSXPCConnection auditSessionIdentifier](self->mConnection, "auditSessionIdentifier");
}

- (int)processIdentifier
{
  return -[NSXPCConnection processIdentifier](self->mConnection, "processIdentifier");
}

- (unsigned)effectiveUserIdentifier
{
  return -[NSXPCConnection effectiveUserIdentifier](self->mConnection, "effectiveUserIdentifier");
}

- (unsigned)effectiveGroupIdentifier
{
  return -[NSXPCConnection effectiveGroupIdentifier](self->mConnection, "effectiveGroupIdentifier");
}

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATXPCTransport.m"), 109, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (CATXPCTransport)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATXPCTransport.m"), 116, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

- (CATXPCTransport)initWithXPCConnection:(id)a3
{
  id v6;
  CATXPCTransport *v7;
  CATXPCTransport *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATXPCTransport.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("xpcConnection"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CATXPCTransport;
  v7 = -[CATTransport init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->mConnection, a3);

  return v8;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[NSXPCConnection exportedObject](self->mConnection, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATXPCTransport.m"), 151, CFSTR("%@ cannot call %@ when underlying connection has not been torn down."), self, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)CATXPCTransport;
  -[CATTransport dealloc](&v7, sel_dealloc);
}

- (id)valueForEntitlement:(id)a3
{
  return (id)-[NSXPCConnection valueForEntitlement:](self->mConnection, "valueForEntitlement:", a3);
}

- (BOOL)BOOLValueForEntitlement:(id)a3
{
  void *v3;
  char v4;

  -[CATXPCTransport valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)resumeConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  self->mConnectionHasResumed = 1;
  -[CATXPCTransport setUpConnection](self, "setUpConnection");
  -[NSXPCConnection resume](self->mConnection, "resume");
}

- (void)suspendConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[NSXPCConnection suspend](self->mConnection, "suspend");
  -[CATXPCTransport tearDownConnection](self, "tearDownConnection");
  self->mConnectionHasResumed = 0;
}

- (void)invalidateConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  self->mConnectionShouldInvalidate = 1;
  -[NSXPCConnection invalidate](self->mConnection, "invalidate");
  if (!self->mConnectionHasResumed)
    -[CATXPCTransport resumeConnection](self, "resumeConnection");
  if (self->mConnectionHasInvalidated)
    -[CATXPCTransport didInvalidate](self, "didInvalidate");
}

- (id)operationToSendMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTransport:", self);
  objc_msgSend(v5, "setMessage:", v4);

  return v5;
}

- (void)didInvalidate
{
  objc_super v3;

  -[CATXPCTransport tearDownConnection](self, "tearDownConnection");
  v3.receiver = self;
  v3.super_class = (Class)CATXPCTransport;
  -[CATTransport didInvalidate](&v3, sel_didInvalidate);
}

- (void)processMessage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setBlock:", v6);
  objc_msgSend(v10, "setCat_assertion:", v9);
  -[CATTransport didReceiveMessage:](self, "didReceiveMessage:", v10);

  objc_autoreleasePoolPop(v7);
}

- (void)transportSendMessageOperation:(id)a3 processMessage:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v6 = a3;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[NSXPCConnection remoteObjectProxy](self->mConnection, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "processMessage:completion:", v11, &__block_literal_global_24);
    objc_msgSend(v6, "didProcessMessage");
  }
  else
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didFailWithError:", v10);

    v6 = (id)v10;
  }

}

- (void)setUpConnection
{
  NSObject *v3;
  NSXPCConnection *mConnection;
  void *v5;
  void *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  mConnection = self->mConnection;
  CATGetCatalystQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection _setQueue:](mConnection, "_setQueue:", v5);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545AE848);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->mConnection, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->mConnection, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545AE848);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->mConnection, "setExportedInterface:", v7);

  objc_initWeak(&location, self);
  v8 = self->mConnection;
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __34__CATXPCTransport_setUpConnection__block_invoke;
  v13[3] = &unk_24C1C58B0;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v13);
  v10 = self->mConnection;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __34__CATXPCTransport_setUpConnection__block_invoke_2;
  v11[3] = &unk_24C1C58B0;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __34__CATXPCTransport_setUpConnection__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4097, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "didInterruptWithError:", v1);

}

void __34__CATXPCTransport_setUpConnection__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (WeakRetained[65])
    {
      objc_msgSend(WeakRetained, "didInvalidate");
    }
    else
    {
      WeakRetained[66] = 1;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4097, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "didInterruptWithError:", v2);

    }
    WeakRetained = v3;
  }

}

- (void)tearDownConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[NSXPCConnection setRemoteObjectInterface:](self->mConnection, "setRemoteObjectInterface:", 0);
  -[NSXPCConnection setExportedObject:](self->mConnection, "setExportedObject:", 0);
  -[NSXPCConnection setExportedInterface:](self->mConnection, "setExportedInterface:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->mConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->mConnection, "setInvalidationHandler:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mConnection, 0);
}

@end
