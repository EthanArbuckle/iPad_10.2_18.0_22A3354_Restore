@implementation CATSharingBroadcastConnection

- (CATSharingBroadcastConnection)initWithBroadcastPrimitives:(id)a3 timerSource:(id)a4
{
  id v7;
  id v8;
  CATSharingBroadcastConnection *v9;
  CATSharingBroadcastConnection *v10;
  uint64_t v11;
  CATOperationQueue *mOutgoingQueue;
  uint64_t v13;
  CATOperationQueue *mCatalystQueue;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CATSharingBroadcastConnection;
  v9 = -[CATSharingBroadcastConnection init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mBroadcastPrimitives, a3);
    objc_storeStrong((id *)&v10->mTimerSource, a4);
    -[CATSharingBroadcastConnection addBroadcastPrimitiveHandlers](v10, "addBroadcastPrimitiveHandlers");
    v11 = objc_opt_new();
    mOutgoingQueue = v10->mOutgoingQueue;
    v10->mOutgoingQueue = (CATOperationQueue *)v11;

    v13 = objc_opt_new();
    mCatalystQueue = v10->mCatalystQueue;
    v10->mCatalystQueue = (CATOperationQueue *)v13;

    CATGetCatalystQueue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setUnderlyingQueue:](v10->mCatalystQueue, "setUnderlyingQueue:", v15);

  }
  return v10;
}

- (CATSharingDevice)remoteDevice
{
  return (CATSharingDevice *)-[CATSharingBroadcastPrimitives remoteDevice](self->mBroadcastPrimitives, "remoteDevice");
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__CATSharingBroadcastConnection_sendData_completion___block_invoke;
  v13[3] = &unk_24C1C5BB0;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = v13;
  CATGetCatalystQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_1;
  block[3] = &unk_24C1C5998;
  v19 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __53__CATSharingBroadcastConnection_sendData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_sendData:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)close
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__CATSharingBroadcastConnection_close__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_1;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__CATSharingBroadcastConnection_close__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_close");

}

- (void)_sendData:(id)a3 completion:(id)a4
{
  void (**v6)(id, CATSharingSentMessage *);
  NSObject *v7;
  CATSharingSentMessage *v8;
  CATSharingMessage *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, CATSharingSentMessage *))a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  if (self->mIsClosing || -[CATSharingBroadcastConnection isClosed](self, "isClosed"))
  {
    CATErrorWithCodeAndUserInfo(100, 0);
    v8 = (CATSharingSentMessage *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }
  else
  {
    v8 = -[CATSharingSentMessage initWithContent:]([CATSharingSentMessage alloc], "initWithContent:", v10);
    v9 = -[CATSharingMessage initWithContentMessage:]([CATSharingMessage alloc], "initWithContentMessage:", v8);
    -[CATSharingBroadcastConnection sendMessage:completion:](self, "sendMessage:completion:", v9, v6);

  }
}

- (void)_close
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (!-[CATSharingBroadcastConnection isClosed](self, "isClosed") && !self->mIsClosing)
    -[CATSharingBroadcastConnection closeWithError:reportToRemote:](self, "closeWithError:reportToRemote:", 0, 1);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  CATSendBroadcastMessageOperation *v10;
  void *v11;
  CATSendBroadcastMessageOperation *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CATSendBroadcastMessageOperation *v18;
  void (**v19)(id, void *);
  id v20;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  if (-[CATSharingBroadcastConnection isClosed](self, "isClosed"))
  {
    CATErrorWithCodeAndUserInfo(100, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
  else
  {
    v10 = -[CATSendBroadcastMessageOperation initWithBroadcastPrimitive:message:]([CATSendBroadcastMessageOperation alloc], "initWithBroadcastPrimitive:message:", self->mBroadcastPrimitives, v6);
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x24BDD1478];
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __56__CATSharingBroadcastConnection_sendMessage_completion___block_invoke;
    v17 = &unk_24C1C5BD8;
    v12 = v10;
    v18 = v12;
    v19 = v7;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v11, "blockOperationWithBlock:", &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addDependency:", v12, v14, v15, v16, v17);
    -[CATOperationQueue addOperation:](self->mOutgoingQueue, "addOperation:", v12);
    -[CATOperationQueue addOperation:](self->mCatalystQueue, "addOperation:", v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __56__CATSharingBroadcastConnection_sendMessage_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;

  CATGetCatalystQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v2);

  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "closeWithError:reportToRemote:", v4, 0);

  }
}

