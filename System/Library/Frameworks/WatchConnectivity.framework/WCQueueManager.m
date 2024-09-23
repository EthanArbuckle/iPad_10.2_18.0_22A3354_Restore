@implementation WCQueueManager

- (WCQueueManager)init
{
  WCQueueManager *v2;
  WCQueueManager *v3;
  uint64_t v4;
  NSMutableArray *messageQueue;
  uint64_t v6;
  NSMutableDictionary *inFlightMessages;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WCQueueManager;
  v2 = -[WCQueueManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_canSend = 1;
    v4 = objc_opt_new();
    messageQueue = v3->_messageQueue;
    v3->_messageQueue = (NSMutableArray *)v4;

    v6 = objc_opt_new();
    inFlightMessages = v3->_inFlightMessages;
    v3->_inFlightMessages = (NSMutableDictionary *)v6;

    v8 = dispatch_queue_create("com.apple.private.watchconnectivity.send-queue.work-queue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (void)allowMessageSending
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WCQueueManager_allowMessageSending__block_invoke;
  block[3] = &unk_24D661AB8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __37__WCQueueManager_allowMessageSending__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_allowMessageSending");
}

- (void)onqueue_allowMessageSending
{
  -[WCQueueManager setCanSend:](self, "setCanSend:", 1);
  -[WCQueueManager onqueue_attemptToSend](self, "onqueue_attemptToSend");
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WCQueueManager_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_24D6621C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

uint64_t __48__WCQueueManager_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_sendMessage:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)onqueue_sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WCQueuedMessage *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[WCQueuedMessage initWithMessage:completionHandler:]([WCQueuedMessage alloc], "initWithMessage:completionHandler:", v7, v6);

  -[WCQueueManager onqueue_enqueueMessage:](self, "onqueue_enqueueMessage:", v8);
}

- (void)onqueue_attemptToSend
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  if (-[WCQueueManager canSend](self, "canSend") && !-[WCQueueManager messageOutstanding](self, "messageOutstanding"))
  {
    -[WCQueueManager onqueue_peekMessage](self, "onqueue_peekMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[WCQueueManager inFlightMessages](self, "inFlightMessages");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "message");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v6);

      +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pairingID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke;
      v13[3] = &unk_24D662218;
      v13[4] = self;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke_3;
      v11[3] = &unk_24D661A90;
      v11[4] = self;
      v12 = v3;
      objc_msgSend(v7, "sendMessage:clientPairingID:acceptanceHandler:errorHandler:", v8, v10, v13, v11);

      -[WCQueueManager setMessageOutstanding:](self, "setMessageOutstanding:", 1);
    }

  }
}

void __39__WCQueueManager_onqueue_attemptToSend__block_invoke(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke_2;
  v5[3] = &unk_24D6621F0;
  v5[4] = v3;
  v6 = a2;
  v7 = a3;
  dispatch_async(v4, v5);
}

uint64_t __39__WCQueueManager_onqueue_attemptToSend__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMessageOutstanding:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_handleAcceptanceWithCurrentAccepted:nextAvailable:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void __39__WCQueueManager_onqueue_attemptToSend__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4;
  block[3] = &unk_24D661BA8;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 40), "onqueue_handleFailedDaemonConnectionForQueuedMessage:", *(_QWORD *)(a1 + 48));
}

- (void)onqueue_handleFailedDaemonConnectionForQueuedMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCQueueManager setMessageOutstanding:](self, "setMessageOutstanding:", 0);
  if (objc_msgSend(v4, "retryCount") > 1)
  {
    -[WCQueueManager onqueue_dequeueMessage](self, "onqueue_dequeueMessage");
    objc_msgSend(v4, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCQueueManager onqueue_handleSentMessageWithIdentifier:error:](self, "onqueue_handleSentMessageWithIdentifier:error:", v7, v8);

  }
  else
  {
    -[WCQueueManager onqueue_attemptToSend](self, "onqueue_attemptToSend");
    objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136446466;
      v10 = "-[WCQueueManager onqueue_handleFailedDaemonConnectionForQueuedMessage:]";
      v11 = 2048;
      v12 = objc_msgSend(v4, "retryCount");
      _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s retrying %ld", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)onqueue_handleAcceptanceWithCurrentAccepted:(BOOL)a3 nextAvailable:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const char *v8;
  const char *v9;
  _BYTE v10[24];
  const char *v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    *(_QWORD *)&v10[4] = "-[WCQueueManager onqueue_handleAcceptanceWithCurrentAccepted:nextAvailable:]";
    if (v5)
      v9 = "YES";
    else
      v9 = "NO";
    *(_DWORD *)v10 = 136446722;
    *(_QWORD *)&v10[14] = v9;
    *(_WORD *)&v10[12] = 2080;
    if (v4)
      v8 = "YES";
    *(_WORD *)&v10[22] = 2080;
    v11 = v8;
    _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s current %s, next %s", v10, 0x20u);
  }

  if (v5 && (-[WCQueueManager onqueue_dequeueMessage](self, "onqueue_dequeueMessage"), v4))
    -[WCQueueManager onqueue_attemptToSend](self, "onqueue_attemptToSend");
  else
    -[WCQueueManager setCanSend:](self, "setCanSend:", 0, *(_OWORD *)v10, *(_QWORD *)&v10[16]);
}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WCQueueManager_handleSentMessageWithIdentifier_error___block_invoke;
  block[3] = &unk_24D661BA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

