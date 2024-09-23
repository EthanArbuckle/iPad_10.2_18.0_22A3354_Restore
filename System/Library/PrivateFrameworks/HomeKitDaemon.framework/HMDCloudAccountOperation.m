@implementation HMDCloudAccountOperation

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationBlock, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)main
{
  void *v3;
  HMDCloudAccountOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  HMDCloudAccountOperation *v12;
  NSObject *v13;
  id v14;
  void *v15;
  intptr_t v16;
  void *v17;
  HMDCloudAccountOperation *v18;
  NSObject *v19;
  id v20;
  void *v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  id location;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudAccountOperation description](v4, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting account operation %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = dispatch_group_create();
  objc_initWeak(&location, v4);
  dispatch_group_enter(v8);
  -[HMDCloudAccountOperation clientQueue](v4, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HMDCloudAccountOperation_main__block_invoke;
  block[3] = &unk_24E7972B0;
  objc_copyWeak(&v24, &location);
  v10 = v8;
  v23 = v10;
  dispatch_async(v9, block);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = v4;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCloudAccountOperation identifier](v12, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Waiting for account operation %@ to complete", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v16 = dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v17 = (void *)MEMORY[0x227676638](v16);
  v18 = v12;
  HMFGetOSLogHandle();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCloudAccountOperation identifier](v18, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Account operation %@ completed", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (HMDCloudAccountOperation)initWithBlock:(id)a3 clientQueue:(id)a4
{
  id v6;
  id v7;
  HMDCloudAccountOperation *v8;
  uint64_t v9;
  NSUUID *identifier;
  void *v11;
  id operationBlock;
  HMDCloudAccountOperation *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudAccountOperation;
  v8 = -[HMDCloudAccountOperation init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v11 = _Block_copy(v6);
    operationBlock = v8->_operationBlock;
    v8->_operationBlock = v11;

    objc_storeStrong((id *)&v8->_clientQueue, a4);
    v13 = v8;
  }

  return v8;
}

void __32__HMDCloudAccountOperation_main__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDCloudAccountOperation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Identifier = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __32__HMDCloudAccountOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "operationBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __32__HMDCloudAccountOperation_main__block_invoke_2;
    v5[3] = &unk_24E79C240;
    v6 = *(id *)(a1 + 32);
    ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

  }
}

- (void)setOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

@end
