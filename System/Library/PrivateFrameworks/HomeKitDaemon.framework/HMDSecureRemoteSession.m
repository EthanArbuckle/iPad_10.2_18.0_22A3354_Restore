@implementation HMDSecureRemoteSession

- (HMDSecureRemoteSession)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDSecureRemoteSession)initWithDevice:(id)a3 accountRegistry:(id)a4
{
  id v6;
  id v7;
  HMDSecureRemoteSessionDefaultDataSource *v8;
  HMDSecureRemoteSession *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDSecureRemoteSessionDefaultDataSource);
  v9 = -[HMDSecureRemoteSession initWithDevice:accountRegistry:dataSource:](self, "initWithDevice:accountRegistry:dataSource:", v7, v6, v8);

  return v9;
}

- (HMDSecureRemoteSession)initWithDevice:(id)a3 accountRegistry:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSecureRemoteSession *v12;
  HMDSecureRemoteSession *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *clientQueue;
  uint64_t v19;
  NSMutableArray *pendingMessages;
  uint64_t v21;
  NSMutableArray *clientStreams;
  uint64_t v23;
  NSMutableArray *serverStreams;
  HMDSecureRemoteSession *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    v26 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      v29 = "%{public}@Device is required for HMDSecureRemoteSession";
LABEL_10:
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v26);
    v25 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    v26 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      v29 = "%{public}@Account registry is required for HMDSecureRemoteSession";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDSecureRemoteSession;
  v12 = -[HMDSecureRemoteSession init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_dataSource, a5);
    objc_storeStrong((id *)&v13->_device, a3);
    objc_storeStrong((id *)&v13->_accountRegistry, a4);
    HMDispatchQueueNameString();
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    clientQueue = v13->_clientQueue;
    v13->_clientQueue = (OS_dispatch_queue *)v17;

    v13->_maximumRemoteStreams = 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    pendingMessages = v13->_pendingMessages;
    v13->_pendingMessages = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v13, "maximumRemoteStreams"));
    v21 = objc_claimAutoreleasedReturnValue();
    clientStreams = v13->_clientStreams;
    v13->_clientStreams = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v13, "maximumRemoteStreams"));
    v23 = objc_claimAutoreleasedReturnValue();
    serverStreams = v13->_serverStreams;
    v13->_serverStreams = (NSMutableArray *)v23;

  }
  self = v13;
  v25 = self;
LABEL_12:

  return v25;
}

- (void)dealloc
{
  void *v3;
  HMDSecureRemoteSession *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_state)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Secure Remote Session abandoned without being closed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMFMessageTransport setDelegate:](v4, "setDelegate:", 0);
    -[HMDSecureRemoteSession _closeWithError:](v4, "_closeWithError:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)HMDSecureRemoteSession;
  -[HMDSecureRemoteSession dealloc](&v7, sel_dealloc);
}

- (NSArray)pendingMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_pendingMessages, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)clientStreams
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_clientStreams, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)serverStreams
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_serverStreams, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__HMDSecureRemoteSession_close__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_closeWithError:(id)a3
{
  id v4;
  void *v5;
  HMDSecureRemoteSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  HMDSecureRemoteSession *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = v4;
  if (v4)
  {
    v35 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v8;
    v53 = 2112;
    v54 = v33;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Closed with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSecureRemoteSession setState:](v6, "setState:", 0);
  -[HMFMessageTransport delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_25585D9C0))
    v10 = v9;
  else
    v10 = 0;
  v34 = v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v34, "secureRemoteSession:didCloseWithError:", v6, v33);
  os_unfair_lock_lock_with_options();
  v11 = (void *)-[NSMutableArray copy](v6->_pendingMessages, "copy");
  -[NSMutableArray removeAllObjects](v6->_pendingMessages, "removeAllObjects");
  v32 = (void *)-[NSMutableArray copy](v6->_clientStreams, "copy");
  -[NSMutableArray removeAllObjects](v6->_clientStreams, "removeAllObjects");
  v31 = (void *)-[NSMutableArray copy](v6->_serverStreams, "copy");
  -[NSMutableArray removeAllObjects](v6->_serverStreams, "removeAllObjects");
  os_unfair_lock_unlock(&v6->_lock);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "message");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x227676638]();
        v18 = v6;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v20;
          v53 = 2114;
          v54 = v16;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Cancelling queued message: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(v16, "responseHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v16, "responseHandler");
          v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, _QWORD))v22)[2](v22, v35, 0);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v13);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v32;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "stop");
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v24);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = v31;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "stop");
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v28);
  }

}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDSecureRemoteSession *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__HMDSecureRemoteSession_sendMessage_completionHandler___block_invoke;
  v13[3] = &unk_24E79B3F0;
  v14 = v8;
  v15 = self;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

