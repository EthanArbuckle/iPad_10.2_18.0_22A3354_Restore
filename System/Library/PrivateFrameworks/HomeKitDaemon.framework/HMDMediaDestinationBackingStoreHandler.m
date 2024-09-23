@implementation HMDMediaDestinationBackingStoreHandler

- (HMDMediaDestinationBackingStoreHandler)initWithDestination:(id)a3 backingStore:(id)a4 metricsDispatcher:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDMediaDestinationBackingStoreHandler *v16;
  uint64_t v17;
  HMMutableMediaDestination *destination;
  HMDMediaDestinationBackingStoreHandler *result;
  HMDMediaDestinationBackingStoreHandler *v20;
  SEL v21;
  id v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    v20 = (HMDMediaDestinationBackingStoreHandler *)_HMFPreconditionFailure();
    -[HMDMediaDestinationBackingStoreHandler mergeDestination:](v20, v21, v22);
    return result;
  }
  v14 = v13;
  objc_msgSend(v10, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)HMDMediaDestinationBackingStoreHandler;
  v16 = -[HMDBackingStoreHandler initWithIdentifier:backingStore:](&v23, sel_initWithIdentifier_backingStore_, v15, v11);

  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    v17 = objc_msgSend(v10, "mutableCopy");
    destination = v16->_destination;
    v16->_destination = (HMMutableMediaDestination *)v17;

    objc_storeStrong((id *)&v16->_metricsDispatcher, a5);
  }

  return v16;
}

