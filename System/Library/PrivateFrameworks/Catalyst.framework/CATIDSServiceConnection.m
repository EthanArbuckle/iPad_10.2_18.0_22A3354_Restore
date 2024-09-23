@implementation CATIDSServiceConnection

- (CATIDSServiceConnection)initWithMetadata:(id)a3 configuration:(id)a4 IDSPrimitives:(id)a5 messageBroadcaster:(id)a6 timerSource:(id)a7 dataMessageQueue:(id)a8 dataAggregator:(id)a9 assertion:(id)a10 workQueue:(id)a11 delegateQueue:(id)a12 destinationAddress:(id)a13 sourceAppleID:(id)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  CATIDSServiceConnection *v24;
  id v25;
  uint64_t v26;
  NSString *mDestinationAddress;
  uint64_t v28;
  NSString *mSourceAppleID;
  uint64_t v30;
  CATOperationQueue *mSendQueue;
  void *v32;
  CATSerialOperationEnqueuer *v33;
  CATSerialOperationEnqueuer *mControlOperationEnqueuer;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  CATResettableTimer *mKeepAliveTimer;
  CATIDSServiceConnectionMessageProcessor *v41;
  void *v42;
  uint64_t v43;
  CATIDSServiceConnectionMessageProcessor *mMessageProcessor;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id location;
  objc_super v59;

  v54 = a3;
  v19 = a4;
  v52 = a5;
  v51 = a6;
  v55 = a7;
  v50 = a8;
  v49 = a9;
  v48 = a10;
  v20 = a11;
  v47 = a12;
  v21 = a13;
  v22 = v19;
  v23 = a14;
  v59.receiver = self;
  v59.super_class = (Class)CATIDSServiceConnection;
  v24 = -[CATIDSServiceConnection init](&v59, sel_init);
  if (v24)
  {
    objc_initWeak(&location, v24);
    objc_storeStrong((id *)&v24->_metadata, a3);
    objc_storeStrong((id *)&v24->mIDSPrimitives, a5);
    objc_storeStrong((id *)&v24->mAssertion, a10);
    objc_storeStrong((id *)&v24->mMessageBroadcaster, a6);
    objc_storeStrong((id *)&v24->mWorkQueue, a11);
    objc_storeStrong((id *)&v24->mDelegateQueue, a12);
    v25 = v21;
    v26 = objc_msgSend(v21, "copy");
    mDestinationAddress = v24->mDestinationAddress;
    v24->mDestinationAddress = (NSString *)v26;

    v28 = objc_msgSend(v23, "copy");
    mSourceAppleID = v24->mSourceAppleID;
    v24->mSourceAppleID = (NSString *)v28;

    v30 = objc_opt_new();
    mSendQueue = v24->mSendQueue;
    v24->mSendQueue = (CATOperationQueue *)v30;

    -[CATOperationQueue setUnderlyingQueue:](v24->mSendQueue, "setUnderlyingQueue:", v20);
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setUnderlyingQueue:", v20);
    v33 = -[CATSerialOperationEnqueuer initWithTargetOperationQueue:]([CATSerialOperationEnqueuer alloc], "initWithTargetOperationQueue:", v32);
    mControlOperationEnqueuer = v24->mControlOperationEnqueuer;
    v24->mControlOperationEnqueuer = v33;

    objc_storeStrong((id *)&v24->mDataMessageQueue, a8);
    objc_storeStrong((id *)&v24->mDataAggregator, a9);
    objc_msgSend((id)objc_opt_class(), "keepAliveTimerIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "keepAliveCheckinInterval");
    v37 = v36;
    v38 = objc_msgSend(v22, "keepAliveAttemptCount");
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __202__CATIDSServiceConnection_initWithMetadata_configuration_IDSPrimitives_messageBroadcaster_timerSource_dataMessageQueue_dataAggregator_assertion_workQueue_delegateQueue_destinationAddress_sourceAppleID___block_invoke;
    v56[3] = &unk_24C1C5DD0;
    objc_copyWeak(&v57, &location);
    objc_msgSend(v55, "scheduleRepeatTimerWithIdentifier:timeInterval:queue:totalFires:fireHandler:", v35, v20, v38, v56, v37);
    v39 = objc_claimAutoreleasedReturnValue();
    mKeepAliveTimer = v24->mKeepAliveTimer;
    v24->mKeepAliveTimer = (CATResettableTimer *)v39;

    v41 = [CATIDSServiceConnectionMessageProcessor alloc];
    objc_msgSend(v54, "connectionIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[CATIDSServiceConnectionMessageProcessor initWithWorkQueue:connectionIdentifier:](v41, "initWithWorkQueue:connectionIdentifier:", v20, v42);
    mMessageProcessor = v24->mMessageProcessor;
    v24->mMessageProcessor = (CATIDSServiceConnectionMessageProcessor *)v43;

    -[CATIDSServiceConnectionDataMessageQueue setDelegate:](v24->mDataMessageQueue, "setDelegate:", v24);
    -[CATIDSServiceConnectionDataAggregator setDelegate:](v24->mDataAggregator, "setDelegate:", v24);
    -[CATIDSServiceConnectionMessageProcessor setDelegate:](v24->mMessageProcessor, "setDelegate:", v24);
    objc_destroyWeak(&v57);

    objc_destroyWeak(&location);
    v21 = v25;
  }

  return v24;
}

void __202__CATIDSServiceConnection_initWithMetadata_configuration_IDSPrimitives_messageBroadcaster_timerSource_dataMessageQueue_dataAggregator_assertion_workQueue_delegateQueue_destinationAddress_sourceAppleID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "keepAliveTimerDidFire:fireCount:isFinalFire:", v7, a3, a4);

}

