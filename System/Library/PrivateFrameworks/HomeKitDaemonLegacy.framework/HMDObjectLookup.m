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
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
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

  v39 = *MEMORY[0x1E0C80C00];
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
    v24 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Could not look up and apply object change for %@: %@", buf, 0x20u);

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
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
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
  void *v16;
  id v17;
  void *v18;
  HMDObjectLookup *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(void *, void *);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v41 = a4;
  v13 = a5;
  v42 = a6;
  v14 = a7;
  v15 = v13;
  if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EFA5FF00))
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "change");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v22;
      v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Applying object change with UUID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_initWeak((id *)buf, v19);
    objc_msgSend(v12, "message");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (!v14)
      {
LABEL_20:
        objc_msgSend(v12, "change", v41);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "objectChangeType") == 3;

        objc_msgSend(v12, "change");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
          objc_msgSend(v17, "transactionObjectRemoved:message:", v40, v26);
        else
          objc_msgSend(v17, "transactionObjectUpdated:newValues:message:", v41, v40, v26);

        objc_destroyWeak((id *)buf);
        goto LABEL_24;
      }
      v27 = (void *)objc_msgSend(v25, "mutableCopy");
      objc_msgSend(v26, "responseHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTransactionResult:", v42);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke_2;
      v43[3] = &unk_1E89AF000;
      v29 = v28;
      v44 = v29;
      v45 = v14;
      objc_msgSend(v27, "setResponseHandler:", v43);
      v30 = objc_msgSend(v27, "copy");

      v26 = (void *)v30;
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0D285F8];
      objc_msgSend(MEMORY[0x1E0D285D8], "allMessageDestinations");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "messageWithName:destination:payload:", CFSTR("kTransactionUpdate"), v37, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setTransactionResult:", v42);
      objc_msgSend(v27, "setRemote:", 1);
      if (v14)
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke;
        v46[3] = &unk_1E89C1B70;
        objc_copyWeak(&v48, (id *)buf);
        v47 = v14;
        objc_msgSend(v27, "setResponseHandler:", v46);

        objc_destroyWeak(&v48);
      }
      else
      {
        objc_msgSend(v27, "setResponseHandler:", &__block_literal_global_54_76532);
      }
      v26 = (void *)objc_msgSend(v27, "copy", v41);
    }

    goto LABEL_20;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "change");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v31;
    v51 = 2112;
    v52 = v33;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Object does not implement backing store protocol, cannot apply transaction for object-change: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  v34 = (void (**)(void *, void *))_Block_copy(v14);
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2](v34, v35);

  }
LABEL_24:

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

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Calling completion handler for transaction applied", (uint8_t *)&v12, 0xCu);

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
  if (logCategory__hmf_once_t0_76543 != -1)
    dispatch_once(&logCategory__hmf_once_t0_76543, &__block_literal_global_76544);
  return (id)logCategory__hmf_once_v1_76545;
}

void __30__HMDObjectLookup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_76545;
  logCategory__hmf_once_v1_76545 = v0;

}

@end