- (void)_queueMessage:(id)a3
{
  id v4;
  void *v5;
  HMDSecureRemoteSession *v6;
  NSObject *v7;
  void *v8;
  _HMDSecureRemoteQueuedMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *pendingMessages;
  id v15;
  void *v16;
  HMDSecureRemoteSession *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDSecureRemoteSession *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t, _BYTE *);
  void *v31;
  id v32;
  _BYTE *v33;
  uint8_t v34[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE buf[24];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[_HMDSecureRemoteQueuedMessage initWithMessage:]([_HMDSecureRemoteQueuedMessage alloc], "initWithMessage:", v4);
  -[_HMDSecureRemoteQueuedMessage timer](v9, "timer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v6);

  -[_HMDSecureRemoteQueuedMessage timer](v9, "timer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteSession clientQueue](v6, "clientQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegateQueue:", v12);

  -[_HMDSecureRemoteQueuedMessage timer](v9, "timer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v41 = 0;
  os_unfair_lock_lock_with_options();
  pendingMessages = v6->_pendingMessages;
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __40__HMDSecureRemoteSession__queueMessage___block_invoke;
  v31 = &unk_24E77ECF0;
  v15 = v4;
  v32 = v15;
  v33 = buf;
  -[NSMutableArray hmf_enumerateWithAutoreleasePoolUsingBlock:](pendingMessages, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v28);
  -[NSMutableArray insertObject:atIndex:](v6->_pendingMessages, "insertObject:atIndex:", v9, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), v28, v29, v30, v31);

  os_unfair_lock_unlock(&v6->_lock);
  v16 = (void *)MEMORY[0x227676638]();
  v17 = v6;
  HMFGetOSLogHandle();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    *(_DWORD *)v34 = 138543874;
    v35 = v19;
    v36 = 2112;
    v37 = v21;
    v38 = 2048;
    v39 = v22;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Message, %@, queued at position %tu", v34, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v23 = (void *)MEMORY[0x227676638]();
  v24 = v17;
  HMFGetOSLogHandle();
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDSecureRemoteSession pendingMessages](v24, "pendingMessages");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138543618;
    v35 = v26;
    v36 = 2112;
    v37 = v27;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Queued messages: %@", v34, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
  _Block_object_dispose(buf, 8);

}

- (id)_dequeMessage
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  HMDSecureRemoteSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray popFirstObject](self->_pendingMessages, "popFirstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_msgSend(v4, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suspend");

    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Dequeuing message: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)receivedSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  HMDSecureRemoteSession *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMDSecureRemoteSession_receivedSecureMessage_fromDevice_fromTransport___block_invoke;
  block[3] = &unk_24E79AD20;
  v18 = v11;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  dispatch_async(v12, block);

}

- (void)_handleSecureClientMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  v13 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Messaging/Remote/Secure/HMDSecureRemoteSession.m", 624);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v12, "initWithName:", v15);

  objc_msgSend(v9, "uuidForKey:", CFSTR("kIDSSecureSessionIDKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  -[HMDSecureRemoteSession _serverStreamWithIdentifier:](self, "_serverStreamWithIdentifier:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 || !v19)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __74__HMDSecureRemoteSession__handleSecureClientMessage_fromDevice_transport___block_invoke;
    v24[3] = &unk_24E77ED18;
    v25 = v30;
    v26 = v9;
    v27 = v10;
    v28 = v19;
    -[HMDSecureRemoteSession _openServerStreamWithIdentifier:completionHandler:](self, "_openServerStreamWithIdentifier:completionHandler:", v16, v24);

    v23 = (void (**)(_QWORD, _QWORD, _QWORD))v25;
    goto LABEL_9;
  }
  objc_msgSend(v30, "begin");
  v29 = v30;
  objc_msgSend(v9, "messagePayload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleSecureMessage:fromDevice:fromTransport:", v21, v10, v19);

  __HMFActivityScopeLeave();
  objc_msgSend(v9, "responseHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v9, "responseHandler");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v23[2](v23, 0, 0);
LABEL_9:

  }
  __HMFActivityScopeLeave();

}