+ (CATIDSServiceConnection)connectionWithMetadata:(id)a3 configuration:(id)a4 IDSPrimitives:(id)a5 messageBroadcaster:(id)a6 timerSource:(id)a7 dataMessageQueue:(id)a8 dataAggregator:(id)a9 assertion:(id)a10 workQueue:(id)a11 delegateQueue:(id)a12 destinationAddress:(id)a13 sourceAppleID:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  CATIDSServiceConnection *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;

  v32 = a14;
  v30 = a13;
  v24 = a12;
  v29 = a11;
  v28 = a10;
  v25 = a9;
  v27 = a8;
  v18 = a7;
  v19 = a6;
  v26 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[CATIDSServiceConnection initWithMetadata:configuration:IDSPrimitives:messageBroadcaster:timerSource:dataMessageQueue:dataAggregator:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:]([CATIDSServiceConnection alloc], "initWithMetadata:configuration:IDSPrimitives:messageBroadcaster:timerSource:dataMessageQueue:dataAggregator:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:", v21, v20, v26, v19, v18, v27, v25, v28, v29, v24, v30, v32);

  objc_msgSend(v19, "addBroadcastHandler:", v22);
  return v22;
}

+ (CATIDSServiceConnection)connectionWithMetadata:(id)a3 configuration:(id)a4 capabilities:(id)a5 IDSPrimitives:(id)a6 messageBroadcaster:(id)a7 timerSource:(id)a8 assertion:(id)a9 workQueue:(id)a10 delegateQueue:(id)a11 destinationAddress:(id)a12 sourceAppleID:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  CATConcreteIDSServiceConnectionDataMessageQueue *v24;
  void *v25;
  void *v26;
  double v27;
  CATConcreteIDSServiceConnectionDataMessageQueue *v28;
  CATConcreteIDSServiceConnectionDataAggregator *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v35;
  CATConcreteIDSServiceConnectionDataAggregator *v36;
  id v37;
  id v38;
  id v39;
  CATConcreteIDSServiceConnectionDataChunker *v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v45 = a13;
  v44 = a12;
  v18 = a11;
  v19 = a10;
  v43 = a9;
  v20 = a8;
  v42 = a7;
  v39 = a6;
  v21 = a5;
  v22 = a4;
  v38 = a3;
  v23 = v22;
  v41 = -[CATConcreteIDSServiceConnectionDataChunker initWithWorkQueue:maxDataLength:]([CATConcreteIDSServiceConnectionDataChunker alloc], "initWithWorkQueue:maxDataLength:", v19, objc_msgSend(v22, "maxDataSendSize"));
  v24 = [CATConcreteIDSServiceConnectionDataMessageQueue alloc];
  v25 = v23;
  objc_msgSend(v23, "messageQueueFlushPromptInterval");
  v26 = v19;
  v28 = -[CATConcreteIDSServiceConnectionDataMessageQueue initWithWorkQueue:timerSource:dataChunker:flushPromptInterval:supportsRetransmit:](v24, "initWithWorkQueue:timerSource:dataChunker:flushPromptInterval:supportsRetransmit:", v19, v20, v41, objc_msgSend(v21, "supportsReliableDelivery"), v27);
  v29 = [CATConcreteIDSServiceConnectionDataAggregator alloc];
  v30 = v25;
  v35 = v25;
  objc_msgSend(v25, "missingItemsCheckinInterval");
  v32 = v31;
  v33 = objc_msgSend(v21, "supportsReliableDelivery");

  v36 = -[CATConcreteIDSServiceConnectionDataAggregator initWithWorkQueue:timerSource:missingItemInterval:supportsSequenceCorrection:](v29, "initWithWorkQueue:timerSource:missingItemInterval:supportsSequenceCorrection:", v26, v20, v33, v32);
  +[CATIDSServiceConnection connectionWithMetadata:configuration:IDSPrimitives:messageBroadcaster:timerSource:dataMessageQueue:dataAggregator:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:](CATIDSServiceConnection, "connectionWithMetadata:configuration:IDSPrimitives:messageBroadcaster:timerSource:dataMessageQueue:dataAggregator:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:", v38, v30, v39, v42, v20, v28, v36, v43, v26, v18, v44, v45);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return (CATIDSServiceConnection *)v37;
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *mWorkQueue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  mWorkQueue = self->mWorkQueue;
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__CATIDSServiceConnection_sendData_completion___block_invoke;
  v14[3] = &unk_24C1C5DF8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_24C1C5998;
  v18 = v10;
  v11 = mWorkQueue;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __47__CATIDSServiceConnection_sendData_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)close
{
  uint64_t v2;
  OS_dispatch_queue *mWorkQueue;
  _QWORD *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  mWorkQueue = self->mWorkQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__CATIDSServiceConnection_close__block_invoke;
  v6[3] = &unk_24C1C5A60;
  v6[4] = self;
  v4 = v6;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_24C1C5998;
  v8 = v4;
  v5 = mWorkQueue;
  dispatch_async(v5, block);

}

