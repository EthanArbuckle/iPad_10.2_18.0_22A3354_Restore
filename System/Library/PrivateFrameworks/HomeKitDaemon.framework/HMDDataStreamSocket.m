@implementation HMDDataStreamSocket

- (HMDDataStreamSocket)initWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDDataStreamSocket *v11;
  HMDDataStreamSocket *v12;
  uint64_t v13;
  NSMutableArray *pendingReads;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDDataStreamSocket;
  v11 = -[HMDDataStreamSocket init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_streamProtocol, v8);
    objc_storeStrong((id *)&v12->_applicationProtocolName, a4);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    *(_WORD *)&v12->_closing = 0;
    v12->_trafficClass = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    pendingReads = v12->_pendingReads;
    v12->_pendingReads = (NSMutableArray *)v13;

  }
  return v12;
}

- (HMDDataStreamSocketDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDDataStreamSocketDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isClosed
{
  HMDDataStreamSocket *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_closed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)trafficClass
{
  os_unfair_lock_s *p_lock;
  unint64_t trafficClass;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  trafficClass = self->_trafficClass;
  os_unfair_lock_unlock(p_lock);
  return trafficClass;
}

- (void)setTrafficClass:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t trafficClass;
  NSObject *v7;
  _QWORD block[7];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  trafficClass = self->_trafficClass;
  self->_trafficClass = a3;
  os_unfair_lock_unlock(p_lock);
  if (trafficClass != a3)
  {
    -[HMDDataStreamSocket workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__HMDDataStreamSocket_setTrafficClass___block_invoke;
    block[3] = &unk_24E782088;
    block[4] = self;
    block[5] = trafficClass;
    block[6] = a3;
    dispatch_async(v7, block);

  }
}

- (void)close
{
  -[HMDDataStreamSocket closeWithError:](self, "closeWithError:", 0);
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a3;
  v7 = -[HMDDataStreamSocket isClosed](self, "isClosed");
  if (v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1061);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HMDDataStreamSocket _writeData:completion:](self, "_writeData:completion:", v6, 0);
  }

  return !v7;
}

- (void)writeData:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[HMDDataStreamSocket isClosed](self, "isClosed"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1061);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
  else
  {
    -[HMDDataStreamSocket _writeData:completion:](self, "_writeData:completion:", v8, v6);
  }

}

- (void)_writeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDDataStreamSocket workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HMDDataStreamSocket__writeData_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)readData
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray hmf_maybeDequeue](self->_pendingReads, "hmf_maybeDequeue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_closed)
  {
    self->_closing = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    *(_WORD *)&self->_closing = 256;
    os_unfair_lock_unlock(&self->_lock);
    -[HMDDataStreamSocket workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__HMDDataStreamSocket_closeWithError___block_invoke;
    v6[3] = &unk_24E79C268;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)handleIncomingData:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray hmf_enqueue:](self->_pendingReads, "hmf_enqueue:", v4);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDDataStreamSocket workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDDataStreamSocket_handleIncomingData___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)closeInitiated
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_closing = 1;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)applicationProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDDataStreamStreamProtocol)streamProtocol
{
  return (HMDDataStreamStreamProtocol *)objc_loadWeakRetained((id *)&self->_streamProtocol);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isClosing
{
  return self->_closing;
}

- (void)setClosing:(BOOL)a3
{
  self->_closing = a3;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (NSMutableArray)pendingReads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_streamProtocol);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationProtocolName, 0);
}

void __42__HMDDataStreamSocket_handleIncomingData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "socketDidReceiveData:", *(_QWORD *)(a1 + 32));

}

void __38__HMDDataStreamSocket_closeWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "streamProtocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterSocket:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "socket:didFailWithError:", v4);
  else
    objc_msgSend(v3, "socketDidClose:", v4);

}

void __45__HMDDataStreamSocket__writeData_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "streamProtocol");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendData:socket:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __39__HMDDataStreamSocket_setTrafficClass___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Traffic class changed from %lu -> %lu, notifying protocol", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "streamProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "evaluateOptionsForSocket:", *(_QWORD *)(a1 + 32));

}

@end
