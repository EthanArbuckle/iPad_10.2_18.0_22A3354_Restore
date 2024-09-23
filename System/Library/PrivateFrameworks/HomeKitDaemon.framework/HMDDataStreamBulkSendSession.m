@implementation HMDDataStreamBulkSendSession

- (HMDDataStreamBulkSendSession)initWithProtocol:(id)a3 sessionIdentifier:(id)a4 queue:(id)a5 logIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDDataStreamBulkSendSession *v14;
  HMDDataStreamBulkSendSession *v15;
  uint64_t v16;
  NSMutableArray *pendingReads;
  uint64_t v18;
  NSString *logIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDDataStreamBulkSendSession;
  v14 = -[HMDDataStreamBulkSendSession init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    *(_WORD *)&v14->_isClosed = 0;
    objc_storeWeak((id *)&v14->_bulkSendProtocol, v10);
    objc_storeStrong((id *)&v15->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingReads = v15->_pendingReads;
    v15->_pendingReads = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v13, v11);
    v18 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v18;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!self->_isClosed)
  {
    -[HMDDataStreamBulkSendSession bulkSendProtocol](self, "bulkSendProtocol");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[HMDDataStreamBulkSendSession sessionIdentifier](self, "sessionIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "asyncBulkSendSessionDidCancelSessionWithIdentifier:reason:hadReceivedEof:", v4, 5, self->_hasReceivedEof);

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)HMDDataStreamBulkSendSession;
  -[HMDDataStreamBulkSendSession dealloc](&v5, sel_dealloc);
}

- (BOOL)isActive
{
  void *v4;
  void *v5;

  if (self->_isClosed)
    return 0;
  -[HMDDataStreamBulkSendSession pendingReads](self, "pendingReads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

    return 1;
  }
  -[HMDDataStreamBulkSendSession pendingError](self, "pendingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  return !self->_hasReceivedEof;
}

- (void)cancelWithReason:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = a3;
  -[HMDDataStreamBulkSendSession _closeSession](self, "_closeSession");
  -[HMDDataStreamBulkSendSession bulkSendProtocol](self, "bulkSendProtocol");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDDataStreamBulkSendSession sessionIdentifier](self, "sessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asyncBulkSendSessionDidCancelSessionWithIdentifier:reason:hadReceivedEof:", v5, v3, self->_hasReceivedEof);

  }
}

- (void)read:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[HMDDataStreamBulkSendSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_isClosed)
  {
    -[HMDDataStreamBulkSendSession queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__HMDDataStreamBulkSendSession_read___block_invoke;
    block[3] = &unk_24E799CC8;
    v9 = v4;
    dispatch_async(v6, block);

  }
  else
  {
    -[HMDDataStreamBulkSendSession activeReadHandler](self, "activeReadHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HMDDataStreamBulkSendSession cancelWithReason:](self, "cancelWithReason:", 5);
    }
    else
    {
      -[HMDDataStreamBulkSendSession setActiveReadHandler:](self, "setActiveReadHandler:", v4);
      -[HMDDataStreamBulkSendSession _pumpReadDataIfPossible](self, "_pumpReadDataIfPossible");
    }
  }

}

- (void)asyncHandleIncomingPackets:(id)a3 isEof:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[HMDDataStreamBulkSendSession queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDDataStreamBulkSendSession_asyncHandleIncomingPackets_isEof___block_invoke;
  block[3] = &unk_24E799CF0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)asyncHandleRemoteCloseWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDDataStreamBulkSendSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDDataStreamBulkSendSession_asyncHandleRemoteCloseWithError___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_closeSession
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  if (!self->_isClosed)
  {
    self->_isClosed = 1;
    -[HMDDataStreamBulkSendSession activeReadHandler](self, "activeReadHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamBulkSendSession setActiveReadHandler:](self, "setActiveReadHandler:", 0);
    if (v3)
    {
      -[HMDDataStreamBulkSendSession queue](self, "queue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__HMDDataStreamBulkSendSession__closeSession__block_invoke;
      block[3] = &unk_24E799CC8;
      v6 = v3;
      dispatch_async(v4, block);

    }
  }
}

- (void)_pumpReadDataIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  -[HMDDataStreamBulkSendSession activeReadHandler](self, "activeReadHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDDataStreamBulkSendSession pendingReads](self, "pendingReads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmf_maybeDequeue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[HMDDataStreamBulkSendSession pendingError](self, "pendingError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamBulkSendSession setPendingError:](self, "setPendingError:", 0);
      if (v6)
        goto LABEL_5;
      if (!self->_hasReceivedEof)
        goto LABEL_6;
    }
    v6 = 0;
LABEL_5:
    -[HMDDataStreamBulkSendSession activeReadHandler](self, "activeReadHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamBulkSendSession setActiveReadHandler:](self, "setActiveReadHandler:", 0);
    -[HMDDataStreamBulkSendSession queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__HMDDataStreamBulkSendSession__pumpReadDataIfPossible__block_invoke;
    block[3] = &unk_24E79B440;
    v14 = v7;
    v12 = v5;
    v13 = v6;
    v9 = v6;
    v10 = v7;
    dispatch_async(v8, block);

LABEL_6:
  }
}

- (HMDDataStreamBulkSendProtocol)bulkSendProtocol
{
  return (HMDDataStreamBulkSendProtocol *)objc_loadWeakRetained((id *)&self->_bulkSendProtocol);
}

- (NSNumber)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)activeReadHandler
{
  return self->_activeReadHandler;
}

- (void)setActiveReadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)pendingReads
{
  return self->_pendingReads;
}

- (void)setPendingReads:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReads, a3);
}

- (NSError)pendingError
{
  return self->_pendingError;
}

- (void)setPendingError:(id)a3
{
  objc_storeStrong((id *)&self->_pendingError, a3);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong(&self->_activeReadHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_bulkSendProtocol);
}

uint64_t __55__HMDDataStreamBulkSendSession__pumpReadDataIfPossible__block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __45__HMDDataStreamBulkSendSession__closeSession__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__HMDDataStreamBulkSendSession_asyncHandleRemoteCloseWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received remote close with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setPendingError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_pumpReadDataIfPossible");
}

uint64_t __65__HMDDataStreamBulkSendSession_asyncHandleIncomingPackets_isEof___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received EOF from accessory.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingReads");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_enqueueMultiple:", *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_pumpReadDataIfPossible");
}

uint64_t __37__HMDDataStreamBulkSendSession_read___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