uint64_t __32__CATIDSServiceConnection_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (void)_sendData:(id)a3 completion:(id)a4
{
  NSObject *mWorkQueue;
  id v7;
  id v8;

  mWorkQueue = self->mWorkQueue;
  v7 = a4;
  v8 = a3;
  CATAssertIsQueue(mWorkQueue);
  -[CATIDSServiceConnectionDataMessageQueue receiveData:completion:](self->mDataMessageQueue, "receiveData:completion:", v8, v7);

}

- (void)_close
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed"))
    -[CATIDSServiceConnection tearDownWithError:shouldReportToRemote:](self, "tearDownWithError:shouldReportToRemote:", 0, 1);
}

- (void)connectionDataAggregator:(id)a3 aggregatedData:(id)a4 withNumber:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  OS_dispatch_queue *mDelegateQueue;
  _QWORD *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _BYTE buf[24];
  void *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed"))
  {
    _CATLogGeneral_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a5;
      _os_log_impl(&dword_209592000, v8, OS_LOG_TYPE_INFO, "%{public}@ received data number %lu", buf, 0x16u);
    }

    v9 = MEMORY[0x24BDAC760];
    mDelegateQueue = self->mDelegateQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __78__CATIDSServiceConnection_connectionDataAggregator_aggregatedData_withNumber___block_invoke;
    v13[3] = &unk_24C1C5C00;
    v13[4] = self;
    v14 = v7;
    v11 = v13;
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __CATPerformBlock_block_invoke_7;
    v16 = &unk_24C1C5998;
    v17 = v11;
    v12 = mDelegateQueue;
    dispatch_async(v12, buf);

  }
}

void __78__CATIDSServiceConnection_connectionDataAggregator_aggregatedData_withNumber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:receivedData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionDataAggregator:(id)a3 isMissingSequenceNumbers:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  CATIDSServiceConnection *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed"))
  {
    _CATLogGeneral_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "%{public}@ missing sequence numbers. Requesting retransmission of %{public}@", (uint8_t *)&v8, 0x16u);
    }

    -[CATIDSServiceConnection retransmitContentForSequenceNumbers:](self, "retransmitContentForSequenceNumbers:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATIDSServiceConnection sendContent:](self, "sendContent:", v7);

  }
}