- (void)_handleSecureServerMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDSecureRemoteSession *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "uuidForKey:", CFSTR("kIDSSecureSessionIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  -[HMDSecureRemoteSession _clientStreamWithIdentiifer:](self, "_clientStreamWithIdentiifer:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && v14)
  {
    objc_msgSend(v8, "messagePayload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleSecureMessage:fromDevice:fromTransport:", v16, v9, v14);

    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSecureRemoteSession clientStreams](v19, "clientStreams");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Stream not found: %@", buf, 0x16u);

      v9 = v26;
    }

    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSecureRemoteSession device](v19, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postDidReceiveRemoteMessageWithNoListenerFromDevice:", v23);

  }
  objc_msgSend(v8, "responseHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v8, "responseHandler");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v25)[2](v25, v17, 0);

  }
}

- (void)_handleStreamInvalidationMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDSecureRemoteSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSecureRemoteSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  HMDSecureRemoteSession *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  HMDSecureRemoteSession *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kIDSSecureSessionIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v9;
    v46 = 2112;
    v47 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received invalidation message for stream %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSecureRemoteSession _clientStreamWithIdentiifer:](v7, "_clientStreamWithIdentiifer:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v14;
      v46 = 2112;
      v47 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Closing stream due to remote invalidation: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "stop");
  }
  objc_msgSend(v4, "arrayForKey:", CFSTR("streams"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v35 = v10;
    v36 = v5;
    v37 = v4;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[HMDSecureRemoteSession clientStreams](v7, "clientStreams");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        v20 = 0;
        v38 = v18;
        do
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v20);
          objc_msgSend(v21, "sessionID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v15, "containsObject:", v23);

          if ((v24 & 1) == 0)
          {
            v25 = (void *)MEMORY[0x227676638]();
            v26 = v7;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v28 = v19;
              v29 = v15;
              v30 = v16;
              v31 = v7;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v45 = v32;
              v46 = 2112;
              v47 = v21;
              _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Closing inactive stream due to remote invalidation: %@", buf, 0x16u);

              v7 = v31;
              v16 = v30;
              v15 = v29;
              v19 = v28;
              v18 = v38;
            }

            objc_autoreleasePoolPop(v25);
            objc_msgSend(v21, "stop");
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v18);
    }

    v5 = v36;
    v4 = v37;
    v10 = v35;
  }
  objc_msgSend(v4, "responseHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "responseHandler");
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v34[2](v34, 0, 0);

  }
}

- (id)_clientStreamWithIdentiifer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDSecureRemoteSession clientStreams](self, "clientStreams", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_clientStreamForMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDSecureRemoteSession clientStreams](self, "clientStreams", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "qualityOfService");
        objc_msgSend(v9, "qualityOfService");
        if (HMFQualityOfServiceCompare() != -1
          && objc_msgSend(v9, "isOpen")
          && (objc_msgSend(v9, "isIdle") & 1) != 0)
        {
          v6 = v9;
          goto LABEL_13;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (id)_serverStreamWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDSecureRemoteSession serverStreams](self, "serverStreams", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_openClientStreamWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  HMDSecureRemoteSession *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  HMDSecureRemoteSession *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSecureRemoteSession clientStreams](self, "clientStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6 < -[HMDSecureRemoteSession maximumRemoteStreams](self, "maximumRemoteStreams");
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Opening client stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDSecureRemoteSession dataSource](v9, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSecureRemoteSession device](v9, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createSecureStreamWithPeerDevice:clientMode:sessionID:", v14, 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setDelegate:", v9);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v17);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "qualityOfService") == 9)
          {
            v22 = (void *)MEMORY[0x227676638]();
            v23 = v9;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              HMFQualityOfServiceToString();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v25;
              v39 = 2112;
              v40 = v26;
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting QoS to %@ for client stream", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v22);
            objc_msgSend(v16, "setQualityOfService:", 17);
            goto LABEL_20;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_20:

    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](v9->_clientStreams, "addObject:", v16);
    os_unfair_lock_unlock(&v9->_lock);
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, v16);
    -[HMDSecureRemoteSession clientQueue](v9, "clientQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke;
    v28[3] = &unk_24E77ED40;
    objc_copyWeak(&v30, (id *)buf);
    objc_copyWeak(&v31, &location);
    v29 = v4;
    objc_msgSend(v16, "startAndInvokeOnQueue:completionHandler:", v27, v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v21;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Cannot open additional streams", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 49);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v16);
LABEL_21:

  }
}

