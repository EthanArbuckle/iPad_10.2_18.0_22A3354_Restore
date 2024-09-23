@implementation HUAccessoryListenerHelper

- (HUAccessoryListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4
{
  id v6;
  HUAccessoryListenerHelper *v7;
  id v8;
  objc_super v10;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUAccessoryListenerHelper;
  v7 = -[HUAccessoryListenerHelper init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_listenerAddress, v8);

    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  objc_destroyWeak(&location);
  return v7;
}

- (void)addKey:(id)a3
{
  id v4;
  NSMutableArray *keys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keys = self->_keys;
  v8 = v4;
  if (!keys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_keys;
    self->_keys = v6;

    v4 = v8;
    keys = self->_keys;
  }
  -[NSMutableArray addObject:](keys, "addObject:", v4);

}

- (void)dealloc
{
  HUAccessoryManager **p_delegate;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_loadWeakRetained(&self->_listenerAddress);
  objc_msgSend(WeakRetained, "registerLoggingBlock:withListener:", 0, v5);

  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_loadWeakRetained(&self->_listenerAddress);
  objc_msgSend(v6, "registerDiscoveryBlock:withListener:", 0, v7);

  v8 = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_loadWeakRetained(&self->_listenerAddress);
  objc_msgSend(v8, "registerUpdateBlock:forCharacteristicUUIDs:withListener:", 0, 0, v9);

  v10 = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_loadWeakRetained(&self->_listenerAddress);
  objc_msgSend(v10, "registerBluetoothStateBlock:withListener:", 0, v11);

  v12.receiver = self;
  v12.super_class = (Class)HUAccessoryListenerHelper;
  -[HUAccessoryListenerHelper dealloc](&v12, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_listenerAddress);
}

@end
