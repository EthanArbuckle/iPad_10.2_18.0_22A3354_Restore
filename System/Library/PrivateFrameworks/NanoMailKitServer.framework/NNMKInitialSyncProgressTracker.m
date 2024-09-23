@implementation NNMKInitialSyncProgressTracker

- (void)setSyncStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncStateManager, a3);
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)startTrackingInitialSync
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Started tracking initial sync", v4, 2u);
  }
  *(_WORD *)&self->_trackingInitialSync = 257;
  self->_initialSyncProgress = 0.0;
  -[NNMKSyncStateManager reportInitialSyncProgress:](self->_syncStateManager, "reportInitialSyncProgress:", 0.0);
  -[NNMKInitialSyncProgressTracker startSyncTimeoutForAccounts](self, "startSyncTimeoutForAccounts");
  self->_isWaitingForAccounts = 1;
}

- (void)updateProgressWithAccountsSent
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_trackingInitialSync)
  {
    v3 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Accounts sent to paired device", v4, 2u);
    }
    -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.05);
    -[NNMKInitialSyncProgressTracker startSyncTimeoutForMessageHeaders](self, "startSyncTimeoutForMessageHeaders");
    self->_isWaitingForMessageHeaders = 1;
  }
}

- (void)updateProgressWithAccountsArrivedInPairedDevice
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_trackingInitialSync)
  {
    v3 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Accounts arrived in paired device", v4, 2u);
    }
    -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.1);
  }
}

- (void)updateProgressWithMessageHeadersSent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *initialSyncMessageIdsToSyncContent;
  NSMutableSet *v11;
  NSMutableSet *initialSyncMessageIdsOfContentToAck;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_trackingInitialSync)
  {
    v5 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v13 = 134217984;
      v14 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Message headers will be sent. (Message count: %lu)", (uint8_t *)&v13, 0xCu);

    }
    -[NNMKInitialSyncProgressTracker cancelTimeout](self, "cancelTimeout");
    self->_initialSyncMessagesCount = objc_msgSend(v4, "count");
    v7 = (void *)MEMORY[0x24BDBCEF0];
    +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    initialSyncMessageIdsToSyncContent = self->_initialSyncMessageIdsToSyncContent;
    self->_initialSyncMessageIdsToSyncContent = v9;

    v11 = (NSMutableSet *)-[NSMutableSet mutableCopy](self->_initialSyncMessageIdsToSyncContent, "mutableCopy");
    initialSyncMessageIdsOfContentToAck = self->_initialSyncMessageIdsOfContentToAck;
    self->_initialSyncMessageIdsOfContentToAck = v11;

    if (-[NSMutableSet count](self->_initialSyncMessageIdsToSyncContent, "count"))
    {
      -[NNMKInitialSyncProgressTracker startSyncTimeoutForMessageContent](self, "startSyncTimeoutForMessageContent");
      self->_isWaitingForMessageContent = 1;
    }
    else
    {
      -[NNMKInitialSyncProgressTracker finishedSendingInitialSyncContentToPairedDevice](self, "finishedSendingInitialSyncContentToPairedDevice");
    }
  }
  -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.05);

}

- (void)updateProgressWithMessageHeadersArrivedInPairedDevice
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[NNMKInitialSyncProgressTracker isTrackingInitialSync](self, "isTrackingInitialSync"))
  {
    v3 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Message headers arrived in paired device", v4, 2u);
    }
    -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.1);
  }
}

- (void)updateProgressWithMessageContentArrivedInPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_initialSyncMessageIdsOfContentToAck, "containsObject:", v4))
  {
    -[NNMKInitialSyncProgressTracker delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDeviceRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncedMessageForMessageWithId:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isContentCompletelySynced"))
    {
      v8 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v4;
        _os_log_impl(&dword_22E161000, v8, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Content Download for message. (%{public}@)", (uint8_t *)&v9, 0xCu);
      }
      -[NSMutableSet removeObject:](self->_initialSyncMessageIdsOfContentToAck, "removeObject:", v4);
      -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.4 / (double)self->_initialSyncMessagesCount);
    }

  }
}