- (void)_closeClientStream:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDSecureRemoteSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDSecureRemoteSession *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray containsObject:](self->_clientStreams, "containsObject:", v6))
  {
    -[NSMutableArray removeObject:](self->_clientStreams, "removeObject:", v6);
    v8 = (void *)-[NSMutableArray copy](self->_clientStreams, "copy");
    os_unfair_lock_unlock(&self->_lock);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Client stream stopped due to error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if (objc_msgSend(v8, "hmf_isEmpty"))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v10;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Last client stream closed, attempting to open a new client stream", buf, 0xCu);

      }
    }
    else
    {
      if (objc_msgSend(v6, "qualityOfService") != 9)
        goto LABEL_20;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v8;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v24;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v17);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "qualityOfService") == 9)
            {

              goto LABEL_21;
            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v18)
            continue;
          break;
        }
      }

      v13 = (void *)MEMORY[0x227676638]();
      v14 = v10;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v21;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Last background client stream closed, attempting to open a new client stream", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v13);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __51__HMDSecureRemoteSession__closeClientStream_error___block_invoke;
    v22[3] = &unk_24E77ED68;
    v22[4] = v10;
    -[HMDSecureRemoteSession _openClientStreamWithCompletionHandler:](v10, "_openClientStreamWithCompletionHandler:", v22);
LABEL_20:
    v17 = v8;
    goto LABEL_21;
  }
  os_unfair_lock_unlock(&self->_lock);
  v17 = 0;
LABEL_21:

}

- (void)_openServerStreamWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMDSecureRemoteSession serverStreams](self, "serverStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_msgSend(v9, "count");
  if (v10 >= -[HMDSecureRemoteSession maximumRemoteStreams](self, "maximumRemoteStreams"))
  {
    objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_69791);
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stop");

  }
  -[HMDSecureRemoteSession dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteSession device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createSecureStreamWithPeerDevice:clientMode:sessionID:", v13, 0, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setDelegate:", self);
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_serverStreams, "addObject:", v14);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v14);
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_2;
  v17[3] = &unk_24E77ED40;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  v16 = v7;
  v18 = v16;
  objc_msgSend(v14, "startAndInvokeOnQueue:completionHandler:", v15, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_closeServerStream:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSecureRemoteSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMDRemoteDeviceMessageDestination *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDRemoteDeviceMessageDestination *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  if (!-[NSMutableArray containsObject:](self->_serverStreams, "containsObject:", v6))
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_21;
  }
  -[NSMutableArray removeObject:](self->_serverStreams, "removeObject:", v6);
  v32 = (void *)-[NSMutableArray copy](self->_serverStreams, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    v43 = 2112;
    v44 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Server stream stopped due to error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMFMessageTransport delegate](v9, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_25585D9C0))
    v13 = v12;
  else
    v13 = 0;
  v33 = v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD1100]))
    {
LABEL_18:

      goto LABEL_19;
    }
    v15 = objc_msgSend(v7, "code") == -6722;

    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v9, "maximumRemoteStreams"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v16 = v32;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v35;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v19), "sessionID", v32);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "UUIDString");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v17);
      }

      v22 = [HMDRemoteDeviceMessageDestination alloc];
      objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "target");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "peerDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v22, "initWithTarget:device:", v24, v25);

      v27 = (void *)MEMORY[0x24BE3F1B0];
      v38[0] = CFSTR("kIDSSecureSessionIDKey");
      objc_msgSend(v6, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = CFSTR("streams");
      v39[0] = v29;
      v39[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "messageWithName:destination:payload:", CFSTR("kSecureSessionInvalidatedNotificationKey"), v26, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "secureRemoteSession:receivedRequestToSendMessage:", v9, v31);
      goto LABEL_18;
    }
  }
LABEL_19:

LABEL_21:
}

