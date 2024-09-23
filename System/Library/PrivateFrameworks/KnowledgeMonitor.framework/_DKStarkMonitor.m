@implementation _DKStarkMonitor

- (void)synchronouslyReflectCurrentValue
{
  void *v3;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[_DKStarkMonitor updateCurrentState](self, "updateCurrentState");
}

- (void)dealloc
{
  objc_super v3;

  -[_DKStarkMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKStarkMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("CarPlayConnected");
}

+ (id)entitlements
{
  return 0;
}

+ (id)_eventWithState:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "carPlayIsConnectedStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventWithStream:startDate:endDate:value:", v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)start
{
  OUTLINED_FUNCTION_0(&dword_219056000, a1, a3, "%s: Started CARSessionStatus Observer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKStarkMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKStarkMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  void *v3;
  void *v4;

  -[_DKStarkMonitor sessionStatus](self, "sessionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_DKStarkMonitor sessionStatus](self, "sessionStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeSessionObserver:", self);

    -[_DKStarkMonitor setSessionStatus:](self, "setSessionStatus:", 0);
  }
}

- (void)updateCurrentState
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_DKStarkMonitor sessionStatus](self, "sessionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  +[_DKStarkMonitor _eventWithState:](_DKStarkMonitor, "_eventWithState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v6, 1);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  id v12;

  if (a3)
  {
    -[_DKMonitor queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37___DKStarkMonitor_sessionDidConnect___block_invoke;
    v9[3] = &unk_24DA66D10;
    v9[4] = self;
    v6 = v9;
    v7 = (void *)os_transaction_create();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_10;
    block[3] = &unk_24DA66E28;
    v11 = v7;
    v12 = v6;
    v8 = v7;
    dispatch_async(v4, block);

  }
}

- (void)sessionDidDisconnect:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  id v12;

  if (a3)
  {
    -[_DKMonitor queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40___DKStarkMonitor_sessionDidDisconnect___block_invoke;
    v9[3] = &unk_24DA66D10;
    v9[4] = self;
    v6 = v9;
    v7 = (void *)os_transaction_create();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_10;
    block[3] = &unk_24DA66E28;
    v11 = v7;
    v12 = v6;
    v8 = v7;
    dispatch_async(v4, block);

  }
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end
