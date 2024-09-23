@implementation CATConcreteIDSServiceConnectionDataMessageQueue

- (CATConcreteIDSServiceConnectionDataMessageQueue)initWithWorkQueue:(id)a3 timerSource:(id)a4 dataChunker:(id)a5 flushPromptInterval:(double)a6 supportsRetransmit:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  CATConcreteIDSServiceConnectionDataMessageQueue *v16;
  CATConcreteIDSServiceConnectionDataMessageQueue *v17;
  uint64_t v18;
  NSMutableDictionary *mSendContentsBySequenceNumber;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CATConcreteIDSServiceConnectionDataMessageQueue;
  v16 = -[CATConcreteIDSServiceConnectionDataMessageQueue init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->mWorkQueue, a3);
    objc_storeStrong((id *)&v17->mTimerSource, a4);
    objc_storeStrong((id *)&v17->mDataChunker, a5);
    v17->mFlushPromptInterval = a6;
    v17->mSupportsRetransmit = a7;
    v18 = objc_opt_new();
    mSendContentsBySequenceNumber = v17->mSendContentsBySequenceNumber;
    v17->mSendContentsBySequenceNumber = (NSMutableDictionary *)v18;

  }
  return v17;
}

- (void)receiveData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATIDSServiceConnectionMessageQueue.m"), 67, CFSTR("Attempted to enqueue data to send of lenght 0"));

  }
  -[CATIDSServiceConnectionDataChunker chunkDataIntoMessageContent:](self->mDataChunker, "chunkDataIntoMessageContent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->mSupportsRetransmit)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sequenceNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    v21 = v13;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __74__CATConcreteIDSServiceConnectionDataMessageQueue_receiveData_completion___block_invoke;
    v17[3] = &unk_24C1C6318;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v10, "cat_forEach:", v17);
    self->mTailSequenceNumber = v19[3] + 1;
    if (!self->mFlushTimer)
      -[CATConcreteIDSServiceConnectionDataMessageQueue scheduleFlushTimer](self, "scheduleFlushTimer");
    -[CATConcreteIDSServiceConnectionDataMessageQueue delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataMessageQueue:needsToSendContents:shouldSkipTheLine:completion:", self, v10, 0, v8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    -[CATConcreteIDSServiceConnectionDataMessageQueue delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataMessageQueue:needsToSendContents:shouldSkipTheLine:completion:", self, v10, 0, v8);

  }
}

void __74__CATConcreteIDSServiceConnectionDataMessageQueue_receiveData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v16 = v3;
  objc_msgSend(v3, "sequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v4 <= v6)
    v7 = v6;
  else
    v7 = v4;
  if (v4 >= v6)
    v8 = v6;
  else
    v8 = v4;
  if (v8 + ~v7 > 0x186A0)
  {
    v9 = v4 >= v6;
    v10 = v4 > v6;
  }
  else
  {
    v9 = v6 >= v4;
    v10 = v6 > v4;
  }
  v11 = !v9;
  if (v10)
    goto LABEL_16;

  if (v11)
  {
    objc_msgSend(v16, "sequenceNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "unsignedIntegerValue");
LABEL_16:

  }
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v16, "sequenceNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v15);

}

- (void)receiveRemoteSequenceNumber:(unint64_t)a3
{
  unint64_t mHeadSequenceNumber;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  BOOL v11;
  NSMutableDictionary *mSendContentsBySequenceNumber;
  void *v13;
  CATTimer *mFlushTimer;

  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  mHeadSequenceNumber = self->mHeadSequenceNumber;
  v6 = mHeadSequenceNumber - 1;
  if (mHeadSequenceNumber - 1 <= a3)
    v7 = a3;
  else
    v7 = mHeadSequenceNumber - 1;
  if (mHeadSequenceNumber - 1 >= a3)
    v8 = a3;
  else
    v8 = mHeadSequenceNumber - 1;
  if (v8 + ~v7 > 0x186A0)
  {
    v11 = v6 > a3;
    v10 = v6 < a3;
    if (v11)
      return;
  }
  else
  {
    v9 = v6 >= a3;
    v10 = v6 > a3;
    if (!v9)
      return;
  }
  if (v10)
  {
    for (; mHeadSequenceNumber <= a3; ++mHeadSequenceNumber)
    {
      mSendContentsBySequenceNumber = self->mSendContentsBySequenceNumber;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", mHeadSequenceNumber);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](mSendContentsBySequenceNumber, "setObject:forKeyedSubscript:", 0, v13);

    }
    self->mHeadSequenceNumber = a3 + 1;
    if (a3 + 1 >= self->mTailSequenceNumber)
    {
      -[CATTimer invalidate](self->mFlushTimer, "invalidate");
      mFlushTimer = self->mFlushTimer;
      self->mFlushTimer = 0;

    }
    else
    {
      -[CATConcreteIDSServiceConnectionDataMessageQueue scheduleFlushTimer](self, "scheduleFlushTimer");
    }
  }
}

- (void)retransmitSequenceNumbers:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (objc_msgSend(v6, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitSequenceNumbers___block_invoke;
    v8[3] = &unk_24C1C5AD8;
    v8[4] = self;
    objc_msgSend(v6, "cat_map:", v8);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableDictionary allValues](self->mSendContentsBySequenceNumber, "allValues");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  -[CATConcreteIDSServiceConnectionDataMessageQueue retransmitContent:](self, "retransmitContent:", v4, v6);

}

uint64_t __77__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitSequenceNumbers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", a2);
}