- (void)connectionDataAggregatorWantsToReportSequenceNumber:(id)a3
{
  id v4;

  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  objc_msgSend((id)objc_opt_class(), "acknowledgeContent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnection sendContent:](self, "sendContent:", v4);

}

- (void)messageProcessorWantsToAcknowledgeRemote:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  CATIDSServiceConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  _CATLogGeneral_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_209592000, v4, OS_LOG_TYPE_INFO, "%{public}@ sending acknowledge to remote", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "acknowledgeContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnection sendContent:](self, "sendContent:", v5);

}

- (void)messageProcessorWantsToExtendKeepAlive:(id)a3
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[CATResettableTimer reset](self->mKeepAliveTimer, "reset");
}

- (void)messageProcessor:(id)a3 wantsToCloseWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed"))
  {
    _CATLogGeneral_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CATIDSServiceConnection messageProcessor:wantsToCloseWithError:].cold.1((uint64_t)self, v5, v6);

    if (v5)
    {
      v9 = *MEMORY[0x24BDD1398];
      v10[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    CATErrorWithCodeAndUserInfo(603, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATIDSServiceConnection tearDownWithError:shouldReportToRemote:](self, "tearDownWithError:shouldReportToRemote:", v8, 0);

  }
}

- (void)messageProcessor:(id)a3 wantsAggregation:(id)a4
{
  NSObject *mWorkQueue;
  id v6;

  mWorkQueue = self->mWorkQueue;
  v6 = a4;
  CATAssertIsQueue(mWorkQueue);
  -[CATIDSServiceConnectionDataAggregator receiveDataContent:](self->mDataAggregator, "receiveDataContent:", v6);

}

- (void)messageProcessor:(id)a3 wantsRetransmission:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  CATIDSServiceConnection *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v6 = objc_msgSend(v5, "count");
  _CATLogGeneral_2();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v5;
      v9 = "%{public}@ attempting to retransmit %{public}@";
      v10 = v7;
      v11 = 22;
LABEL_6:
      _os_log_impl(&dword_209592000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v8)
  {
    v12 = 138543362;
    v13 = self;
    v9 = "%{public}@ attempting to retransmit the world";
    v10 = v7;
    v11 = 12;
    goto LABEL_6;
  }

  -[CATIDSServiceConnectionDataMessageQueue retransmitSequenceNumbers:](self->mDataMessageQueue, "retransmitSequenceNumbers:", v5);
}

- (void)messageProcessor:(id)a3 receivedExpectedSequence:(unint64_t)a4
{
  NSObject *v6;
  int v7;
  CATIDSServiceConnection *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  _CATLogGeneral_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "%{public}@ received request to compute missing sequence numbers with expected sequence number %lu", (uint8_t *)&v7, 0x16u);
  }

  -[CATIDSServiceConnectionDataAggregator receiveExpectedSequenceNumber:](self->mDataAggregator, "receiveExpectedSequenceNumber:", a4);
}

- (void)messageProcessor:(id)a3 wantsToAckUpTo:(unint64_t)a4
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[CATIDSServiceConnectionDataMessageQueue receiveRemoteSequenceNumber:](self->mDataMessageQueue, "receiveRemoteSequenceNumber:", a4);
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a5;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed")
    && objc_msgSend(v7, "isEqual:", self->mDestinationAddress))
  {
    +[CATIDSMessagePayload instanceWithDictionary:](CATIDSMessagePayload, "instanceWithDictionary:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "messageType");

      if (v11 == 102)
      {
        objc_msgSend(v9, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnection processMessage:senderAppleID:senderAddress:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("CATIDSServiceConnection.m"), 393, CFSTR("expected %@, got %@"), v16, v18);

        }
        -[CATIDSServiceConnectionMessageProcessor receiveMessage:](self->mMessageProcessor, "receiveMessage:", v12);

      }
    }

  }
}

