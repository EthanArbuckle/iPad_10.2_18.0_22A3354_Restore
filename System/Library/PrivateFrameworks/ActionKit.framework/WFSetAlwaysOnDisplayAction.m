@implementation WFSetAlwaysOnDisplayAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  OS_dispatch_queue *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  BPSSink *v25;
  BPSSink *sink;
  BPSSink *v27;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v29;
  objc_super v30;
  _QWORD v31[5];
  id v32;
  NSObject *v33;
  _QWORD v34[5];
  NSObject *v35;
  _QWORD block[5];
  objc_super v37;

  v4 = a3;
  -[WFSetAlwaysOnDisplayAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSetAlwaysOnDisplayAction setReceivedEvent:](self, "setReceivedEvent:", 0);
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    dispatch_group_enter(v7);
    -[WFSetAlwaysOnDisplayAction workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    v9 = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke;
    block[3] = &unk_24F8BB638;
    block[4] = self;
    dispatch_group_notify(v7, v8, block);

    objc_storeStrong((id *)&self->_streamGroup, v7);
    v10 = objc_alloc(MEMORY[0x24BEC1478]);
    v34[0] = v9;
    v34[1] = 3221225472;
    v34[2] = __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke_117;
    v34[3] = &unk_24F8BA480;
    v34[4] = self;
    v11 = v7;
    v35 = v11;
    v12 = (void *)objc_msgSend(v10, "initWithInterval:queue:handler:", 0, v34, 10.0);
    objc_msgSend(v12, "setPreventSuspension:", 1);
    objc_msgSend(v12, "start");
    objc_storeStrong((id *)&self->_streamTimer, v12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFSetAlwaysOnDisplayAction", v14);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CB48]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.shortcuts"), v15);
    BiomeLibrary();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "Device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "Display");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "AlwaysOn");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "DSLPublisher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subscribeOn:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke_2;
    v31[3] = &unk_24F8B3650;
    v31[4] = self;
    v32 = v12;
    v33 = v11;
    v23 = v11;
    v24 = v12;
    objc_msgSend(v22, "sinkWithCompletion:receiveInput:", &__block_literal_global_124, v31);
    v25 = (BPSSink *)objc_claimAutoreleasedReturnValue();

    sink = self->_sink;
    self->_sink = v25;
    v27 = v25;

    queue = self->_queue;
    self->_queue = v15;
    v29 = v15;

    v30.receiver = self;
    v30.super_class = (Class)WFSetAlwaysOnDisplayAction;
    -[WFHandleIntentAction runAsynchronouslyWithInput:](&v30, sel_runAsynchronouslyWithInput_, v4);

  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)WFSetAlwaysOnDisplayAction;
    -[WFHandleIntentAction runAsynchronouslyWithInput:](&v37, sel_runAsynchronouslyWithInput_, v4);
  }

}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("state")))
    goto LABEL_6;
  -[WFSetAlwaysOnDisplayAction runningDelegate](self, "runningDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
    goto LABEL_6;
  -[WFSetAlwaysOnDisplayAction runningDelegate](self, "runningDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionReversalStateForAction:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4020]), "initWithActionReversalState:", v21);
    if (v22)
    {
      +[WFAlwaysOnDisplaySettingsClient getReversalStateWithBookmark:completionHandler:](WFAlwaysOnDisplaySettingsClient, "getReversalStateWithBookmark:completionHandler:", v22, v16);
    }
    else
    {
      getWFActionsLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFSetAlwaysOnDisplayAction resolveSlot:withProcessedValue:parameter:input:completion:]";
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_22D353000, v23, OS_LOG_TYPE_FAULT, "%s Couldn't turn action reversal state %@ into a settings client bookmark", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    }

  }
  else
  {
LABEL_6:
    v24.receiver = self;
    v24.super_class = (Class)WFSetAlwaysOnDisplayAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v24, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
    goto LABEL_8;
  -[WFSetAlwaysOnDisplayAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  -[WFSetAlwaysOnDisplayAction sink](self, "sink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)WFSetAlwaysOnDisplayAction;
    -[WFHandleIntentAction finishRunningWithError:](&v9, sel_finishRunningWithError_, v4);
    goto LABEL_9;
  }
  -[WFSetAlwaysOnDisplayAction streamGroup](self, "streamGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v7);

  getWFReversibleActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFSetAlwaysOnDisplayAction finishRunningWithError:]";
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_DEFAULT, "%s Intent execution completed", buf, 0xCu);
  }

LABEL_9:
}

- (OS_dispatch_group)streamGroup
{
  return self->_streamGroup;
}

- (void)setStreamGroup:(id)a3
{
  objc_storeStrong((id *)&self->_streamGroup, a3);
}

- (BOOL)receivedEvent
{
  return self->_receivedEvent;
}

- (void)setReceivedEvent:(BOOL)a3
{
  self->_receivedEvent = a3;
}

- (WFDispatchSourceTimer)streamTimer
{
  return self->_streamTimer;
}

- (void)setStreamTimer:(id)a3
{
  objc_storeStrong((id *)&self->_streamTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
  objc_storeStrong((id *)&self->_sink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamTimer, 0);
  objc_storeStrong((id *)&self->_streamGroup, 0);
}

id __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  getWFReversibleActionsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v7 = "-[WFSetAlwaysOnDisplayAction runAsynchronouslyWithInput:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_22D353000, v2, OS_LOG_TYPE_DEFAULT, "%s Finishing action: %@", buf, 0x16u);
  }

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFSetAlwaysOnDisplayAction;
  return objc_msgSendSuper2(&v5, sel_finishRunningWithError_, 0);
}

void __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke_117(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  getWFReversibleActionsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[WFSetAlwaysOnDisplayAction runAsynchronouslyWithInput:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_22D353000, v2, OS_LOG_TYPE_ERROR, "%s Firing backup timer for action: %@, Biome stream didn't write event in time", (uint8_t *)&v4, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(a1[4], "receivedEvent") & 1) == 0)
  {
    getWFReversibleActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFSetAlwaysOnDisplayAction runAsynchronouslyWithInput:]_block_invoke_2";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_DEFAULT, "%s Processing event from stream: %@", buf, 0x16u);
    }

    objc_msgSend(a1[4], "setReceivedEvent:", 1);
    objc_msgSend(a1[5], "cancel");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke_126;
    v5[3] = &unk_24F8B3628;
    v5[4] = a1[4];
    v6 = v3;
    v7 = a1[5];
    v8 = a1[6];
    +[WFAlwaysOnDisplaySettingsClient getBookmarkForCurrentStateWithCompletionHandler:](WFAlwaysOnDisplaySettingsClient, "getBookmarkForCurrentStateWithCompletionHandler:", v5);

  }
}

void __57__WFSetAlwaysOnDisplayAction_runAsynchronouslyWithInput___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    getWFReversibleActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v16 = "-[WFSetAlwaysOnDisplayAction runAsynchronouslyWithInput:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Received bookmark: %@ for event: %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "actionReversalState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "action:didGenerateReversalState:", v10, v11);

    if ((objc_msgSend(*(id *)(a1 + 48), "hasFired") & 1) != 0)
    {
      getWFReversibleActionsLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v16 = "-[WFSetAlwaysOnDisplayAction runAsynchronouslyWithInput:]_block_invoke";
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_ERROR, "%s Took too long to get a bookmark for %@", buf, 0x16u);
      }

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }
  }
  else
  {
    v14.receiver = *(id *)(a1 + 32);
    v14.super_class = (Class)WFSetAlwaysOnDisplayAction;
    objc_msgSendSuper2(&v14, sel_finishRunningWithError_, v6);
  }

}

@end
