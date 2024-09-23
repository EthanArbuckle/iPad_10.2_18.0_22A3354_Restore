@implementation HMDDataStream

- (HMDDataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HMDDataStream *v17;

  v10 = (objc_class *)MEMORY[0x1E0D286C8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v10 alloc], "initWithTimeInterval:options:", 0, 10.0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 10.0);
  v17 = -[HMDDataStream initWithTransport:sessionEncryption:workQueue:logIdentifier:connectionTimer:helloMessageResponseTimer:](self, "initWithTransport:sessionEncryption:workQueue:logIdentifier:connectionTimer:helloMessageResponseTimer:", v14, v13, v12, v11, v15, v16);

  return v17;
}

- (HMDDataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6 connectionTimer:(id)a7 helloMessageResponseTimer:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDDataStream *v19;
  HMDDataStream *v20;
  uint64_t v21;
  NSString *logIdentifier;
  uint64_t v23;
  NSMapTable *protocols;
  HMDDataStreamControlProtocol *v25;
  HMDDataStreamControlProtocol *controlProtocol;
  NSMutableSet *v27;
  NSMutableSet *pendingRequests;
  NSMutableArray *v29;
  NSMutableArray *pendingEvents;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HMDDataStream;
  v19 = -[HMDDataStream init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_transport, a3);
    objc_storeStrong((id *)&v20->_sessionEncryption, a4);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    v21 = objc_msgSend(v16, "copy", v32, v33);
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_connectionTimer, a7);
    objc_storeStrong((id *)&v20->_helloMessageResponseTimer, a8);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    protocols = v20->_protocols;
    v20->_protocols = (NSMapTable *)v23;

    v25 = -[HMDDataStreamControlProtocol initWithLogIdentifier:]([HMDDataStreamControlProtocol alloc], "initWithLogIdentifier:", v16);
    controlProtocol = v20->_controlProtocol;
    v20->_controlProtocol = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingRequests = v20->_pendingRequests;
    v20->_pendingRequests = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingEvents = v20->_pendingEvents;
    v20->_pendingEvents = v29;

  }
  return v20;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  HMDDataStream *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[HMDDataStream workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_active != v3)
  {
    self->_active = v3;
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@DataStream changes active to %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDDataStream delegate](v7, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataStreamDidUpdateActiveStatus:", v7);

  }
}