- (void)updateProgressWithMessageContentDownloadFailed:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_initialSyncMessageIdsOfContentToAck, "containsObject:", v4))
  {
    v5 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Content Download failed for message. (%{public}@)", (uint8_t *)&v6, 0xCu);
    }
    -[NNMKInitialSyncProgressTracker updateProgressWithContentCompletelySyncedForMessageId:](self, "updateProgressWithContentCompletelySyncedForMessageId:", v4);
    -[NSMutableSet removeObject:](self->_initialSyncMessageIdsOfContentToAck, "removeObject:", v4);
    -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.4 / (double)self->_initialSyncMessagesCount);
  }

}

- (void)updateProgressWithContentCompletelySyncedForMessageId:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_initialSyncMessageIdsToSyncContent, "containsObject:", v4))
  {
    v5 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Content completely synced for message. (%{public}@)", (uint8_t *)&v6, 0xCu);
    }
    -[NSMutableSet removeObject:](self->_initialSyncMessageIdsToSyncContent, "removeObject:", v4);
    -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.2 / (double)self->_initialSyncMessagesCount);
    if (!-[NSMutableSet count](self->_initialSyncMessageIdsToSyncContent, "count"))
      -[NNMKInitialSyncProgressTracker finishedSendingInitialSyncContentToPairedDevice](self, "finishedSendingInitialSyncContentToPairedDevice");
  }

}

- (void)finishedSendingInitialSyncContentToPairedDevice
{
  void *v3;
  void *v4;
  _BOOL8 trackingInitialSyncContent;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_trackingInitialSync && self->_trackingInitialSyncContent)
  {
    v3 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x24BDD16E0];
      trackingInitialSyncContent = self->_trackingInitialSyncContent;
      v6 = v3;
      objc_msgSend(v4, "numberWithBool:", trackingInitialSyncContent);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Finished sending initial content to paired device. Waiting for ack... _trackingInitialSyncContent: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[NNMKInitialSyncProgressTracker cancelTimeout](self, "cancelTimeout");
    -[NNMKInitialSyncProgressTracker delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackerDidFinishSendingInitialSyncContentToPairedDevice:", self);

    -[NNMKSyncStateManager reportInitialSyncDidCompleteSending](self->_syncStateManager, "reportInitialSyncDidCompleteSending");
    self->_trackingInitialSyncContent = 0;
  }
}

- (void)syncCompleted
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[NNMKInitialSyncProgressTracker isTrackingInitialSync](self, "isTrackingInitialSync"))
  {
    v3 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Initial sync finished. Reporting to PairedSync...", v4, 2u);
    }
    -[NNMKInitialSyncProgressTracker incrementProgressBy:](self, "incrementProgressBy:", 0.1);
    -[NNMKSyncStateManager reportInitialSyncDidComplete](self->_syncStateManager, "reportInitialSyncDidComplete");
    -[NNMKInitialSyncProgressTracker _handleInitialSyncCompleted](self, "_handleInitialSyncCompleted");
  }
}

- (void)syncFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NNMKSyncStateManager *syncStateManager;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NNMKInitialSyncProgressTracker isTrackingInitialSync](self, "isTrackingInitialSync"))
  {
    v5 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKInitialSyncProgressTracker syncFailedWithError:].cold.1(v5);
    syncStateManager = self->_syncStateManager;
    v7 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoMail.InitialSyncError"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncStateManager reportInitialSyncDidFailWithError:](syncStateManager, "reportInitialSyncDidFailWithError:", v9);

    -[NNMKInitialSyncProgressTracker _handleInitialSyncCompleted](self, "_handleInitialSyncCompleted");
  }

}