uint64_t __56__WCQueueManager_handleSentMessageWithIdentifier_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_handleSentMessageWithIdentifier:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)onqueue_handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v16 = "-[WCQueueManager onqueue_handleSentMessageWithIdentifier:error:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s id: %{public}@ with %{public}@", buf, 0x20u);

  }
  -[WCQueueManager inFlightMessages](self, "inFlightMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "completionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "completionHandler");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v13)[2](v13, v7);

    -[WCQueueManager inFlightMessages](self, "inFlightMessages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v6);

  }
}

- (void)cancelQueuedMessages
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WCQueueManager_cancelQueuedMessages__block_invoke;
  block[3] = &unk_24D661AB8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__WCQueueManager_cancelQueuedMessages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelQueuedMessages");
}

- (void)onqueue_cancelQueuedMessages
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[WCQueueManager inFlightMessages](self, "inFlightMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WCCompactStringFromCollection(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCQueueManager messageQueue](self, "messageQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WCCompactStringFromCollection(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v39 = "-[WCQueueManager onqueue_cancelQueuedMessages]";
    v40 = 2114;
    v41 = v6;
    v42 = 2114;
    v43 = v8;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s inflight messages %{public}@ queued messages %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7007);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        wc_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v39 = "-[WCQueueManager onqueue_cancelQueuedMessages]";
          v40 = 2114;
          v41 = v14;
          _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        objc_msgSend(v14, "completionHandler");
        v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v16)[2](v16, v9);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[WCQueueManager messageQueue](self, "messageQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        wc_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v39 = "-[WCQueueManager onqueue_cancelQueuedMessages]";
          v40 = 2114;
          v41 = v22;
          _os_log_impl(&dword_216F21000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        objc_msgSend(v22, "completionHandler");
        v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v24)[2](v24, v9);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
  }

  -[WCQueueManager inFlightMessages](self, "inFlightMessages");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAllObjects");

  -[WCQueueManager onqueue_clearQueuedMessages](self, "onqueue_clearQueuedMessages");
  -[WCQueueManager onqueue_cancelDaemonMessages](self, "onqueue_cancelDaemonMessages");

}

- (void)onqueue_cancelDaemonMessages
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[WCQueueManager onqueue_cancelDaemonMessages]";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v4, 0xCu);
  }

  +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOutstandingMessages");

}

- (void)onqueue_enqueueMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WCQueueManager messageQueue](self, "messageQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[WCQueueManager onqueue_attemptToSend](self, "onqueue_attemptToSend");
}

- (id)onqueue_peekMessage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[WCQueueManager messageQueue](self, "messageQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[WCQueueManager messageQueue](self, "messageQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)onqueue_dequeueMessage
{
  void *v3;
  uint64_t v4;
  id v5;

  -[WCQueueManager messageQueue](self, "messageQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[WCQueueManager messageQueue](self, "messageQueue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);

  }
}

- (void)onqueue_clearQueuedMessages
{
  id v2;

  -[WCQueueManager messageQueue](self, "messageQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)canSend
{
  return self->_canSend;
}

- (void)setCanSend:(BOOL)a3
{
  self->_canSend = a3;
}

- (BOOL)messageOutstanding
{
  return self->_messageOutstanding;
}

- (void)setMessageOutstanding:(BOOL)a3
{
  self->_messageOutstanding = a3;
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)inFlightMessages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInFlightMessages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightMessages, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

void __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446466;
  v5 = "-[WCQueueManager onqueue_attemptToSend]_block_invoke_4";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_216F21000, a2, OS_LOG_TYPE_ERROR, "%{public}s xpc failure due to %{public}@", buf, 0x16u);

}

@end