- (void)connect
{
  void *v3;
  HMDDataStream *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream connecting", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (v4)
  {
    -[HMDDataStream connectionTimer](v4, "connectionTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v4);

    -[HMDDataStream workQueue](v4, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStream connectionTimer](v4, "connectionTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegateQueue:", v8);

    -[HMDDataStream connectionTimer](v4, "connectionTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
  -[HMDDataStream transport](v4, "transport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connect");

}

- (void)close
{
  void *v3;
  HMDDataStream *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream closing", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDDataStream transport](v4, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "close");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDDataStream protocols](v4, "protocols", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "dataStreamInitiatedClose:", v4);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)addProtocol:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[HMDDataStream protocols](self, "protocols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  -[HMDDataStream _evaluateActiveStatusChange](self);
}

- (id)protocolWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDDataStream workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDataStream protocols](self, "protocols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)sendEventForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  HMDDataStreamPendingEvent *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[HMDDataStream firstMessageReceived](self, "firstMessageReceived"))
  {
    -[HMDDataStream controlProtocol](self, "controlProtocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "helloMessageResponseReceived");

    if ((v14 & 1) != 0)
    {
      +[HMDDataStreamMessageCoder eventHeaderForProtocol:topic:](HMDDataStreamMessageCoder, "eventHeaderForProtocol:topic:", v17, v10);
      v15 = (HMDDataStreamPendingEvent *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v15, v11, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1062);
      v15 = (HMDDataStreamPendingEvent *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, HMDDataStreamPendingEvent *))v12 + 2))(v12, v15);
    }
  }
  else
  {
    v15 = -[HMDDataStreamPendingEvent initWithProtocol:topic:payload:completion:]([HMDDataStreamPendingEvent alloc], "initWithProtocol:topic:payload:completion:", v17, v10, v11, v12);
    -[HMDDataStream pendingEvents](self, "pendingEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

  }
}

- (void)sendResponseForRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5 completion:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  +[HMDDataStreamMessageCoder responseHeaderForRequestHeader:status:](HMDDataStreamMessageCoder, "responseHeaderForRequestHeader:status:", a3, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v12, v11, v10);

}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 identifier:(unint64_t)a5 payload:(id)a6 completion:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "numberWithUnsignedInteger:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDataStreamMessageCoder requestHeaderForProtocol:topic:identifier:](HMDDataStreamMessageCoder, "requestHeaderForProtocol:topic:identifier:", v16, v15, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v18, v14, v13);
}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;
  HMDDataStreamPendingRequest *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  HMDDataStream *v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self)
  {
    v14 = -[HMDDataStream nextRequestIdentifier](self, "nextRequestIdentifier");
    -[HMDDataStream setNextRequestIdentifier:](self, "setNextRequestIdentifier:", -[HMDDataStream nextRequestIdentifier](self, "nextRequestIdentifier") + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if (-[HMDDataStream firstMessageReceived](self, "firstMessageReceived"))
  {
    -[HMDDataStream controlProtocol](self, "controlProtocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "helloMessageResponseReceived");

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1062);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD))v13 + 2))(v13, v20, 0, 0);

      goto LABEL_9;
    }
    +[HMDDataStreamMessageCoder requestHeaderForProtocol:topic:identifier:](HMDDataStreamMessageCoder, "requestHeaderForProtocol:topic:identifier:", v10, v11, v15);
    v18 = (HMDDataStreamPendingRequest *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__HMDDataStream_sendRequestForProtocol_topic_payload_completion___block_invoke;
    v21[3] = &unk_1E89A90D0;
    v27 = v13;
    v22 = v15;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v26 = self;
    -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v18, v25, v21);

  }
  else
  {
    v18 = -[HMDDataStreamPendingRequest initWithIdentifier:protocol:topic:payload:callback:]([HMDDataStreamPendingRequest alloc], "initWithIdentifier:protocol:topic:payload:callback:", v15, v10, v11, v12, v13);
    -[HMDDataStream pendingRequests](self, "pendingRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v18);

  }
LABEL_9:

}

- (void)setTrafficClass:(unint64_t)a3
{
  void *v5;
  HMDDataStream *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting traffic class %lu on transport", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStream transport](v6, "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrafficClass:", a3);

}

- (void)transport:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDDataStream *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDDataStream delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Data stream failure (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "dataStream:didFailWithError:", v10, v7);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v14;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Data stream failure (%@); but no delegate",
        buf,
        0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDDataStream protocols](v10, "protocols", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20);
        if (v21)
          objc_msgSend(v21, "dataStream:didFailWithError:", v10, v7);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

  -[HMDDataStream _failPendingMessagesWithError:](v10, v7);
}

- (void)transportDidClose:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDDataStream *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream closed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "dataStreamDidClose:", v7);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream closed (but no delegate!)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDDataStream protocols](v7, "protocols", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "dataStreamDidClose:", v7);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1061);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStream _failPendingMessagesWithError:](v7, v18);

}