- (void)mergeDestination:(id)a3
{
  id v4;
  HMMutableMediaDestination *v5;
  HMMutableMediaDestination *destination;
  void *v7;
  HMDMediaDestinationBackingStoreHandler *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  if ((-[HMMutableMediaDestination isEqual:](self->_destination, "isEqual:", v4) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = (HMMutableMediaDestination *)objc_msgSend(v4, "mutableCopy");
    destination = self->_destination;
    self->_destination = v5;

    os_unfair_lock_unlock(&self->_lock);
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merged destination: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  HMDMediaDestinationBackingStoreHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaDestinationBackingStoreHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDMediaDestinationBackingStoreHandler *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDMediaDestinationModel *v22;
  void *v23;
  HMDMediaDestinationModel *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  HMMediaDestinationSupportOptionsAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to supported options: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    -[HMDMediaDestinationBackingStoreHandler destination](v9, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "supportedOptions") == a3)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v9;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Supported options already updated", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v6[2](v6, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("UpdateSupportedOptions"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = [HMDMediaDestinationModel alloc];
      -[HMDMediaDestinationBackingStoreHandler destination](v9, "destination");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HMDMediaDestinationModel initWithDestination:changeType:](v22, "initWithDestination:changeType:", v23, 2);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaDestinationModel setSupportedOptions:](v24, "setSupportedOptions:", v25);

      -[HMDBackingStoreHandler runTransactionWithModel:reason:completion:](v9, "runTransactionWithModel:reason:completion:", v24, v21, v6);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v9;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update supported options due to no completion", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)updateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationBackingStoreHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDMediaDestinationBackingStoreHandler *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  HMDMediaDestinationModel *v21;
  void *v22;
  HMDMediaDestinationModel *v23;
  void *v24;
  HMDMediaDestinationBackingStoreHandler *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to audio group identifier: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaDestinationBackingStoreHandler destination](v9, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "audioGroupIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "hmf_isEqualToUUID:", v14);

    if (v15)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v9;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Attempting forced push due to audio group identifier already updated", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      +[HMDBackingStoreTransactionOptions defaultOutOfSyncOptions](HMDBackingStoreTransactionOptions, "defaultOutOfSyncOptions");
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v20;
    }
    v21 = [HMDMediaDestinationModel alloc];
    -[HMDMediaDestinationBackingStoreHandler destination](v9, "destination");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDMediaDestinationModel initWithDestination:changeType:](v21, "initWithDestination:changeType:", v22, 2);

    -[HMDMediaDestinationModel setAudioGroupIdentifier:](v23, "setAudioGroupIdentifier:", v6);
    -[HMDBackingStoreHandler runTransactionWithModel:options:reason:completion:](v9, "runTransactionWithModel:options:reason:completion:", v23, v12, CFSTR("UpdateAudioGroupIdentifier"), v7);

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v9;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio group identifier due to no completion", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (HMMediaDestination)destination
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[HMMutableMediaDestination copy](self->_destination, "copy");
  os_unfair_lock_unlock(p_lock);
  return (HMMediaDestination *)v4;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableMediaDestination setSupportedOptions:](self->_destination, "setSupportedOptions:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setAudioGroupIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMMutableMediaDestination setAudioGroupIdentifier:](self->_destination, "setAudioGroupIdentifier:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaDestinationBackingStoreHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaDestinationBackingStoreHandler *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDMediaDestinationBackingStoreHandler *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDMediaDestinationBackingStoreHandler *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMDMediaDestinationBackingStoreHandler *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v14;
    v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction object updated with new object: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && !objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    v19 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      -[HMDMediaDestinationBackingStoreHandler destination](v12, "destination");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22
        && (objc_msgSend(v22, "uniqueIdentifier"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v21, "uuid"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v24, "hmf_isEqualToUUID:", v25),
            v25,
            v24,
            (v26 & 1) == 0))
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = v12;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v45;
          v49 = 2112;
          v50 = v21;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio destination with unrecongnized model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v42);
      }
      else
      {
        objc_msgSend(v21, "setProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "containsObject:", CFSTR("supportedOptions")))
        {
          objc_msgSend(v21, "supportedOptions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaDestinationBackingStoreHandler setSupportedOptions:](v12, "setSupportedOptions:", objc_msgSend(v28, "unsignedIntegerValue"));

        }
        if (objc_msgSend(v27, "containsObject:", CFSTR("audioGroupIdentifier")))
        {
          objc_msgSend(v21, "audioGroupIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaDestinationBackingStoreHandler setAudioGroupIdentifier:](v12, "setAudioGroupIdentifier:", v29);

        }
        -[HMDMediaDestinationBackingStoreHandler destination](v12, "destination");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((HMFEqualObjects() & 1) == 0)
        {
          v31 = (void *)MEMORY[0x227676638]();
          v32 = v12;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v46 = v31;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v48 = v34;
            v49 = 2112;
            v50 = v23;
            v51 = 2112;
            v52 = v30;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Updated audio destination: %@ new audio destination: %@", buf, 0x20u);

            v31 = v46;
          }

          objc_autoreleasePoolPop(v31);
          objc_msgSend(v10, "transactionResult");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "markChanged");

          objc_msgSend(v10, "transactionResult");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "markSaveToAssistant");

          -[HMDMediaDestinationBackingStoreHandler delegate](v32, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "mediaDestinationBackingStoreHandler:didUpdateDestination:", v32, v30);

        }
        objc_msgSend(v10, "respondWithSuccess");

      }
    }
    else
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v12;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        v49 = 2112;
        v50 = v19;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to process unknown transaction object: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v23);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v12;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping due to Home Theater QFA enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationBackingStoreHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove unknown transaction object: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v12);

}

- (HMDMediaDestinationBackingStoreHandlerDelegate)delegate
{
  return (HMDMediaDestinationBackingStoreHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDMediaDestinationManagerMetricsDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destination, 0);
}

+ (id)backingStoreObjectForMediaDestination:(id)a3
{
  id v3;
  HMDMediaDestinationModel *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[HMDMediaDestinationModel initWithDestination:changeType:]([HMDMediaDestinationModel alloc], "initWithDestination:changeType:", v3, 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "supportedOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationModel setSupportedOptions:](v4, "setSupportedOptions:", v5);

  objc_msgSend(v3, "audioGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaDestinationModel setAudioGroupIdentifier:](v4, "setAudioGroupIdentifier:", v6);
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_54550 != -1)
    dispatch_once(&logCategory__hmf_once_t18_54550, &__block_literal_global_54551);
  return (id)logCategory__hmf_once_v19_54552;
}

void __53__HMDMediaDestinationBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_54552;
  logCategory__hmf_once_v19_54552 = v0;

}

@end
