@implementation HMDRemoteDeviceInformation

- (HMDRemoteDeviceInformation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)attributeDescriptions
{
  const char *v3;
  id v4;
  id Property;
  void *v6;
  id v7;
  void *v8;
  NSHashTable *clients;
  NSHashTable *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int64_t state;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  v6 = (void *)objc_msgSend(v4, "initWithName:value:options:formatter:", CFSTR("Device"), Property, 1, 0);
  v22[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  v8 = (void *)MEMORY[0x24BDD16E0];
  if (self)
    clients = self->_clients;
  else
    clients = 0;
  v10 = clients;
  objc_msgSend(v8, "numberWithUnsignedInteger:", -[NSHashTable count](v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("NumRegisteredClients"), v11);
  v22[1] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Reachable"), v14);
  v22[2] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  if (self)
    state = self->_state;
  else
    state = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", state);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("State"), v18);
  v22[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_confirmationHandlers, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)addState:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    *(_QWORD *)(a1 + 40) |= a2;
  }
}

- (void)queueConfirmationHandler:(double)a3 timeout:
{
  NSObject *v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6 = a2;
    dispatch_assert_queue_V2(v5);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v13 = (id)objc_msgSend(WeakRetained, "newConfirmationHandlerWithTimeout:workQueue:handler:", *(_QWORD *)(a1 + 24), v6, a3);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
    if (v13)
    {
      objc_msgSend(v13, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v8);

      objc_msgSend(v13, "timeoutTimer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", v13);

      objc_msgSend(v13, "workQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeoutTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegateQueue:", v10);

      objc_msgSend(v13, "timeoutTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "resume");

    }
  }
}

- (void)completeConfirmationsWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[HMDRemoteDeviceConfirmationHandler finishWithError:](*(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)clearState:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    *(_QWORD *)(a1 + 40) &= ~2uLL;
  }
}

- (void)setRetryTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

@end