- (void)secureRemoteStreamIsIdle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMDSecureRemoteSession_secureRemoteStreamIsIdle___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)secureRemoteStream:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDSecureRemoteSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDSecureRemoteSession_secureRemoteStream_didCloseWithError___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)secureRemoteStream:(id)a3 receivedRequestToSendMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDSecureRemoteSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMFMessageTransport delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_25585D9C0))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "secureRemoteSession:receivedRequestToSendMessage:", self, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Cannot send message, no delegate: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v7, "responseHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "responseHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v17)[2](v17, v16, 0);

    }
  }

}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDSecureRemoteSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMFMessageTransport delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "messageTransport:didReceiveMessage:", self, v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Cannot send message, no delegate: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v7, "responseHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "responseHandler");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v15)[2](v15, v14, 0);

    }
  }

}

- (id)dumpState
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  HMDSecureRemoteSession *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __35__HMDSecureRemoteSession_dumpState__block_invoke;
  v11 = &unk_24E79C268;
  v12 = v3;
  v13 = self;
  v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDSecureRemoteSession device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *pendingMessages;
  id v7;
  void *v8;
  void *v9;
  HMDSecureRemoteSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSecureRemoteSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  pendingMessages = self->_pendingMessages;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __39__HMDSecureRemoteSession_timerDidFire___block_invoke;
  v19[3] = &unk_24E77EDD0;
  v7 = v4;
  v20 = v7;
  -[NSMutableArray hmf_objectPassingTest:](pendingMessages, "hmf_objectPassingTest:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableArray removeObject:](self->_pendingMessages, "removeObject:", v8);

    os_unfair_lock_unlock(&self->_lock);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "message");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Queued message timed out: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "responseHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "responseHandler");
      v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v18)[2](v18, v17, 0);

    }
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (HMDSecureRemoteSessionDataSource)dataSource
{
  return self->_dataSource;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (unint64_t)maximumRemoteStreams
{
  return self->_maximumRemoteStreams;
}

- (void)setMaximumRemoteStreams:(unint64_t)a3
{
  self->_maximumRemoteStreams = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serverStreams, 0);
  objc_storeStrong((id *)&self->_clientStreams, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
}

uint64_t __39__HMDSecureRemoteSession_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __35__HMDSecureRemoteSession_dumpState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%tu"), objc_msgSend(*(id *)(a1 + 40), "maximumRemoteStreams"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("maximumStreams"));

  objc_msgSend(*(id *)(a1 + 40), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("device"));

  objc_msgSend(*(id *)(a1 + 40), "pendingMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v11), "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("queuedMessages"));
  objc_msgSend(*(id *)(a1 + 40), "clientStreams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v20), "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v18);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, CFSTR("clientStreams"));
  objc_msgSend(*(id *)(a1 + 40), "serverStreams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v28), "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v26);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, CFSTR("serverStreams"));
}

uint64_t __63__HMDSecureRemoteSession_secureRemoteStream_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "role") == 1)
    return objc_msgSend(*(id *)(a1 + 40), "_closeClientStream:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "role");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_closeServerStream:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  return result;
}

void __51__HMDSecureRemoteSession_secureRemoteStreamIsIdle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stream is idle: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 40), "isOpen"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "role") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingMessages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "qualityOfService");
      objc_msgSend(*(id *)(a1 + 40), "qualityOfService");
      v10 = HMFQualityOfServiceCompare();

      if (v10 != -1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_dequeMessage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(a1 + 40), "sendMessage:completionHandler:", v11, 0);

      }
    }
  }
}

void __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_3;
    v7[3] = &unk_24E798B60;
    objc_copyWeak(&v11, a1 + 6);
    v8 = v3;
    v9 = v5;
    v10 = a1[4];
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
  }

}

void __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Failed to start server stream due to error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 16);
    os_unfair_lock_lock_with_options();
    if (WeakRetained
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", WeakRetained))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", WeakRetained);
      os_unfair_lock_unlock(v8);
      objc_msgSend(WeakRetained, "stop");
    }
    else
    {
      os_unfair_lock_unlock(v8);
    }
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    if (*(_QWORD *)(a1 + 32))
      v10 = 0;
    else
      v10 = WeakRetained;
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }

}

uint64_t __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v7, "lastActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "compare:", v12);
  return v13;
}

void __51__HMDSecureRemoteSession__closeClientStream_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to open primary stream, closing session", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v6);
  }

}

void __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_24E798B60;
    objc_copyWeak(&v11, a1 + 6);
    v8 = v3;
    v9 = v5;
    v10 = a1[4];
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
  }

}

