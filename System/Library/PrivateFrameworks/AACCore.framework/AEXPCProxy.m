@implementation AEXPCProxy

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AEXPCProxy;
  -[AEXPCProxy dealloc](&v3, sel_dealloc);
}

- (id)initWithOrigin:(void *)a3 interface:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEXPCProxy;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 4, a2);
      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

- (_QWORD)remoteObjectProxyWithErrorHandler:(_QWORD *)a1
{
  _QWORD *v2;
  id v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    -[AEXPCProxy connection](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v3);
    v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (_QWORD)connection
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (val)
  {
    v1 = val;
    v2 = (void *)val[1];
    if (!v2)
    {
      -[AEXPCProxy makeConnection]((id *)val);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    val = v2;
  }
  return val;
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (id)makeConnection
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = val[4];
    objc_msgSend(v2, "makeConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = val[5];
    objc_msgSend(v3, "setRemoteObjectInterface:", v4);

    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __28__AEXPCProxy_makeConnection__block_invoke;
    v9[3] = &unk_24FA21A70;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v3, "setInterruptionHandler:", v9);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __28__AEXPCProxy_makeConnection__block_invoke_2;
    v7[3] = &unk_24FA21A70;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "setInvalidationHandler:", v7);
    objc_msgSend(v3, "resume");
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __28__AEXPCProxy_makeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AEXPCProxy connectionDidInterrupt](WeakRetained);

}

- (void)connectionDidInterrupt
{
  void (**v1)(void);
  void (**v2)(void);

  if (a1)
  {
    objc_msgSend(a1, "interruptionHandler");
    v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      v2 = v1;
      v1[2]();
      v1 = v2;
    }

  }
}

void __28__AEXPCProxy_makeConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AEXPCProxy connectionDidInvalidate](WeakRetained);

}

- (void)connectionDidInvalidate
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "invalidationHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setInvalidationHandler:", 0);
    v2 = v3;
    if (v3)
    {
      (*((void (**)(id))v3 + 2))(v3);
      v2 = v3;
    }

  }
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
