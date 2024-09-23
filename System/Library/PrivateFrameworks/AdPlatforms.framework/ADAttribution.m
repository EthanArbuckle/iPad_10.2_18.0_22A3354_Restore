@implementation ADAttribution

- (void)setServerToTest:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.attribution"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B7DC78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v4);

  objc_msgSend(v6, "resume");
  if ((unint64_t)(a3 - 1) >= 5)
    a3 = 0;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServerToTest:", a3);

  objc_msgSend(v6, "invalidate");
}

- (void)setStocksAdEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.attribution"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B7DC78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v4);

  objc_msgSend(v6, "resume");
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStocksAdEnabled:", v3);

  objc_msgSend(v6, "invalidate");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance__sharedInstance;
}

void __31__ADAttribution_sharedInstance__block_invoke()
{
  ADAttribution *v0;
  void *v1;

  v0 = objc_alloc_init(ADAttribution);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (ADAttribution)init
{
  ADAttribution *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADAttribution;
  result = -[ADAttribution init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_hasCompletedResponse = 0;
  return result;
}

- (void)initiateRequestOnConnection:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__ADAttribution_initiateRequestOnConnection_withBlock___block_invoke;
  v11[3] = &unk_24CF50748;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "requestAttributionDetailsWithBlock:", v11);

}

void __55__ADAttribution_initiateRequestOnConnection_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  objc_msgSend(*(id *)(a1 + 32), "setHasCompletedResponse:", 1);
  objc_sync_exit(v6);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)requestAttributionDetailsWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.attribution"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B7DC78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__ADAttribution_requestAttributionDetailsWithBlock___block_invoke;
  v10[3] = &unk_24CF50770;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  v9 = (void *)MEMORY[0x2199AC8F4](v10);
  objc_msgSend(v8, "setInvalidationHandler:", v9);
  objc_msgSend(v8, "setInterruptionHandler:", v9);
  objc_msgSend(v8, "resume");
  -[ADAttribution initiateRequestOnConnection:withBlock:](self, "initiateRequestOnConnection:withBlock:", v8, v7);

}

void __52__ADAttribution_requestAttributionDetailsWithBlock___block_invoke(uint64_t a1)
{
  id v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "hasCompletedResponse") & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "numRetries");
    if (v3 > 2)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v9 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("A serious error occurred. No data was returned from the Attribution Servers."), &stru_24CF50AB0, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADClientErrorDomain"), 2, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setNumRetries:", (v3 + 1));
      objc_msgSend(*(id *)(a1 + 32), "initiateRequestOnConnection:withBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  objc_sync_exit(v2);

}

void __36__ADAttribution_setStocksAdEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("ERROR: Unable to connect to adprivacyd: %@"), a2);
}

void __33__ADAttribution_setServerToTest___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("ERROR: Unable to connect to adprivacyd: %@"), a2);
}

- (BOOL)hasCompletedResponse
{
  return self->_hasCompletedResponse;
}

- (void)setHasCompletedResponse:(BOOL)a3
{
  self->_hasCompletedResponse = a3;
}

- (unsigned)numRetries
{
  return self->_numRetries;
}

- (void)setNumRetries:(unsigned __int8)a3
{
  self->_numRetries = a3;
}

@end