void __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      v21 = 138543618;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to start client stream due to error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 16);
    os_unfair_lock_lock_with_options();
    if (v3 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", v3))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", v3);
      os_unfair_lock_unlock(v9);
      objc_msgSend(v3, "stop");
    }
    else
    {
      os_unfair_lock_unlock(v9);
    }
  }
  else if (WeakRetained)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Opened client stream: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 40), "pendingMessages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "qualityOfService");
    objc_msgSend(v3, "qualityOfService");
    v17 = HMFQualityOfServiceCompare();

    if (v17 != -1)
    {
      objc_msgSend(*(id *)(a1 + 40), "_dequeMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v3, "sendMessage:completionHandler:", v18, 0);

    }
  }
  v19 = *(_QWORD *)(a1 + 48);
  if (v19)
  {
    if (*(_QWORD *)(a1 + 32))
      v20 = 0;
    else
      v20 = v3;
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }

}

void __74__HMDSecureRemoteSession__handleSecureClientMessage_fromDevice_transport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "begin");
    v10 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleSecureMessage:fromDevice:fromTransport:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    __HMFActivityScopeLeave();
  }
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v6, 0);

  }
}

void __73__HMDSecureRemoteSession_receivedSecureMessage_fromDevice_fromTransport___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kSecureClientIDSMessageRequestKey")))
  {
    objc_msgSend(*(id *)(a1 + 48), "_handleSecureClientMessage:fromDevice:transport:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("kSecureServerIDSMessageRequestKey")))
  {
    objc_msgSend(*(id *)(a1 + 48), "_handleSecureServerMessage:fromDevice:transport:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("kSecureSessionInvalidatedNotificationKey")))
  {
    objc_msgSend(*(id *)(a1 + 48), "_handleStreamInvalidationMessage:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "responseHandler");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v4)[2](v4, v3, 0);

    }
  }

}

void __40__HMDSecureRemoteSession__queueMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "qualityOfService");
  objc_msgSend(v8, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "qualityOfService");
  v10 = HMFQualityOfServiceCompare();

  if (v10 == 1)
  {
    if (a4)
      *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + 1;
  }
}

void __56__HMDSecureRemoteSession_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 40), "state"))
  {
    v19 = *(id *)(a1 + 48);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v19;
    else
      v2 = 0;
    v3 = v2;

    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "destination");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "messagePayload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", v4, v5, v6);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setIdentifier:", v7);

      objc_msgSend(*(id *)(a1 + 48), "responseHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setResponseHandler:", v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "_clientStreamForMessage:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "sendMessage:completionHandler:", v19, *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_queueMessage:", v19);
      objc_msgSend(*(id *)(a1 + 40), "_openClientStreamWithCompletionHandler:", 0);
      v18 = *(_QWORD *)(a1 + 56);
      if (v18)
        (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot send message on closed session: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v16);

  }
}

uint64_t __31__HMDSecureRemoteSession_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

void __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Session already opened", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Opening", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke_95;
    v11[3] = &unk_24E77ECC8;
    v10 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v13 = v10;
    objc_msgSend(v12, "_openClientStreamWithCompletionHandler:", v11);

  }
}

void __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Opened", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    objc_msgSend(v5, "maximumRemoteStreams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = maximumSecureRemoteStreams;
      v15 = objc_msgSend(v12, "unsignedIntegerValue");
      if (v14 >= v15)
        v14 = v15;
      if (v14 != objc_msgSend(*(id *)(a1 + 32), "maximumRemoteStreams"))
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543618;
          v24 = v19;
          v25 = 2048;
          v26 = v14;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Upgrading number of streams to '%tu'", (uint8_t *)&v23, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(*(id *)(a1 + 32), "setMaximumRemoteStreams:", v14);
      }
    }

    v20 = v6;
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = (unint64_t)v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to open initial client stream with error: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v20 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v6);
  }
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v20);

}

+ (BOOL)isSecureRemoteSessionMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSecureClientIDSMessageRequestKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kSecureServerIDSMessageRequestKey")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kSecureSessionInvalidatedNotificationKey"));
  }

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t56 != -1)
    dispatch_once(&logCategory__hmf_once_t56, &__block_literal_global_137_69841);
  return (id)logCategory__hmf_once_v57;
}

void __37__HMDSecureRemoteSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v57;
  logCategory__hmf_once_v57 = v0;

}

@end
