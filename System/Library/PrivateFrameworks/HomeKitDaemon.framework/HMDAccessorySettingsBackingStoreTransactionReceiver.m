@implementation HMDAccessorySettingsBackingStoreTransactionReceiver

- (HMDAccessorySettingsBackingStoreTransactionReceiver)initWithDelegate:(id)a3
{
  id v4;
  HMDAccessorySettingsBackingStoreTransactionReceiver *v5;
  HMDAccessorySettingsBackingStoreTransactionReceiver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessorySettingsBackingStoreTransactionReceiver;
  v5 = -[HMDAccessorySettingsBackingStoreTransactionReceiver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v7 = a4;
  v8 = a5;
  -[HMDAccessorySettingsBackingStoreTransactionReceiver delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke;
    v27[3] = &unk_24E799FD0;
    v27[4] = self;
    v28 = v12;
    v29 = v8;
    v13 = v12;
    objc_msgSend(v9, "handleUpdatedGroupModel:completion:", v13, v27);

    v14 = v28;
  }
  else
  {
    v15 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_2;
      v24[3] = &unk_24E77D3C0;
      v24[4] = self;
      v25 = v17;
      v26 = v8;
      v13 = v17;
      objc_msgSend(v9, "handleUpdatedSettingModel:completion:", v13, v24);

      v14 = v25;
    }
    else
    {
      v18 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v13);
        goto LABEL_17;
      }
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_5;
      v21[3] = &unk_24E799FD0;
      v21[4] = self;
      v22 = v20;
      v23 = v8;
      v13 = v20;
      objc_msgSend(v9, "handleUpdatedSettingConstraintModel:completion:", v13, v21);

      v14 = v22;
    }
  }

LABEL_17:
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingsBackingStoreTransactionReceiver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke;
    v26[3] = &unk_24E799FD0;
    v26[4] = self;
    v27 = v11;
    v28 = v7;
    v12 = v11;
    objc_msgSend(v8, "handleRemovedSettingModel:completion:", v12, v26);

    v13 = v27;
  }
  else
  {
    v14 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_7;
      v23[3] = &unk_24E799FD0;
      v23[4] = self;
      v24 = v16;
      v25 = v7;
      v12 = v16;
      objc_msgSend(v8, "handleRemovedGroupModel:completion:", v12, v23);

      v13 = v24;
    }
    else
    {
      v17 = v14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      if (!v19)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "respondWithError:", v12);
        goto LABEL_17;
      }
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_8;
      v20[3] = &unk_24E799FD0;
      v20[4] = self;
      v21 = v19;
      v22 = v7;
      v12 = v19;
      objc_msgSend(v8, "handleRemovedSettingConstraintModel:completion:", v12, v20);

      v13 = v21;
    }
  }

LABEL_17:
}

- (HMDAccessorySettingsBackingStoreTransactionReceiverDelegate)delegate
{
  return (HMDAccessorySettingsBackingStoreTransactionReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ removing a setting %@.", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "transactionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markChanged");

    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ removing a group %@.", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "transactionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markChanged");

    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ removing the constraint %@.", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "transactionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markChanged");

    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ adding a group %@.", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "transactionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markChanged");

    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ adding a setting %@.", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v7);
  }
  else
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 48), "transactionResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "markChanged");

    }
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ adding a constraint %@.", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "transactionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markChanged");

    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

@end
