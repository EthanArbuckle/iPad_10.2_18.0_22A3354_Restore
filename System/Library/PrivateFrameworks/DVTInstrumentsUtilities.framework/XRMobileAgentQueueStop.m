@implementation XRMobileAgentQueueStop

+ (void)initialize
{
  XRMobileAgentQueueStop *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  XRMobileAgentQueueStop *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  XRMobileAgentQueueStop *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  XRMobileAgentQueueStop *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  XRMobileAgentQueueStop *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;

  if ((id)objc_opt_class() == a1)
  {
    v2 = [XRMobileAgentQueueStop alloc];
    v3 = (void *)MEMORY[0x24BDAC9B8];
    v6 = objc_msgSend_initWithDispatchQueue_funnelTarget_(v2, v4, MEMORY[0x24BDAC9B8], MEMORY[0x24BDAC9B8], v5);
    v7 = (void *)qword_25583C6B0;
    qword_25583C6B0 = v6;

    v8 = [XRMobileAgentQueueStop alloc];
    dispatch_get_global_queue(25, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_initWithDispatchQueue_(v8, v10, (uint64_t)v9, v11, v12);
    v14 = (void *)qword_25583C6B8;
    qword_25583C6B8 = v13;

    v15 = [XRMobileAgentQueueStop alloc];
    dispatch_get_global_queue(33, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_initWithDispatchQueue_(v15, v17, (uint64_t)v16, v18, v19);
    v21 = (void *)qword_25583C6C0;
    qword_25583C6C0 = v20;

    v22 = [XRMobileAgentQueueStop alloc];
    dispatch_get_global_queue(17, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_initWithDispatchQueue_(v22, v24, (uint64_t)v23, v25, v26);
    v28 = (void *)qword_25583C6C8;
    qword_25583C6C8 = v27;

    v29 = [XRMobileAgentQueueStop alloc];
    dispatch_get_global_queue(9, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_initWithDispatchQueue_(v29, v31, (uint64_t)v30, v32, v33);
    v35 = (void *)qword_25583C6D0;
    qword_25583C6D0 = v34;

    *(_DWORD *)(qword_25583C6B0 + 24) = 4;
    *(_DWORD *)(qword_25583C6C0 + 24) = 5;
    *(_DWORD *)(qword_25583C6B8 + 24) = 6;
    *(_DWORD *)(qword_25583C6C8 + 24) = 7;
    *(_DWORD *)(qword_25583C6D0 + 24) = 8;
  }
}

+ (id)mainQueueStop
{
  return (id)qword_25583C6B0;
}

+ (id)userInitiatedQueueStop
{
  return (id)qword_25583C6B8;
}

+ (id)userInteractiveQueueStop
{
  return (id)qword_25583C6C0;
}

+ (id)utilityQueueStop
{
  return (id)qword_25583C6C8;
}

+ (id)backgroundQueueStop
{
  return (id)qword_25583C6D0;
}

- (XRMobileAgentQueueStop)initWithDispatchQueue:(id)a3 funnelTarget:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  XRMobileAgentQueueStop *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  XRMobileAgentQueueStop *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *funnelQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *executionQueue;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)XRMobileAgentQueueStop;
  v8 = -[XRMobileAgentQueueStop init](&v22, sel_init);
  v12 = v8;
  if (v8)
  {
    v13 = objc_msgSend_methodForSelector_(v8, v9, (uint64_t)sel__holdReceivedAgent_ticket_, v10, v11);
    v12->_holdIsPossible = v13 != objc_msgSend_instanceMethodForSelector_(XRMobileAgentQueueStop, v14, (uint64_t)sel__holdReceivedAgent_ticket_, v15, v16);
    if (v7)
      v17 = dispatch_queue_create_with_target_V2("com.apple.dt.agent-stop-funnel", 0, v7);
    else
      v17 = dispatch_queue_create("com.apple.dt.agent-stop-funnel", 0);
    funnelQueue = v12->_funnelQueue;
    v12->_funnelQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create_with_target_V2("com.apple.dt.agent-exec", 0, v6);
    executionQueue = v12->_executionQueue;
    v12->_executionQueue = (OS_dispatch_queue *)v19;

    v12->_diagnosticID = 3;
  }

  return v12;
}

- (XRMobileAgentQueueStop)initWithMainQueue
{
  uint64_t v2;
  void *v3;
  XRMobileAgentQueueStop *v4;

  v3 = (void *)MEMORY[0x24BDAC9B8];
  v4 = (XRMobileAgentQueueStop *)objc_msgSend_initWithDispatchQueue_funnelTarget_(self, a2, MEMORY[0x24BDAC9B8], MEMORY[0x24BDAC9B8], v2);

  return v4;
}

- (XRMobileAgentQueueStop)initWithDispatchQueue:(id)a3
{
  uint64_t v3;

  return (XRMobileAgentQueueStop *)objc_msgSend_initWithDispatchQueue_funnelTarget_(self, a2, (uint64_t)a3, 0, v3);
}

- (XRMobileAgentQueueStop)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  XRMobileAgentQueueStop *v7;

  dispatch_get_global_queue(17, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (XRMobileAgentQueueStop *)objc_msgSend_initWithDispatchQueue_(self, v4, (uint64_t)v3, v5, v6);

  return v7;
}

- (int)agentStopDiagnosticsTypeCode
{
  return self->_diagnosticID;
}

- (void)_runAgentPrologue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend_ticket(v4, v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__prepareAgentToExecute_withTicket_(self, v9, (uint64_t)v4, (uint64_t)v11, v10);

}

- (void)_executeAgent:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_hello(a3, a2, (uint64_t)a3, v3, v4);
}

- (void)_runAgentEpilogue:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend_ticket(v15, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__escortAgentToExit_withTicket_(self, v9, (uint64_t)v15, (uint64_t)v8, v10);

  objc_msgSend_goodbye(v15, v11, v12, v13, v14);
}

- (void)_executeWelcomeForAgent:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend__runAgentPrologue_(self, v4, (uint64_t)v13, v5, v6);
  objc_msgSend__executeAgent_(self, v7, (uint64_t)v13, v8, v9);
  objc_msgSend__runAgentEpilogue_(self, v10, (uint64_t)v13, v11, v12);

}