- (void)transportDidOpen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDDataStream *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStream setConnectionTimer:](self, "setConnectionTimer:", 0);
  -[HMDDataStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN!", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "dataStreamDidOpen:", v7);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN (but no delegate!)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  -[HMDDataStream controlProtocol](v7, "controlProtocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataStreamDidOpen:", v7);

  if (v7)
  {
    -[HMDDataStream helloMessageResponseTimer](v7, "helloMessageResponseTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v7);

    -[HMDDataStream workQueue](v7, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStream helloMessageResponseTimer](v7, "helloMessageResponseTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegateQueue:", v14);

    -[HMDDataStream helloMessageResponseTimer](v7, "helloMessageResponseTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resume");

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMDDataStream protocols](v7, "protocols", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v22);
        if (v23)
          objc_msgSend(v23, "dataStreamDidOpen:", v7);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

}

- (void)transport:(id)a3 didReceiveRawFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDDataStream *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  HMDDataStream *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  HMDDataStream *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v31;
  id v32;
  __CFString *v33;
  void *v34;
  HMDDataStream *v35;
  HMDDataStream *v36;
  void *v37;
  HMDDataStream *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  char v54;
  HMDDataStream *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  id v63;
  void *v64;
  NSObject *v65;
  void *v66;
  HMDDataStream *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HMDDataStream *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  HMDDataStream *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  HMDDataStream *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  HMDDataStream *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  HMDDataStream *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *context;
  HMDDataStream *contexta;
  void *contextb;
  id v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint8_t buf[4];
  void *v150;
  __int16 v151;
  const __CFString *v152;
  __int16 v153;
  id v154;
  uint8_t v155[4];
  void *v156;
  __int16 v157;
  void *v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDDataStream delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v150 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Data stream received frame", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "dataStreamDidReceiveRawFrame:", v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v150 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Data stream received frame; but no delegate",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  if (objc_msgSend(v7, "length"))
  {
    v15 = objc_retainAutorelease(v7);
    v16 = *(unsigned __int8 *)objc_msgSend(v15, "bytes");
    switch(v16)
    {
      case 0:
      case 2:
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = v10;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v150 = v20;
        v151 = 1024;
        LODWORD(v152) = v16;
        v21 = "%{public}@Data stream failed due to unrecognized frame type 0x%02x";
        v22 = v19;
        v23 = 18;
        goto LABEL_25;
      case 1:
        -[HMDDataStream sessionEncryption](v10, "sessionEncryption");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[HMDDataStream sessionEncryption](v10, "sessionEncryption");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = 0;
          v144 = 0;
          v142 = 0;
          v30 = +[HMDDataStreamMessageCoder decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:](HMDDataStreamMessageCoder, "decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:", v15, v29, &v144, &v143, &v142);
          v31 = v144;
          v32 = v143;
          v33 = (__CFString *)v142;

          if (!v33)
            goto LABEL_33;
          goto LABEL_27;
        }
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v36 = v10;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v150 = v20;
        v21 = "%{public}@Data stream failed due to receiving unencrypted frame";
        goto LABEL_24;
      case 3:
        -[HMDDataStream sessionEncryption](v10, "sessionEncryption");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v35 = v10;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v150 = v20;
            v21 = "%{public}@Data stream failed due to receiving encrypted frame";
LABEL_24:
            v22 = v19;
            v23 = 12;
LABEL_25:
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);

          }
LABEL_26:

          objc_autoreleasePoolPop(v17);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          v32 = 0;
          goto LABEL_27;
        }
        v140 = 0;
        v141 = 0;
        v139 = 0;
        v30 = +[HMDDataStreamMessageCoder unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:](HMDDataStreamMessageCoder, "unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:", v15, &v141, &v140, &v139);
        v31 = v141;
        v32 = v140;
        v33 = (__CFString *)v139;
        if (v33)
          goto LABEL_27;
LABEL_33:
        if (!v30)
        {
LABEL_27:
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          v38 = v10;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = v6;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v150 = v41;
            v151 = 2112;
            v152 = v33;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (%@)", buf, 0x16u);

            v6 = v40;
          }

          objc_autoreleasePoolPop(v37);
