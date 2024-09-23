@implementation HMDCoreFollowUpRemoveItemsOperation

- (HMDCoreFollowUpRemoveItemsOperation)initWithIdentifiersToRemove:(id)a3 followUpController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCoreFollowUpRemoveItemsOperation *v9;
  uint64_t v10;
  NSArray *identifiersToRemove;
  HMDCoreFollowUpRemoveItemsOperation *result;
  HMDCoreFollowUpRemoveItemsOperation *v13;
  SEL v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_7:
    v13 = (HMDCoreFollowUpRemoveItemsOperation *)_HMFPreconditionFailure();
    -[HMDCoreFollowUpRemoveItemsOperation main](v13, v14);
    return result;
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCoreFollowUpRemoveItemsOperation;
  v9 = -[HMFOperation initWithTimeout:](&v15, sel_initWithTimeout_, 0.0);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifiersToRemove = v9->_identifiersToRemove;
    v9->_identifiersToRemove = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_followUpController, a4);
  }

  return v9;
}

- (void)main
{
  void *v3;
  HMDCoreFollowUpRemoveItemsOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreFollowUpRemoveItemsOperation identifiersToRemove](v4, "identifiersToRemove");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping advertisement for existing followup items: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_initWeak((id *)buf, v4);
  -[HMDCoreFollowUpRemoveItemsOperation followUpController](v4, "followUpController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreFollowUpRemoveItemsOperation identifiersToRemove](v4, "identifiersToRemove");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__HMDCoreFollowUpRemoveItemsOperation_main__block_invoke;
  v10[3] = &unk_24E790260;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v8, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (NSArray)identifiersToRemove
{
  return self->_identifiersToRemove;
}

- (void)setIdentifiersToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (HMDFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_identifiersToRemove, 0);
}

void __43__HMDCoreFollowUpRemoveItemsOperation_main__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x227676638]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifiersToRemove");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully stopped advertising followup items: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "finish");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifiersToRemove");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop advertisement for followup items: %@, with error: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "cancelWithError:", v5);
  }

}

@end
