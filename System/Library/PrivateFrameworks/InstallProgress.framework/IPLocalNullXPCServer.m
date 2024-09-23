@implementation IPLocalNullXPCServer

- (IPLocalNullXPCServer)init
{
  IPLocalNullXPCServer *v2;
  uint64_t v3;
  NSXPCListener *listener;
  uint64_t v5;
  NSXPCListenerEndpoint *listenerEndpoint;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPLocalNullXPCServer;
  v2 = -[IPLocalNullXPCServer init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener endpoint](v2->_listener, "endpoint");
    v5 = objc_claimAutoreleasedReturnValue();
    listenerEndpoint = v2->_listenerEndpoint;
    v2->_listenerEndpoint = (NSXPCListenerEndpoint *)v5;

    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (id)newClientConnection
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", self->_listenerEndpoint);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  IPServerExportedInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  IPClientExportedInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v7);

  objc_msgSend(v5, "resume");
  return 1;
}

- (void)actionBarrier:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)*MEMORY[0x24BDD1128];
  v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer actionBarrier:]", 51, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)getActiveInstallations:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)*MEMORY[0x24BDD1128];
  v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer getActiveInstallations:]", 56, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)getAllInstallableStates:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)*MEMORY[0x24BDD1128];
  v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer getAllInstallableStates:]", 61, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)getProgressForIdentity:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)*MEMORY[0x24BDD1128];
  v6 = a4;
  _IPMakeNSErrorImpl(v5, 78, (uint64_t)"-[IPLocalNullXPCServer getProgressForIdentity:completion:]", 66, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)registerAsProgressObserver:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)*MEMORY[0x24BDD1128];
  v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer registerAsProgressObserver:]", 71, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