LABEL_30:

          goto LABEL_31;
        }
        if (-[HMDDataStream firstMessageReceived](v10, "firstMessageReceived"))
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("response"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v43 = v42;
          else
            v43 = 0;
          v44 = v31;
          v45 = v43;

          if (v45)
          {
            -[HMDDataStream fulfillPendingRequestWithResponseHeader:payload:](v10, v44, v32);
            v31 = v44;
LABEL_121:

            goto LABEL_30;
          }
          v137 = v44;
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("protocol"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v60 = v59;
          else
            v60 = 0;
          v61 = v60;

          if (!v61)
          {
            v108 = (void *)MEMORY[0x1D17BA0A0]();
            v109 = v10;
            HMFGetOSLogHandle();
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v150 = v111;
              _os_log_impl(&dword_1CD062000, v110, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (header missing protocol)", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v108);
            v42 = 0;
            v31 = v137;
            goto LABEL_120;
          }
          if (-[__CFString isEqual:](v61, "isEqual:", CFSTR("control")))
          {
            v31 = v137;
            objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("event"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v62 = v42;
            else
              v62 = 0;
            v63 = v62;

            if (v63)
            {
              -[HMDDataStream controlProtocol](v10, "controlProtocol");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "dataStream:didReceiveEvent:header:payload:", v10, v63, v137, v32);
LABEL_106:

              v31 = v137;
LABEL_120:

              goto LABEL_121;
            }
            objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("request"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v116 = v42;
            else
              v116 = 0;
            v117 = v116;

            if (v117)
            {
              -[HMDDataStream controlProtocol](v10, "controlProtocol");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "dataStream:didReceiveRequest:header:payload:", v10, v117, v137, v32);
              goto LABEL_106;
            }
LABEL_117:
            v124 = (void *)MEMORY[0x1D17BA0A0]();
            v125 = v10;
            HMFGetOSLogHandle();
            v126 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v150 = v127;
              _os_log_impl(&dword_1CD062000, v126, OS_LOG_TYPE_INFO, "%{public}@Message received but no protocol accepted it; dropped!",
                buf,
                0xCu);

              v31 = v137;
            }

            objc_autoreleasePoolPop(v124);
            v42 = 0;
            goto LABEL_120;
          }
          v135 = v6;
          -[HMDDataStream protocols](v10, "protocols");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "objectForKey:", v61);
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          if (v113)
          {
            v31 = v137;
            objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("event"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v114 = v42;
            else
              v114 = 0;
            v115 = v114;

            if (v115)
            {
              objc_msgSend(v113, "dataStream:didReceiveEvent:header:payload:", v10, v115, v137, v32);
            }
            else
            {
              objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("request"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v122 = v42;
              else
                v122 = 0;
              v123 = v122;

              if (!v123)
              {

                v6 = v135;
                goto LABEL_117;
              }
              objc_msgSend(v113, "dataStream:didReceiveRequest:header:payload:", v10, v123, v137, v32);
            }
          }
          else
          {
            v118 = (void *)MEMORY[0x1D17BA0A0]();
            v119 = v10;
            HMFGetOSLogHandle();
            v120 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v150 = v121;
              v151 = 2112;
              v152 = v61;
              _os_log_impl(&dword_1CD062000, v120, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (no protocol named %@)", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v118);
            v42 = 0;
            v31 = v137;
          }

          v6 = v135;
          goto LABEL_120;
        }
        v31 = v31;
        v32 = v32;
        v134 = v6;
        if (!v10)
          goto LABEL_68;
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("protocol"));
        v46 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v47 = v46;
        else
          v47 = 0;
        v48 = v47;

        v136 = v48;
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("control")) & 1) != 0)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("response"));
          v49 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v50 = v49;
          else
            v50 = 0;
          v51 = v50;

          if (v51)
          {
            -[HMDDataStream controlProtocol](v10, "controlProtocol");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "dataStream:didReceiveResponse:header:payload:", v10, v49, v31, v32);

            -[HMDDataStream controlProtocol](v10, "controlProtocol");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "helloMessageResponseReceived");

            if ((v54 & 1) != 0)
            {
LABEL_72:
              -[HMDDataStream setFirstMessageReceived:](v10, "setFirstMessageReceived:", 1);
              -[HMDDataStream helloMessageResponseTimer](v10, "helloMessageResponseTimer");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "suspend");

              -[HMDDataStream setHelloMessageResponseTimer:](v10, "setHelloMessageResponseTimer:", 0);
              if (v10)
              {
                -[HMDDataStream pendingRequests](v10, "pendingRequests");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = (void *)objc_msgSend(v71, "copy");

                v73 = (void *)MEMORY[0x1D17BA0A0]();
                v74 = v10;
                HMFGetOSLogHandle();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v76 = v72;
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v76, "count"));
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v155 = 138543618;
                  v156 = v77;
                  v157 = 2112;
                  v158 = v78;
                  _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending requests [%@]", v155, 0x16u);

                  v72 = v76;
                }
                v138 = v31;
                contextb = v7;

                objc_autoreleasePoolPop(v73);
                -[HMDDataStream pendingRequests](v74, "pendingRequests");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "removeAllObjects");

                v147 = 0u;
                v148 = 0u;
                v145 = 0u;
                v146 = 0u;
                v80 = v72;
                v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                v130 = v32;
                if (v81)
                {
                  v82 = v81;
                  v83 = *(_QWORD *)v146;
                  do
                  {
                    for (i = 0; i != v82; ++i)
                    {
                      if (*(_QWORD *)v146 != v83)
                        objc_enumerationMutation(v80);
                      v85 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
                      objc_msgSend(v85, "protocol");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "topic");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "payload");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "callback");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDDataStream sendRequestForProtocol:topic:payload:completion:](v74, "sendRequestForProtocol:topic:payload:completion:", v86, v87, v88, v89);

                    }
                    v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                  }
                  while (v82);
                }

                -[HMDDataStream pendingEvents](v74, "pendingEvents");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = (void *)objc_msgSend(v90, "copy");

                v92 = (void *)MEMORY[0x1D17BA0A0]();
                v93 = v74;
                HMFGetOSLogHandle();
                v94 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v91, "count"));
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v155 = 138543618;
                  v156 = v95;
                  v157 = 2112;
                  v158 = v96;
                  _os_log_impl(&dword_1CD062000, v94, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending events [%@]", v155, 0x16u);

                }
                objc_autoreleasePoolPop(v92);
                -[HMDDataStream pendingEvents](v93, "pendingEvents");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "removeAllObjects");

                v147 = 0u;
                v148 = 0u;
                v145 = 0u;
                v146 = 0u;
                v98 = v91;
                v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                if (v99)
                {
                  v100 = v99;
                  v101 = *(_QWORD *)v146;
                  do
                  {
                    for (j = 0; j != v100; ++j)
                    {
                      if (*(_QWORD *)v146 != v101)
                        objc_enumerationMutation(v98);
                      v103 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
                      objc_msgSend(v103, "protocol");
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v103, "topic");
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v103, "payload");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v103, "completion");
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDDataStream sendEventForProtocol:topic:payload:completion:](v93, "sendEventForProtocol:topic:payload:completion:", v104, v105, v106, v107);

                    }
                    v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                  }
                  while (v100);
                }

                v7 = contextb;
                v6 = v134;
                v31 = v138;
                v32 = v130;
              }
              else
              {
                v6 = v134;
              }
              goto LABEL_30;
            }