- (void)dataMessageQueue:(id)a3 wantsToCheckRemote:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  int v8;
  CATIDSServiceConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  _CATLogGeneral_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "%{public}@ requesting remote computes missing data.", (uint8_t *)&v8, 0xCu);
  }

  -[CATIDSServiceConnection requestMissingDataContentWithExpectedSequenceNumber:](self, "requestMissingDataContentWithExpectedSequenceNumber:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnection sendContent:](self, "sendContent:", v7);

}

- (void)dataMessageQueue:(id)a3 needsToSendContents:(id)a4 shouldSkipTheLine:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CATSendSerialIDSMessagesOperation *v17;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *v19;
  void *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *v22;
  CATSendSerialIDSMessagesOperation *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  OS_dispatch_queue *v28;
  OS_dispatch_queue *v29;
  CATSendSerialIDSMessagesOperation *v30;
  void (**v31)(id, void *);
  id v32;
  id location;
  _QWORD v34[5];
  _QWORD v35[6];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (-[CATIDSServiceConnection isClosed](self, "isClosed"))
  {
    CATErrorWithCodeAndUserInfo(100, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v13);

  }
  else if (v7)
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke;
    v35[3] = &unk_24C1C5E20;
    v35[4] = self;
    objc_msgSend(v11, "cat_forEach:", v35);
    v12[2](v12, 0);
  }
  else
  {
    v14 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_2;
    v34[3] = &unk_24C1C5E48;
    v34[4] = self;
    objc_msgSend(v11, "cat_map:", v34);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setFireAndForget:", 1);
    v25 = v16;
    v26 = (void *)v15;
    v17 = -[CATSendSerialIDSMessagesOperation initWithIDSPrimitives:workQueue:messages:destinationAddress:sourceAppleID:options:]([CATSendSerialIDSMessagesOperation alloc], "initWithIDSPrimitives:workQueue:messages:destinationAddress:sourceAppleID:options:", self->mIDSPrimitives, self->mWorkQueue, v15, self->mDestinationAddress, self->mSourceAppleID, v16);
    objc_initWeak(&location, self);
    v18 = self->mWorkQueue;
    v19 = self->mDelegateQueue;
    v20 = (void *)MEMORY[0x24BDD1478];
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_3;
    v27[3] = &unk_24C1C5E70;
    v21 = v18;
    v28 = v21;
    v22 = v19;
    v29 = v22;
    v31 = v12;
    v23 = v17;
    v30 = v23;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v20, "blockOperationWithBlock:", v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addDependency:", v23);
    -[CATOperationQueue addOperation:](self->mSendQueue, "addOperation:", v23);
    -[CATSerialOperationEnqueuer addOperation:](self->mControlOperationEnqueuer, "addOperation:", v24);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

uint64_t __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendContent:", a2);
}

CATActiveServiceConnectionIDSMessage *__93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CATActiveServiceConnectionIDSMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  CATActiveServiceConnectionIDSMessage *v8;

  v3 = a2;
  v4 = [CATActiveServiceConnectionIDSMessage alloc];
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "receivedSequenceNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CATActiveServiceConnectionIDSMessage initWithConnectionIdentifier:receivedSequenceNumber:content:](v4, "initWithConnectionIdentifier:receivedSequenceNumber:content:", v6, v7, v3);

  return v8;
}

void __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD block[4];
  uint64_t *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  CATAssertIsQueue(*(dispatch_queue_t *)(a1 + 32));
  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 40);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_4;
  v15 = &unk_24C1C5970;
  v17 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 48);
  v4 = &v12;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_24C1C5998;
  v19 = v4;
  v5 = v3;
  dispatch_async(v5, block);

  objc_msgSend(*(id *)(a1 + 48), "error", v12, v13, v14, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v8 = WeakRetained;
    if (WeakRetained && (objc_msgSend(WeakRetained, "isClosed") & 1) == 0)
    {
      v20 = *MEMORY[0x24BDD1398];
      objc_msgSend(*(id *)(a1 + 48), "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(604, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "tearDownWithError:shouldReportToRemote:", v11, 0);
    }

  }
}