- (void)closeWithError:(id)a3 reportToRemote:(BOOL)a4
{
  NSObject *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (!-[CATSharingBroadcastConnection isClosed](self, "isClosed") && !self->mIsClosing)
  {
    self->mIsClosing = 1;
    if (a4)
      -[CATSharingBroadcastConnection sendTearDownMessageWithError:](self, "sendTearDownMessageWithError:", v7);
    else
      -[CATSharingBroadcastConnection tombstoneWithError:](self, "tombstoneWithError:", v7);
  }

}

- (void)tombstoneWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (!-[CATSharingBroadcastConnection isClosed](self, "isClosed"))
  {
    -[CATSharingBroadcastConnection setClosed:](self, "setClosed:", 1);
    self->mIsClosing = 0;
    -[CATOperationQueue cancelAllOperations](self->mOutgoingQueue, "cancelAllOperations");
    -[CATSharingBroadcastConnection removeBroadcastPrimitiveHandlers](self, "removeBroadcastPrimitiveHandlers");
    -[CATSharingBroadcastPrimitives deactivate](self->mBroadcastPrimitives, "deactivate");
    -[CATSharingBroadcastConnection setClosedError:](self, "setClosedError:", v6);
    -[CATSharingBroadcastConnection delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectionClosed:", self);

  }
}

- (void)addBroadcastPrimitiveHandlers
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke;
  v6[3] = &unk_24C1C5C28;
  objc_copyWeak(&v7, &location);
  -[CATSharingBroadcastPrimitives setInvalidationHandler:](self->mBroadcastPrimitives, "setInvalidationHandler:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_3;
  v4[3] = &unk_24C1C5C50;
  objc_copyWeak(&v5, &location);
  -[CATSharingBroadcastPrimitives setMessageReceivedHandler:](self->mBroadcastPrimitives, "setMessageReceivedHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isClosed") & 1) == 0 && !*((_BYTE *)v5 + 16))
  {
    v6 = (void *)v5[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_2;
    v7[3] = &unk_24C1C5C00;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

uint64_t __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeWithError:reportToRemote:", *(_QWORD *)(a1 + 40), 0);
}

void __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isClosed") & 1) == 0)
  {
    v6 = (void *)v5[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_4;
    v7[3] = &unk_24C1C5C00;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

uint64_t __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageReceived:", *(_QWORD *)(a1 + 40));
}

- (void)removeBroadcastPrimitiveHandlers
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATSharingBroadcastPrimitives setInvalidationHandler:](self->mBroadcastPrimitives, "setInvalidationHandler:", 0);
  -[CATSharingBroadcastPrimitives setMessageReceivedHandler:](self->mBroadcastPrimitives, "setMessageReceivedHandler:", 0);
}

- (void)messageReceived:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  +[CATSharingMessage instanceWithDictionary:](CATSharingMessage, "instanceWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "messageType");
    objc_msgSend(v7, "contentDictionaryValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == 1)
    {
      -[CATSharingBroadcastConnection handleSentMessage:](self, "handleSentMessage:", v9);
    }
    else if (v8 == 2)
    {
      -[CATSharingBroadcastConnection handleCloseMessage:](self, "handleCloseMessage:", v9);
    }
    else
    {
      _CATLogGeneral_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CATSharingBroadcastConnection messageReceived:].cold.1(v8, v10);

      -[CATSharingBroadcastConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v9);
    }

  }
  else
  {
    -[CATSharingBroadcastConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v4);
  }

}

