@implementation HUNearbyListenerHelper

- (HUNearbyListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4
{
  id v6;
  HUNearbyListenerHelper *v7;
  id v8;
  objc_super v10;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUNearbyListenerHelper;
  v7 = -[HUNearbyListenerHelper init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_listenerAddress, v8);

    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  objc_destroyWeak(&location);
  return v7;
}

- (void)addKey:(id)a3 forDomain:(id)a4
{
  id v6;
  NSMutableDictionary *keys;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  keys = self->_keys;
  if (!keys)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_keys;
    self->_keys = v8;

    keys = self->_keys;
  }
  -[NSMutableDictionary objectForKey:](keys, "objectForKey:", v11);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "addObject:", v6);
  -[NSMutableDictionary setObject:forKey:](self->_keys, "setObject:forKey:", v10, v11);

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  -[NSMutableDictionary objectForKey:](self->_keys, "objectForKey:", CFSTR("HUNearbyControllerLoggingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__HUNearbyListenerHelper_dealloc__block_invoke;
  v10[3] = &unk_1EA8E9B78;
  v10[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);

  -[NSMutableDictionary objectForKey:](self->_keys, "objectForKey:", CFSTR("HUNearbyControllerMessageKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __33__HUNearbyListenerHelper_dealloc__block_invoke_2;
  v9[3] = &unk_1EA8E9B78;
  v9[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  -[NSMutableDictionary objectForKey:](self->_keys, "objectForKey:", CFSTR("HUNearbyControllerDiscoveryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __33__HUNearbyListenerHelper_dealloc__block_invoke_3;
  v8[3] = &unk_1EA8E9B78;
  v8[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  v7.receiver = self;
  v7.super_class = (Class)HUNearbyListenerHelper;
  -[HUNearbyListenerHelper dealloc](&v7, sel_dealloc);
}

void __33__HUNearbyListenerHelper_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "registerLoggingBlock:forDomain:withListener:", 0, v4, *(_QWORD *)(a1 + 32));

}

void __33__HUNearbyListenerHelper_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "registerMessageBlock:forDomain:withListener:", 0, v4, *(_QWORD *)(a1 + 32));

}

void __33__HUNearbyListenerHelper_dealloc__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "registerDiscoveryBlock:forDomain:withListener:", 0, v4, *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_listenerAddress);
}

@end