- (void)incrementProgressBy:(double)a3
{
  double v4;
  NSObject *v5;
  double initialSyncProgress;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_trackingInitialSync)
  {
    v4 = self->_initialSyncProgress + a3;
    if (v4 > 1.0)
      v4 = 1.0;
    self->_initialSyncProgress = v4;
    -[NNMKSyncStateManager reportInitialSyncProgress:](self->_syncStateManager, "reportInitialSyncProgress:");
    v5 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      initialSyncProgress = self->_initialSyncProgress;
      v7 = 134217984;
      v8 = initialSyncProgress;
      _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Reported (%.2f).", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleInitialSyncCompleted
{
  NSMutableSet *initialSyncMessageIdsToSyncContent;
  NSMutableSet *initialSyncMessageIdsOfContentToAck;

  -[NNMKInitialSyncProgressTracker cancelTimeout](self, "cancelTimeout");
  self->_trackingInitialSync = 0;
  self->_initialSyncProgress = 0.0;
  self->_initialSyncMessagesCount = 0;
  initialSyncMessageIdsToSyncContent = self->_initialSyncMessageIdsToSyncContent;
  self->_initialSyncMessageIdsToSyncContent = 0;

  initialSyncMessageIdsOfContentToAck = self->_initialSyncMessageIdsOfContentToAck;
  self->_initialSyncMessageIdsOfContentToAck = 0;

}

- (BOOL)isTrackingInitialSync
{
  return self->_trackingInitialSync;
}

- (void)startSyncTimeoutForAccounts
{
  double v3;
  dispatch_time_t v4;
  NSObject *executionQueue;
  _QWORD block[5];
  id v7;
  id location;

  self->_timeoutCanceledForAccounts = 0;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "syncTimeout");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__NNMKInitialSyncProgressTracker_startSyncTimeoutForAccounts__block_invoke;
  block[3] = &unk_24F9F6BA0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_after(v4, executionQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__NNMKInitialSyncProgressTracker_startSyncTimeoutForAccounts__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 13))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "initialSyncTimedOut");
    WeakRetained = v3;
  }

}

- (void)startSyncTimeoutForMessageHeaders
{
  double v3;
  dispatch_time_t v4;
  NSObject *executionQueue;
  _QWORD block[5];
  id v7;
  id location;

  self->_timeoutCanceledForMessageHeaders = 0;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "syncTimeout");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageHeaders__block_invoke;
  block[3] = &unk_24F9F6BA0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_after(v4, executionQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageHeaders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 14))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "initialSyncTimedOut");
    WeakRetained = v3;
  }

}

- (void)startSyncTimeoutForMessageContent
{
  double v3;
  dispatch_time_t v4;
  NSObject *executionQueue;
  _QWORD block[5];
  id v7;
  id location;

  self->_timeoutCanceledForMessageContent = 0;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "syncTimeout");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageContent__block_invoke;
  block[3] = &unk_24F9F6BA0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_after(v4, executionQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageContent__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 15))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "initialSyncTimedOut");
    WeakRetained = v3;
  }

}

- (void)cancelTimeout
{
  *(_WORD *)&self->_timeoutCanceledForAccounts = 257;
  self->_timeoutCanceledForMessageContent = 1;
  -[NNMKInitialSyncProgressTracker resetFlags](self, "resetFlags");
}

- (void)resetFlags
{
  *(_WORD *)&self->_isWaitingForAccounts = 0;
  self->_isWaitingForMessageContent = 0;
}

- (void)initialSyncTimedOut
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_trackingInitialSync)
  {
    if (self->_isWaitingForMessageContent)
    {
      v3 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - MobileMail took too long to download the content for all the messages for the initial sync. We're ignoring the next content downloads for the sake of reporting to PairedSync. Notifying paired watch that we're done sending content...", buf, 2u);
      }
    }
    if (self->_isWaitingForAccounts)
    {
      v4 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Initial sync progress - MobileMail took too long to reply with accounts.", v9, 2u);
      }
    }
    if (self->_isWaitingForMessageHeaders)
    {
      v5 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - MobileMail took too long to reply with message headers.", v8, 2u);
      }
    }
    v6 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Initial sync timed out. Forcing completion and reporting to PairedSync.", v7, 2u);
    }
    -[NSMutableSet removeAllObjects](self->_initialSyncMessageIdsToSyncContent, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_initialSyncMessageIdsOfContentToAck, "removeAllObjects");
    -[NNMKInitialSyncProgressTracker finishedSendingInitialSyncContentToPairedDevice](self, "finishedSendingInitialSyncContentToPairedDevice");
    -[NNMKInitialSyncProgressTracker cancelTimeout](self, "cancelTimeout");
  }
}

