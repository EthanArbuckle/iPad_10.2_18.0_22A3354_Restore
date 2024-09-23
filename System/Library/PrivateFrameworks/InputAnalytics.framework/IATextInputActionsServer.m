@implementation IATextInputActionsServer

- (IATextInputActionsServer)initWithEventHandler:(id)a3
{
  id v4;
  IATextInputActionsServer *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableOrderedSet *recentActions;
  IASTextInputActionsAnalyzer *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  IASTextInputActionsAnalyzer *analyzer;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IATextInputActionsServer;
  v5 = -[IATextInputActionsServer init](&v22, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.inputAnalytics.IATextInputActionsServer", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x24BDBCEE0]);
    v13 = objc_msgSend_initWithCapacity_(v9, v10, 20, v11, v12);
    recentActions = v5->_recentActions;
    v5->_recentActions = (NSMutableOrderedSet *)v13;

    v15 = [IASTextInputActionsAnalyzer alloc];
    v19 = objc_msgSend_initWithEventHandler_(v15, v16, (uint64_t)v4, v17, v18);
    analyzer = v5->_analyzer;
    v5->_analyzer = (IASTextInputActionsAnalyzer *)v19;

  }
  return v5;
}

- (void)consumeAction:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend_analyzer(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_consumeAction_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_asEnd(v4, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    MEMORY[0x24BEDD108](self, sel_enumerateTextInputActionsAnalytics, v18, v19, v20);
}

- (void)enumerateTextInputActionsAnalytics
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23F08E5D4;
  block[3] = &unk_250F8F5F8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dispatchEventToCoreAnalytics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_analyzer(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateAnalytics(v9, v5, v6, v7, v8);

}

- (void)q_flushRecentActions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_removeAllObjects(self->_recentActions, a2, v2, v3, v4);
}

- (void)setKeyboardTrialParameters:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_23F08E73C;
  v7[3] = &unk_250F8F620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (IASServerAnalyticsDelegate)serverDelegate
{
  return (IASServerAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_serverDelegate);
}

- (void)setServerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serverDelegate, a3);
}

- (IASTextInputActionsAnalyzer)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_analyzer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableOrderedSet)recentActions
{
  return self->_recentActions;
}

- (void)setRecentActions:(id)a3
{
  objc_storeStrong((id *)&self->_recentActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
}

@end
