@implementation MSSearch

+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5 delegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[MSSearch _initWithDelegate:]([MSSearch alloc], "_initWithDelegate:", v11);
  objc_msgSend(v12, "_findMessageData:matchingCriterion:options:", v9, v10, a5);

  return v12;
}

+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 shouldFetch:(BOOL)a5 onServer:(BOOL)a6 delegate:(id)a7
{
  uint64_t v7;
  uint64_t v8;

  v7 = 4;
  if (a5)
    v7 = 5;
  if (a6)
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(a1, "findMessageData:matchingCriterion:options:delegate:", a3, a4, v8, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 shouldFetch:(BOOL)a5 onServer:(BOOL)a6 onlyInboxes:(BOOL)a7 delegate:(id)a8
{
  uint64_t v8;
  uint64_t v9;

  v8 = a5;
  if (a6)
    v8 = a5 | 2;
  if (a7)
    v9 = v8 | 4;
  else
    v9 = v8;
  objc_msgSend(a1, "findMessageData:matchingCriterion:options:delegate:", a3, a4, v9, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  MSSearch *v6;
  MSSearch *v7;
  MSSearch *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25461A608);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)MSSearch;
  v6 = -[MSXPCService initWithRemoteObjectInterface:](&v10, sel_initWithRemoteObjectInterface_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    v8 = v7;
  }

  return v7;
}

- (MSSearch)initWithRemoteObjectInterface:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSSearch;
  return -[MSXPCService initWithRemoteObjectInterface:](&v4, sel_initWithRemoteObjectInterface_, a3);
}

- (id)newConnectionForInterface:(id)a3
{
  id v4;
  void *v5;
  MSSearchProxy *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MSSearch;
  v4 = -[MSXPCService newConnectionForInterface:](&v18, sel_newConnectionForInterface_, a3);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254618988);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);
  v6 = -[MSSearchProxy initWithSearch:]([MSSearchProxy alloc], "initWithSearch:", self);
  objc_msgSend(v4, "setExportedObject:", v6);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__MSSearch_newConnectionForInterface___block_invoke;
  v15[3] = &unk_24C385718;
  objc_copyWeak(&v16, &location);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __38__MSSearch_newConnectionForInterface___block_invoke_2;
  v13[3] = &unk_24C385740;
  v8 = (id)MEMORY[0x20BD2EB84](v15);
  v14 = v8;
  objc_msgSend(v4, "setInterruptionHandler:", v13);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __38__MSSearch_newConnectionForInterface___block_invoke_3;
  v11[3] = &unk_24C385740;
  v9 = v8;
  v12 = v9;
  objc_msgSend(v4, "setInvalidationHandler:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v4;
}

void __38__MSSearch_newConnectionForInterface___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD1398];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MSMailSearchErrorDomain"), 1500, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_delegateDidFinishWithError:", v6);

}

void __38__MSSearch_newConnectionForInterface___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4097, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __38__MSSearch_newConnectionForInterface___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)cancel
{
  id v2;

  -[MSXPCService connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)setDelegate:(id)a3
{
  MSSearchDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!obj && WeakRetained)
  {
    -[MSXPCService connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
  objc_storeWeak((id *)p_delegate, obj);

}

- (void)foundResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    -[MSSearch _delegateDidFindResults:](self, "_delegateDidFindResults:", v7);
  else
    -[MSSearch _delegateDidFinishWithError:](self, "_delegateDidFinishWithError:", v6);

}

- (void)_findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSSearch.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("criterion"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSSearch.m"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultKeys"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__MSSearch__findMessageData_matchingCriterion_options___block_invoke;
  v14[3] = &unk_24C3852B0;
  v14[4] = self;
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "findMessageData:matchingCriterion:options:", v9, v10, a5);

}

void __55__MSSearch__findMessageData_matchingCriterion_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD1398];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MSMailSearchErrorDomain"), 1500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegateDidFinishWithError:", v7);

}

- (void)_delegateDidFinishWithError:(id)a3
{
  MSSearchDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "search:didFinishWithError:", self, v7);
  -[MSXPCService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_storeWeak((id *)p_delegate, 0);
}

- (void)_delegateDidFindResults:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "search:didFindResults:", self, v5) & 1) == 0)
  {
    -[MSSearch _delegateDidFinishWithError:](self, "_delegateDidFinishWithError:", 0);
  }

}

- (MSSearchDelegate)delegate
{
  return (MSSearchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