void __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)keepAliveTimerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-KeepAliveTimer"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)keepAliveTimerDidFire:(id)a3 fireCount:(unint64_t)a4 isFinalFire:(BOOL)a5
{
  _BOOL4 v5;
  char v6;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  CATIDSServiceConnection *v13;
  uint64_t v14;

  v5 = a5;
  v6 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (v5)
  {
    _CATLogGeneral_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CATIDSServiceConnection keepAliveTimerDidFire:fireCount:isFinalFire:].cold.1((uint64_t)self, v8, v9);

    CATErrorWithCodeAndUserInfo(600, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATIDSServiceConnection tearDownWithError:shouldReportToRemote:](self, "tearDownWithError:shouldReportToRemote:", v10, 1);
  }
  else
  {
    if ((v6 & 1) == 0)
      return;
    _CATLogGeneral_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_impl(&dword_209592000, v11, OS_LOG_TYPE_INFO, "%{public}@ sending keepalive to remote", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "keepAliveContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATIDSServiceConnection sendContent:](self, "sendContent:", v10);
  }

}

- (void)sendContent:(id)a3
{
  id v4;
  CATActiveServiceConnectionIDSMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  CATActiveServiceConnectionIDSMessage *v9;
  CATIDSMessagePayload *v10;
  void *v11;
  OS_dispatch_queue *v12;
  void *v13;
  CATIDSPrimitives *mIDSPrimitives;
  NSString *mSourceAppleID;
  NSString *mDestinationAddress;
  OS_dispatch_queue *v17;
  _QWORD v18[4];
  OS_dispatch_queue *v19;
  id v20;
  id v21;
  id location;

  v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v5 = [CATActiveServiceConnectionIDSMessage alloc];
  -[CATIDSServiceConnection metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATIDSServiceConnectionDataAggregator receivedSequenceNumber](self->mDataAggregator, "receivedSequenceNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CATActiveServiceConnectionIDSMessage initWithConnectionIdentifier:receivedSequenceNumber:content:](v5, "initWithConnectionIdentifier:receivedSequenceNumber:content:", v7, v8, v4);

  v10 = -[CATIDSMessagePayload initWithMessage:]([CATIDSMessagePayload alloc], "initWithMessage:", v9);
  -[CATIDSMessagePayload dictionaryValue](v10, "dictionaryValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed"))
  {
    objc_initWeak(&location, self);
    v12 = self->mWorkQueue;
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setFireAndForget:", 1);
    mSourceAppleID = self->mSourceAppleID;
    mIDSPrimitives = self->mIDSPrimitives;
    mDestinationAddress = self->mDestinationAddress;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __39__CATIDSServiceConnection_sendContent___block_invoke;
    v18[3] = &unk_24C1C5EC0;
    v17 = v12;
    v19 = v17;
    objc_copyWeak(&v21, &location);
    v20 = v11;
    -[CATIDSPrimitives sendMessage:toAddress:fromID:options:completion:](mIDSPrimitives, "sendMessage:toAddress:fromID:options:completion:", v20, mDestinationAddress, mSourceAppleID, v13, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __39__CATIDSServiceConnection_sendContent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__CATIDSServiceConnection_sendContent___block_invoke_2;
  v9[3] = &unk_24C1C5E98;
  v10 = v3;
  v6 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v11 = *(id *)(a1 + 40);
  v7 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_24C1C5998;
  v14 = v7;
  v8 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
}

void __39__CATIDSServiceConnection_sendContent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      _CATLogGeneral_2();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "verboseDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v12 = WeakRetained;
        v13 = 2114;
        v14 = v7;
        v15 = 2114;
        v16 = v8;
        _os_log_error_impl(&dword_209592000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send IDS message %{public}@ from. Error: %{public}@", buf, 0x20u);

      }
      if ((objc_msgSend(WeakRetained, "isClosed") & 1) == 0)
      {
        v4 = *(_QWORD *)(a1 + 32);
        v9 = *MEMORY[0x24BDD1398];
        v10 = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CATErrorWithCodeAndUserInfo(604, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "tearDownWithError:shouldReportToRemote:", v6, 0);
      }
    }

  }
}