LABEL_69:
            v66 = (void *)MEMORY[0x1D17BA0A0]();
            v67 = v10;
            HMFGetOSLogHandle();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v150 = v69;
              _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected first message on the data stream", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v66);
            -[HMDDataStream close](v67, "close");
            goto LABEL_72;
          }
          v129 = (void *)MEMORY[0x1D17BA0A0]();
          contexta = v10;
          HMFGetOSLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          v58 = v136;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v150 = v128;
            v151 = 2112;
            v152 = CFSTR("response");
            v153 = 2112;
            v154 = v49;
            _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected %@ key value: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v129);

        }
        else
        {
          context = (void *)MEMORY[0x1D17BA0A0]();
          v55 = v10;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v150 = v57;
            v151 = 2112;
            v152 = CFSTR("control");
            v153 = 2112;
            v154 = v46;
            _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@Expected protocol name: %@ received: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
          v58 = v136;
        }

LABEL_68:
        goto LABEL_69;
      default:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        goto LABEL_27;
    }
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = v10;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v150 = v27;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@DataStream dropping truncated frame of zero-length", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
LABEL_31:

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  HMDDataStream *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  HMDDataStream *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStream workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDataStream connectionTimer](self, "connectionTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      v12 = "%{public}@Data stream failed to connect in time; closing!";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v8);
    -[HMDDataStream close](self, "close");
    goto LABEL_9;
  }
  -[HMDDataStream helloMessageResponseTimer](self, "helloMessageResponseTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      v12 = "%{public}@Data stream failed to receive first message in time; closing!";
LABEL_7:
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (HMDDataStreamDelegate)delegate
{
  return (HMDDataStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMDDataStreamTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (HAPSecuritySessionEncryption)sessionEncryption
{
  return self->_sessionEncryption;
}

- (void)setSessionEncryption:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEncryption, a3);
}

- (NSMapTable)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_protocols, a3);
}

- (HMDDataStreamControlProtocol)controlProtocol
{
  return self->_controlProtocol;
}

- (void)setControlProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_controlProtocol, a3);
}

- (BOOL)firstMessageReceived
{
  return self->_firstMessageReceived;
}

