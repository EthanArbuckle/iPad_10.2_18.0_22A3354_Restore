@implementation HMDObjectLookup

- (HMDObjectLookup)initWithWorkQueue:(id)a3
{
  id v5;
  HMDObjectLookup *v6;
  uint64_t v7;
  NSMapTable *uuidToObjectMapping;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDObjectLookup;
  v6 = -[HMDObjectLookup init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    uuidToObjectMapping = v6->_uuidToObjectMapping;
    v6->_uuidToObjectMapping = (NSMapTable *)v7;

    objc_storeStrong((id *)&v6->_workQueue, a3);
  }

  return v6;
}

- (void)lookUpAndApplyObjectChange:(id)a3 previous:(id)a4 result:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDObjectLookup *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "change");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "objectChangeType");

  objc_msgSend(v10, "change");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 == 3)
  {
    objc_msgSend(v16, "parentUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDObjectLookup _lookUpObjectWithUUID:applyObjectChange:previous:result:completionHandler:](self, "_lookUpObjectWithUUID:applyObjectChange:previous:result:completionHandler:", v18, v10, v11, v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "change");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v22);
  }
  else
  {
    objc_msgSend(v16, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDObjectLookup _lookUpObjectWithUUID:applyObjectChange:previous:result:completionHandler:](self, "_lookUpObjectWithUUID:applyObjectChange:previous:result:completionHandler:", v23, v10, v11, v12, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_11;
    objc_msgSend(v10, "change");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "parentUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDObjectLookup _lookUpObjectWithUUID:applyObjectChange:previous:result:completionHandler:](self, "_lookUpObjectWithUUID:applyObjectChange:previous:result:completionHandler:", v21, v10, v11, v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v19)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "change");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "uuid");
      v32 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Could not look up and apply object change for %@: %@", buf, 0x20u);

      v24 = v32;
    }

    objc_autoreleasePoolPop(v24);
    v30 = _Block_copy(v13);
    v31 = v30;
    if (v30)
      (*((void (**)(void *, void *))v30 + 2))(v30, v19);

  }
LABEL_11:

}

- (id)_lookUpObjectWithUUID:(id)a3 applyObjectChange:(id)a4 previous:(id)a5 result:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDObjectLookup applyChange:previous:onObject:result:completionHandler:](self, "applyChange:previous:onObject:result:completionHandler:", v13, v14, v18, v15, v16);
    v19 = 0;
  }
  else
  {
    -[HMDObjectLookup scanObjects](self, "scanObjects");
    -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[HMDObjectLookup applyChange:previous:onObject:result:completionHandler:](self, "applyChange:previous:onObject:result:completionHandler:", v13, v14, v21, v15, v16);
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v19;
}

- (void)resetObjects
{
  id v2;

  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)applyChange:(id)a3 previous:(id)a4 onObject:(id)a5 result:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  HMDObjectLookup *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  HMDObjectLookup *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(void *, void *);
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *context;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v46 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v13;
  if (objc_msgSend(v16, "conformsToProtocol:", &unk_255773B30))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v47 = v14;
  if (v18)
  {
    objc_msgSend(v14, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if ((v20 & 1) == 0)
    {
      context = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "change");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v23;
        v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Applying object change with UUID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
    }
    objc_initWeak((id *)buf, self);
    objc_msgSend(v12, "message");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      if (!v15)
      {
LABEL_22:
        objc_msgSend(v12, "change");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "objectChangeType") == 3;

        objc_msgSend(v12, "change");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
          objc_msgSend(v18, "transactionObjectRemoved:message:", v44, v27);
        else
          objc_msgSend(v18, "transactionObjectUpdated:newValues:message:", v46, v44, v27);

        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
      v28 = (void *)objc_msgSend(v26, "mutableCopy");
      objc_msgSend(v27, "responseHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTransactionResult:", v47);
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke_2;
      v48[3] = &unk_24E784088;
      v30 = v29;
      v49 = v30;
      v50 = v15;
      objc_msgSend(v28, "setResponseHandler:", v48);
      v31 = objc_msgSend(v28, "copy");

      v27 = (void *)v31;
    }
    else
    {
      v40 = (void *)MEMORY[0x24BE3F1D0];
      objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "messageWithName:destination:payload:", CFSTR("kTransactionUpdate"), v41, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setTransactionResult:", v47);
      objc_msgSend(v28, "setRemote:", 1);
      if (v15)
      {
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke;
        v51[3] = &unk_24E79AFA0;
        objc_copyWeak(&v53, (id *)buf);
        v52 = v15;
        objc_msgSend(v28, "setResponseHandler:", v51);

        objc_destroyWeak(&v53);
      }
      else
      {
        objc_msgSend(v28, "setResponseHandler:", &__block_literal_global_54);
      }
      v27 = (void *)objc_msgSend(v28, "copy");
    }

    goto LABEL_22;
  }
  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "change");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "uuid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v35;
    v56 = 2112;
    v57 = v37;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Object does not implement backing store protocol, cannot apply transaction for object-change: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
  v38 = (void (**)(void *, void *))_Block_copy(v15);
  if (v38)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2](v38, v39);

  }
LABEL_26:

}

- (NSMapTable)uuidToObjectMapping
{
  return self->_uuidToObjectMapping;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuidToObjectMapping, 0);
}

void __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Calling completion handler for transaction applied", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  if (v6)
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_108668 != -1)
    dispatch_once(&logCategory__hmf_once_t0_108668, &__block_literal_global_108669);
  return (id)logCategory__hmf_once_v1_108670;
}

void __30__HMDObjectLookup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_108670;
  logCategory__hmf_once_v1_108670 = v0;

}

@end