+ (double)syncTimeout
{
  return 30.0;
}

- (NNMKInitialSyncProgressTrackerDelegate)delegate
{
  return (NNMKInitialSyncProgressTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NNMKSyncStateManager)syncStateManager
{
  return self->_syncStateManager;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (BOOL)trackingInitialSync
{
  return self->_trackingInitialSync;
}

- (void)setTrackingInitialSync:(BOOL)a3
{
  self->_trackingInitialSync = a3;
}

- (BOOL)trackingInitialSyncContent
{
  return self->_trackingInitialSyncContent;
}

- (void)setTrackingInitialSyncContent:(BOOL)a3
{
  self->_trackingInitialSyncContent = a3;
}

- (double)initialSyncProgress
{
  return self->_initialSyncProgress;
}

- (void)setInitialSyncProgress:(double)a3
{
  self->_initialSyncProgress = a3;
}

- (unint64_t)initialSyncMessagesCount
{
  return self->_initialSyncMessagesCount;
}

- (void)setInitialSyncMessagesCount:(unint64_t)a3
{
  self->_initialSyncMessagesCount = a3;
}

- (NSMutableSet)initialSyncMessageIdsToSyncContent
{
  return self->_initialSyncMessageIdsToSyncContent;
}

- (void)setInitialSyncMessageIdsToSyncContent:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncMessageIdsToSyncContent, a3);
}

- (NSMutableSet)initialSyncMessageIdsOfContentToAck
{
  return self->_initialSyncMessageIdsOfContentToAck;
}

- (void)setInitialSyncMessageIdsOfContentToAck:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncMessageIdsOfContentToAck, a3);
}

- (BOOL)isWaitingForAccounts
{
  return self->_isWaitingForAccounts;
}

- (void)setIsWaitingForAccounts:(BOOL)a3
{
  self->_isWaitingForAccounts = a3;
}

- (BOOL)isWaitingForMessageHeaders
{
  return self->_isWaitingForMessageHeaders;
}

- (void)setIsWaitingForMessageHeaders:(BOOL)a3
{
  self->_isWaitingForMessageHeaders = a3;
}

- (BOOL)isWaitingForMessageContent
{
  return self->_isWaitingForMessageContent;
}

- (void)setIsWaitingForMessageContent:(BOOL)a3
{
  self->_isWaitingForMessageContent = a3;
}

- (BOOL)timeoutCanceledForAccounts
{
  return self->_timeoutCanceledForAccounts;
}

- (void)setTimeoutCanceledForAccounts:(BOOL)a3
{
  self->_timeoutCanceledForAccounts = a3;
}

- (BOOL)timeoutCanceledForMessageHeaders
{
  return self->_timeoutCanceledForMessageHeaders;
}

- (void)setTimeoutCanceledForMessageHeaders:(BOOL)a3
{
  self->_timeoutCanceledForMessageHeaders = a3;
}

- (BOOL)timeoutCanceledForMessageContent
{
  return self->_timeoutCanceledForMessageContent;
}

- (void)setTimeoutCanceledForMessageContent:(BOOL)a3
{
  self->_timeoutCanceledForMessageContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncMessageIdsOfContentToAck, 0);
  objc_storeStrong((id *)&self->_initialSyncMessageIdsToSyncContent, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncStateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)syncFailedWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Initial sync progress - Initial sync failed. Reporting to PairedSync...", v1, 2u);
}

@end