- (void)setFirstMessageReceived:(BOOL)a3
{
  self->_firstMessageReceived = a3;
}

- (HMFTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimer, a3);
}

- (HMFTimer)helloMessageResponseTimer
{
  return self->_helloMessageResponseTimer;
}

- (void)setHelloMessageResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_helloMessageResponseTimer, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)nextRequestIdentifier
{
  return self->_nextRequestIdentifier;
}

- (void)setNextRequestIdentifier:(unint64_t)a3
{
  self->_nextRequestIdentifier = a3;
}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (NSMutableArray)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_helloMessageResponseTimer, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_controlProtocol, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_sessionEncryption, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)fulfillPendingRequestWithResponseHeader:(void *)a3 payload:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  char v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_19;
  v30 = a1;
  v31 = v6;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v37;
  v32 = *(_QWORD *)v37;
  v33 = v8;
  do
  {
    v12 = 0;
    v35 = v10;
    do
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
      v14 = v5;
      if (v13)
      {
        objc_msgSend(v13, "topic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("response"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqual:", v16))
          goto LABEL_13;
        objc_msgSend(v13, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("id"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqual:", v18))
        {

          v10 = v35;
LABEL_13:

          goto LABEL_14;
        }
        objc_msgSend(v13, "protocol");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("protocol"));
        v20 = v5;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v19, "isEqual:", v21);

        v5 = v20;
        v11 = v32;

        v8 = v33;
        v10 = v35;
        if ((v34 & 1) != 0)
        {

          v27 = v13;
          objc_msgSend(v27, "callback");
          v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v7 = v31;
          ((void (**)(_QWORD, _QWORD, id, id))v28)[2](v28, 0, v14, v31);

          objc_msgSend(v30, "pendingRequests");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObject:", v27);

          goto LABEL_19;
        }
      }
LABEL_14:

      ++v12;
    }
    while (v10 != v12);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  }
  while (v10);
LABEL_16:

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v30;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pendingRequests");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v25;
    v42 = 2112;
    v43 = v5;
    v44 = 2112;
    v45 = v26;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@No pending request found for response with header: %@. Pending %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v22);
  v7 = v31;
LABEL_19:

}

- (void)_failPendingMessagesWithError:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "pendingRequests");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8), "callback");
          v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, _QWORD, _QWORD))v9)[2](v9, v3, 0, 0);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    objc_msgSend(a1, "pendingRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1, "pendingEvents", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "completion");
          v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v16)[2](v16, v3);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(a1, "pendingEvents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

  }
}

- (void)_evaluateActiveStatusChange
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(result, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v1, "protocols", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v1, "protocols");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isActive");

          if ((v10 & 1) != 0)
          {
            v4 = 1;
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

    return (void *)objc_msgSend(v1, "setActive:", v4);
  }
  return result;
}

void __65__HMDDataStream_sendRequestForProtocol_topic_payload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDDataStreamPendingRequest *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  HMDDataStreamPendingRequest *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v4 = -[HMDDataStreamPendingRequest initWithIdentifier:protocol:topic:payload:callback:]([HMDDataStreamPendingRequest alloc], "initWithIdentifier:protocol:topic:payload:callback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 64), "pendingRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@DataStream pending the request: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);

  }
}

- (void)_sendMessageWithHeader:(void *)a3 payload:(void *)a4 completion:
{
  id v7;
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1, "sessionEncryption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(a1, "sessionEncryption");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      +[HMDDataStreamMessageCoder encryptEncryptedOPACKHeader:payload:sessionEncryption:error:](HMDDataStreamMessageCoder, "encryptEncryptedOPACKHeader:payload:sessionEncryption:error:", v7, v8, v11, &v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v23;

    }
    else
    {
      v22 = 0;
      +[HMDDataStreamMessageCoder buildUnencryptedOPACKHeader:payload:error:](HMDDataStreamMessageCoder, "buildUnencryptedOPACKHeader:payload:error:", v7, v8, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v22;
    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@DataStream encoding message failed (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v9[2](v9, v13);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pendingRequests");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v19;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v20;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Sending Message: %@ --> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v15, "transport");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendRawFrame:completion:", v12, v9);

    }
  }

}

@end