- (void)tearDownWithError:(id)a3 shouldReportToRemote:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *mDelegateQueue;
  _QWORD *v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;

  v4 = a4;
  v6 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!-[CATIDSServiceConnection isClosed](self, "isClosed"))
  {
    -[CATOperationQueue cancelAllOperations](self->mSendQueue, "cancelAllOperations");
    -[CATIDSSubscription cancel](self->mMessageSubscription, "cancel");
    -[CATResettableTimer invalidate](self->mKeepAliveTimer, "invalidate");
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "closeContentWithError:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATIDSServiceConnection sendContent:](self, "sendContent:", v7);

    }
    -[CATCancelable cancel](self->mAssertion, "cancel");
    -[CATIDSServiceConnection setClosed:](self, "setClosed:", 1);
    -[CATIDSServiceConnection setClosedError:](self, "setClosedError:", v6);
    v8 = MEMORY[0x24BDAC760];
    mDelegateQueue = self->mDelegateQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__CATIDSServiceConnection_tearDownWithError_shouldReportToRemote___block_invoke;
    v12[3] = &unk_24C1C5A60;
    v12[4] = self;
    v10 = v12;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_7;
    block[3] = &unk_24C1C5998;
    v14 = v10;
    v11 = mDelegateQueue;
    dispatch_async(v11, block);

  }
}

void __66__CATIDSServiceConnection_tearDownWithError_shouldReportToRemote___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionClosed:", *(_QWORD *)(a1 + 32));

}

+ (id)closeContentWithError:(id)a3
{
  id v3;
  CATActiveIDSServiceConnectionContentClose *v4;

  v3 = a3;
  v4 = -[CATActiveIDSServiceConnectionContentClose initWithError:]([CATActiveIDSServiceConnectionContentClose alloc], "initWithError:", v3);

  return v4;
}

+ (id)acknowledgeContent
{
  return (id)objc_opt_new();
}

+ (id)keepAliveContent
{
  return (id)objc_opt_new();
}

- (id)retransmitContentForSequenceNumbers:(id)a3
{
  id v3;
  CATActiveIDSServiceConnectionContentRetransmit *v4;

  v3 = a3;
  v4 = -[CATActiveIDSServiceConnectionContentRetransmit initWithSequenceNumbers:]([CATActiveIDSServiceConnectionContentRetransmit alloc], "initWithSequenceNumbers:", v3);

  return v4;
}

- (id)requestMissingDataContentWithExpectedSequenceNumber:(unint64_t)a3
{
  return -[CATActiveIDSServiceConnectionContentRequestMissingData initWithExpectedSequenceNumber:]([CATActiveIDSServiceConnectionContentRequestMissingData alloc], "initWithExpectedSequenceNumber:", a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *mDestinationAddress;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATIDSServiceConnection metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  mDestinationAddress = self->mDestinationAddress;
  if (-[CATIDSServiceConnection isClosed](self, "isClosed"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[CATIDSServiceConnection closedError](self, "closedError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { metadata = %@, destinationAddress = %@, isClosed = %@, closedError = %@ }>"), v4, self, v5, mDestinationAddress, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CATIDSServiceConnectionDelegate)delegate
{
  return (CATIDSServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CATIDSServiceConnectionMetadata)metadata
{
  return self->_metadata;
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
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mMessageSubscription, 0);
  objc_storeStrong((id *)&self->mMessageProcessor, 0);
  objc_storeStrong((id *)&self->mKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->mControlOperationEnqueuer, 0);
  objc_storeStrong((id *)&self->mSendQueue, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mDataAggregator, 0);
  objc_storeStrong((id *)&self->mDataMessageQueue, 0);
  objc_storeStrong((id *)&self->mMessageBroadcaster, 0);
  objc_storeStrong((id *)&self->mAssertion, 0);
  objc_storeStrong((id *)&self->mIDSPrimitives, 0);
  objc_storeStrong((id *)&self->mSourceAppleID, 0);
  objc_storeStrong((id *)&self->mDestinationAddress, 0);
}

- (void)messageProcessor:(NSObject *)a3 wantsToCloseWithError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_0(&dword_209592000, a3, v6, "%{public}@ closed by the remote. Error: %{public}@", (uint8_t *)&v7);

}

- (void)keepAliveTimerDidFire:(uint64_t)a1 fireCount:(NSObject *)a2 isFinalFire:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_0_0(&dword_209592000, a2, a3, "%{public}@ timed out waiting to hear anything from the remote. Aggregator: %{public}@", (uint8_t *)&v4);
}

@end
