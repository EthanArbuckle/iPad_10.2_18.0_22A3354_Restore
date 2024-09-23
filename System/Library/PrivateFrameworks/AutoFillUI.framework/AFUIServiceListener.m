@implementation AFUIServiceListener

- (id)initDefaultServiceWithServiceQueue:(id)a3
{
  id v5;
  AFUIServiceListener *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUIServiceListener;
  v6 = -[AFUIServiceListener init](&v9, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domainName, CFSTR("com.apple.inputservice.input-ui-host"));
    objc_storeStrong(p_isa + 4, CFSTR("com.apple.inputservice.AutoFillUI"));
    objc_storeStrong(p_isa + 1, a3);
    objc_msgSend(p_isa, "_createListenerIfNecessary");
  }

  return p_isa;
}

- (void)_createListenerIfNecessary
{
  BSServiceConnectionListener *v3;
  BSServiceConnectionListener *bsConnectionListener;
  _QWORD v5[5];

  if (!self->_bsConnectionListener && self->_domainName)
  {
    if (self->_serviceName)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __49__AFUIServiceListener__createListenerIfNecessary__block_invoke;
      v5[3] = &unk_250856920;
      v5[4] = self;
      objc_msgSend(MEMORY[0x24BE0FA28], "listenerWithConfigurator:", v5);
      v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
      bsConnectionListener = self->_bsConnectionListener;
      self->_bsConnectionListener = v3;

      -[BSServiceConnectionListener activate](self->_bsConnectionListener, "activate");
    }
  }
}

void __49__AFUIServiceListener__createListenerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  objc_msgSend(v4, "setDomain:", v3);
  objc_msgSend(v4, "setService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)_destroyListenerIfNecessary
{
  BSServiceConnectionListener *bsConnectionListener;
  BSServiceConnectionListener *v4;

  bsConnectionListener = self->_bsConnectionListener;
  if (bsConnectionListener)
  {
    -[BSServiceConnectionListener invalidate](bsConnectionListener, "invalidate");
    v4 = self->_bsConnectionListener;
    self->_bsConnectionListener = 0;

  }
}

- (id)listenerEndpoint
{
  return 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a4;
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extractNSXPCConnectionWithConfigurator:", &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUIServiceListener serviceQueue](self, "serviceQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__AFUIServiceListener_listener_didReceiveConnection_withContext___block_invoke_2;
  block[3] = &unk_250856948;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

uint64_t __65__AFUIServiceListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  AFUIServiceSession *v2;
  void *v3;

  v2 = [AFUIServiceSession alloc];
  objc_msgSend(*(id *)(a1 + 32), "serviceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return objc_msgSend(*(id *)(a1 + 40), "activate");
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (BSServiceConnectionListener)bsConnectionListener
{
  return self->_bsConnectionListener;
}

- (void)setBsConnectionListener:(id)a3
{
  objc_storeStrong((id *)&self->_bsConnectionListener, a3);
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_domainName, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_bsConnectionListener, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