- (void)handleUnparsableMessageDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  if (!-[CATSharingBroadcastConnection isClosed](self, "isClosed"))
  {
    _CATLogGeneral_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CATSharingBroadcastConnection handleUnparsableMessageDictionary:].cold.1((uint64_t)v4, v6, v7);

    CATErrorWithCodeAndUserInfo(300, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATSharingBroadcastConnection closeWithError:reportToRemote:](self, "closeWithError:reportToRemote:", v8, !self->mIsClosing);

  }
}

- (void)handleCloseMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  +[CATSharingCloseMessage instanceWithDictionary:](CATSharingCloseMessage, "instanceWithDictionary:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!self->mIsClosing)
    {
      objc_msgSend(v5, "closeError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATSharingBroadcastConnection closeWithError:reportToRemote:](self, "closeWithError:reportToRemote:", v7, 0);

    }
  }
  else
  {
    -[CATSharingBroadcastConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v8);
  }

}

- (void)handleSentMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  +[CATSharingSentMessage instanceWithDictionary:](CATSharingSentMessage, "instanceWithDictionary:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CATSharingBroadcastConnection delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connection:receivedData:", self, v7);

  }
  else
  {
    -[CATSharingBroadcastConnection handleUnparsableMessageDictionary:](self, "handleUnparsableMessageDictionary:", v8);
  }

}

- (void)sendTearDownMessageWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CATSharingCloseMessage *v8;
  CATSharingMessage *v9;
  CATTimerSource *mTimerSource;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  CATTimer *v15;
  CATTimer *mTombstoneTimer;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    CATErrorWithCodeAndUserInfo(103, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = -[CATSharingCloseMessage initWithError:]([CATSharingCloseMessage alloc], "initWithError:", v6);
  v9 = -[CATSharingMessage initWithContentMessage:]([CATSharingMessage alloc], "initWithContentMessage:", v8);
  -[CATSharingBroadcastConnection sendMessage:completion:](self, "sendMessage:completion:", v9, &__block_literal_global_4);
  objc_initWeak(&location, self);
  mTimerSource = self->mTimerSource;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CATGetCatalystQueue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_9;
  v17[3] = &unk_24C1C5A88;
  objc_copyWeak(&v19, &location);
  v14 = v5;
  v18 = v14;
  -[CATTimerSource scheduleOneShotTimerWithIdentifier:timeInterval:queue:fireHandler:](mTimerSource, "scheduleOneShotTimerWithIdentifier:timeInterval:queue:fireHandler:", v12, v13, v17, 0.5);
  v15 = (CATTimer *)objc_claimAutoreleasedReturnValue();
  mTombstoneTimer = self->mTombstoneTimer;
  self->mTombstoneTimer = v15;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  if (v2)
  {
    _CATLogGeneral_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_cold_1((uint64_t)v2, v3, v4);

  }
}

void __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isClosed");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "tombstoneWithError:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (CATSharingConnectionDelegate)delegate
{
  return (CATSharingConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (NSError)closedError
{
  return self->_closedError;
}

- (void)setClosedError:(id)a3
{
  objc_storeStrong((id *)&self->_closedError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closedError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mCatalystQueue, 0);
  objc_storeStrong((id *)&self->mOutgoingQueue, 0);
  objc_storeStrong((id *)&self->mTombstoneTimer, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong((id *)&self->mBroadcastPrimitives, 0);
}

- (void)messageReceived:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, v4, "Unknown message type: %{public}@", (uint8_t *)&v5);

}

- (void)handleUnparsableMessageDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, a3, "Unable to decode message: %{public}@", (uint8_t *)&v3);
}

void __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_209592000, a2, a3, "Error sending close message: %{public}@", (uint8_t *)&v3);
}

@end