+ (id)flushTimerIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-FlushTimer"), a1);
}

- (void)scheduleFlushTimer
{
  CATTimerSource *mTimerSource;
  void *v4;
  double mFlushPromptInterval;
  OS_dispatch_queue *mWorkQueue;
  CATTimer *v7;
  CATTimer *mFlushTimer;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[CATTimer invalidate](self->mFlushTimer, "invalidate");
  mTimerSource = self->mTimerSource;
  objc_msgSend((id)objc_opt_class(), "flushTimerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  mFlushPromptInterval = self->mFlushPromptInterval;
  mWorkQueue = self->mWorkQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__CATConcreteIDSServiceConnectionDataMessageQueue_scheduleFlushTimer__block_invoke;
  v9[3] = &unk_24C1C6340;
  objc_copyWeak(&v10, &location);
  -[CATTimerSource scheduleInfiniteTimerWithIdentifier:timeInterval:queue:fireHandler:](mTimerSource, "scheduleInfiniteTimerWithIdentifier:timeInterval:queue:fireHandler:", v4, mWorkQueue, v9, mFlushPromptInterval);
  v7 = (CATTimer *)objc_claimAutoreleasedReturnValue();
  mFlushTimer = self->mFlushTimer;
  self->mFlushTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__CATConcreteIDSServiceConnectionDataMessageQueue_scheduleFlushTimer__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "flushTimerDidFire:fireCount:", v5, a3);

}

- (void)flushTimerDidFire:(id)a3 fireCount:(unint64_t)a4
{
  char v4;
  NSObject *mWorkQueue;
  CATTimer *v7;
  CATTimer *mFlushTimer;
  id v9;

  v4 = a4;
  mWorkQueue = self->mWorkQueue;
  v7 = (CATTimer *)a3;
  CATAssertIsQueue(mWorkQueue);
  mFlushTimer = self->mFlushTimer;

  if ((v4 & 1) != 0 && mFlushTimer == v7)
  {
    -[CATConcreteIDSServiceConnectionDataMessageQueue delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataMessageQueue:wantsToCheckRemote:", self, self->mHeadSequenceNumber - 1);

  }
}

- (void)retransmitContent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CATConcreteIDSServiceConnectionDataMessageQueue delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke;
  v7[3] = &unk_24C1C6368;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dataMessageQueue:needsToSendContents:shouldSkipTheLine:completion:", self, v6, 1, v7);

}

void __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    if (_CATLogGeneral_onceToken_17 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_17, &__block_literal_global_23);
    v4 = _CATLogGeneral_logObj_17;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_17, OS_LOG_TYPE_ERROR))
      __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke_cold_1(a1, v4);
  }

}

- (CATIDSServiceConnectionDataMessageQueueDelegate)delegate
{
  return (CATIDSServiceConnectionDataMessageQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mSendContentsBySequenceNumber, 0);
  objc_storeStrong((id *)&self->mFlushTimer, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong((id *)&self->mDataChunker, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

void __69__CATConcreteIDSServiceConnectionDataMessageQueue_retransmitContent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_209592000, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed to send data contents: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