- (void)receiveMobileAgent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *funnelQueue;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (!objc_msgSend_movementType(v4, v5, v6, v7, v8))
    sub_22636FC80();
  if (self->_holdIsPossible)
  {
    funnelQueue = self->_funnelQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_2263554BC;
    v13[3] = &unk_24EDC2EC8;
    v13[4] = self;
    v14 = v4;
    dispatch_async(funnelQueue, v13);

  }
  else
  {
    objc_msgSend__welcomeAgent_(self, v9, (uint64_t)v4, v10, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_funnelQueue, 0);
}

- (id)_funnelQueue
{
  return self->_funnelQueue;
}

- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4
{
  return 0;
}

- (void)_welcomeAgent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *executionQueue;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (!objc_msgSend_movementType(v4, v5, v6, v7, v8))
    sub_22636FCA8();
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_226355600;
  v11[3] = &unk_24EDC2EC8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(executionQueue, v11);

}

- (void)_welcomeAgents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *executionQueue;
  _QWORD v21[4];
  id v22;
  XRMobileAgentQueueStop *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id *v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v27 = (id *)&v29;
  v8 = v28;
  if (!v8)
  {
    objc_msgSend__welcomeAgent_(self, v5, (uint64_t)v4, v6, v7);
LABEL_10:
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2263557A0;
    block[3] = &unk_24EDC2EF0;
    block[4] = self;
    v25 = v4;
    v26 = v8;
    dispatch_async(executionQueue, block);

    goto LABEL_11;
  }
  v9 = v27++;
  v10 = *v9;
  if (!v10)
    goto LABEL_10;
  v14 = v10;
  v15 = 0;
  do
  {
    if (!v15)
      v15 = (void *)objc_opt_new();
    objc_msgSend_addObject_(v15, v11, (uint64_t)v14, v12, v13);
    v16 = v27++;
    v17 = *v16;

    v14 = v17;
  }
  while (v17);
  if (!v15)
    goto LABEL_10;
  v18 = self->_executionQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_2263557F8;
  v21[3] = &unk_24EDC2EC8;
  v22 = v15;
  v23 = self;
  v19 = v15;
  dispatch_async(v18, v21);

LABEL_11:
}

- (void)_welcomeAgent:(id)a3 followedByAgents:(id)a4
{
  id v6;
  id v7;
  NSObject *executionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_226355AB0;
  block[3] = &unk_24EDC2EF0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(executionQueue, block);

}

@end
