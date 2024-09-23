@implementation CDPDCircleStateObserver

- (CDPDCircleStateObserver)init
{
  CDPDCircleStateObserver *v2;
  NSMutableArray *v3;
  NSMutableArray *circleObservers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *eventQueue;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CDPDCircleStateObserver;
  v2 = -[CDPDCircleStateObserver init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    circleObservers = v2->_circleObservers;
    v2->_circleObservers = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("CDPDCircleStateObserver Event Queue", v5);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v6;

    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDCircleStateObserver init].cold.1();

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Deallocated %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (const)_notificationName
{
  return (const char *)*MEMORY[0x24BDE8EE0];
}

- (void)observeCircleStateWithCircleProxy:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  int *p_circleChangeToken;
  NSObject *eventQueue;
  id v12;
  id v13;
  _QWORD handler[4];
  id v15;
  CDPDCircleStateObserver *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  self->_isObserving = 1;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDCircleStateObserver observeCircleStateWithCircleProxy:changeHandler:].cold.1();

  v9 = -[CDPDCircleStateObserver _notificationName](self, "_notificationName");
  p_circleChangeToken = &self->_circleChangeToken;
  eventQueue = self->_eventQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke;
  handler[3] = &unk_24C81BE30;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  notify_register_dispatch(v9, p_circleChangeToken, eventQueue, handler);

}

void __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v8 = 0;
  v3 = objc_msgSend(v2, "combinedCircleStatus:", &v8);
  v4 = v8;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
      __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_2(v3);
  }
  else if (v6)
  {
    __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_1(v3);
  }

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v3);

}

- (void)observeChangeToState:(unint64_t)a3 circleProxy:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__CDPDCircleStateObserver_observeChangeToState_circleProxy_handler___block_invoke;
  v10[3] = &unk_24C81BE58;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  -[CDPDCircleStateObserver observeCircleStateWithCircleProxy:changeHandler:](self, "observeCircleStateWithCircleProxy:changeHandler:", a4, v10);

}

uint64_t __68__CDPDCircleStateObserver_observeChangeToState_circleProxy_handler___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 40) == a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopObservingCircleStatusChange
{
  notify_cancel(self->_circleChangeToken);
  self->_isObserving = 0;
}

- (void)registerListener:(id)a3
{
  -[NSMutableArray addObject:](self->_circleObservers, "addObject:", a3);
}

- (void)_sendCircleStatusChangedForContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *circleObservers;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558274;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"_sendCircleStatusChangedForContext: calling circleStatusChangedForAccountContext for altDSID (%{mask.hash}@\", buf, 0x16u);

  }
  circleObservers = self->_circleObservers;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__CDPDCircleStateObserver__sendCircleStatusChangedForContext___block_invoke;
  v9[3] = &unk_24C81BE80;
  v10 = v4;
  v8 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](circleObservers, "enumerateObjectsUsingBlock:", v9);

}

uint64_t __62__CDPDCircleStateObserver__sendCircleStatusChangedForContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "circleStatusChangedForAccountContext:", *(_QWORD *)(a1 + 32));
}

- (void)_sendCircleViewStatusChangedForContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *circleObservers;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558274;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"_sendCircleStatusChangedForContext: calling circleStatusChangedForAccountContext for altDSID (%{mask.hash}@\", buf, 0x16u);

  }
  circleObservers = self->_circleObservers;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__CDPDCircleStateObserver__sendCircleViewStatusChangedForContext___block_invoke;
  v9[3] = &unk_24C81BE80;
  v10 = v4;
  v8 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](circleObservers, "enumerateObjectsUsingBlock:", v9);

}

uint64_t __66__CDPDCircleStateObserver__sendCircleViewStatusChangedForContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "circleViewStatusChangedForAccountContext:", *(_QWORD *)(a1 + 32));
}

- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!strcmp((const char *)*MEMORY[0x24BDE8518], a3) || !strcmp((const char *)*MEMORY[0x24BDE8EE0], a3))
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
      v8 = objc_claimAutoreleasedReturnValue();
      -[CDPDCircleStateObserver _sendCircleViewStatusChangedForContext:](self, "_sendCircleViewStatusChangedForContext:", v8);
      goto LABEL_10;
    }
    v9 = 136315138;
    v10 = a3;
LABEL_8:
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Processing circle status changed event for event %s\", (uint8_t *)&v9, 0xCu);
    goto LABEL_9;
  }
  v6 = strcmp((const char *)*MEMORY[0x24BDE8EF0], a3);
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v9 = 136315138;
    v10 = a3;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDCircleStateObserver eventReceived:eventValue:].cold.1();
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleObservers, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Initialized %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)observeCircleStateWithCircleProxy:changeHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"%@ started observing state\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20DB2C000, v2, v3, "\"Circle state is %@ after observing kSOSCCCircleChangedNotification (observer %p)\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20DB2C000, v2, v3, "\"Error checking circle status (%@) after observing kSOSCCCircleChangedNotification - %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)eventReceived:eventValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Circle observer ignoring: %s\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
