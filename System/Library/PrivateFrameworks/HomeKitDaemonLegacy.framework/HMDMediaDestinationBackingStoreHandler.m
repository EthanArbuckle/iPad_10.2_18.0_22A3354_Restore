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

  v15 = *MEMORY[0x1E0C80C00];
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
    v7 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Merged destination: %@", (uint8_t *)&v11, 0x16u);

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

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  HMMediaDestinationSupportOptionsAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to supported options: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    -[HMDMediaDestinationBackingStoreHandler destination](v9, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "supportedOptions") == a3)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v9;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Supported options already updated", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v6[2](v6, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("UpdateSupportedOptions"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = [HMDMediaDestinationModel alloc];
      -[HMDMediaDestinationBackingStoreHandler destination](v9, "destination");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HMDMediaDestinationModel initWithDestination:changeType:](v22, "initWithDestination:changeType:", v23, 2);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaDestinationModel setSupportedOptions:](v24, "setSupportedOptions:", v25);

      -[HMDBackingStoreHandler runTransactionWithModel:reason:completion:](v9, "runTransactionWithModel:reason:completion:", v24, v21, v6);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v9;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update supported options due to no completion", buf, 0xCu);

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

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to audio group identifier: %@", (uint8_t *)&v28, 0x16u);

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
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = v9;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Attempting forced push due to audio group identifier already updated", (uint8_t *)&v28, 0xCu);

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
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v9;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio group identifier due to no completion", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)migrateWithHome:(id)a3 cloudZone:(id)a4 migrationQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDMediaDestinationBackingStoreHandler destination](self, "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__HMDMediaDestinationBackingStoreHandler_migrateWithHome_cloudZone_migrationQueue_completion___block_invoke;
  v20[3] = &unk_1E89A92F8;
  v20[4] = self;
  v21 = v10;
  v23 = v11;
  v24 = v13;
  v22 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v12;
  v19 = v10;
  objc_msgSend(v16, "cloudRecordWithObjectID:completionHandler:", v15, v20);

}

- (void)recoverDueToNoRecordInCloudWithHome:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaDestinationBackingStoreHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Recovering cloud data due to no record added", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDMediaDestinationBackingStoreHandler destination](v12, "destination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke;
  v19[3] = &unk_1E89B9648;
  v19[4] = v12;
  v20 = v9;
  v21 = v10;
  v17 = v10;
  v18 = v9;
  objc_msgSend(v8, "cleanChangesIfNoAddChangeObjectID:completion:", v16, v19);

}

- (void)migrateWithCurrentCloudRecord:(id)a3 home:(id)a4 cloudZone:(id)a5 migrationQueue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMDMediaDestinationBackingStoreHandler *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  HMDMediaDestinationBackingStoreHandler *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDMediaDestinationBackingStoreHandler *v37;
  NSObject *v38;
  void *v39;
  int v40;
  id v41;
  _QWORD block[4];
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "extractObjectChange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    v41 = v13;
    -[HMDMediaDestinationBackingStoreHandler destination](self, "destination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "supportedOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");
    if (v22 == objc_msgSend(v20, "supportedOptions"))
    {
      objc_msgSend(v19, "audioGroupIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "audioGroupIdentifier");
      v24 = v20;
      v25 = self;
      v26 = v19;
      v27 = v16;
      v28 = v15;
      v29 = v12;
      v30 = v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = HMFEqualObjects();

      v14 = v30;
      v12 = v29;
      v15 = v28;
      v16 = v27;
      v19 = v26;
      self = v25;
      v20 = v24;

      if (v40)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke_2;
        block[3] = &unk_1E89C0870;
        v43 = v16;
        dispatch_async(v15, block);

        v13 = v41;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v39;
      v48 = 2112;
      v49 = v19;
      v50 = 2112;
      v51 = v20;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Recovering due to miss matched model: %@ destination: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    v13 = v41;
    -[HMDMediaDestinationBackingStoreHandler recoverDueToInvalidRecordInCloudWithHome:migrationQueue:completion:](v37, "recoverDueToInvalidRecordInCloudWithHome:migrationQueue:completion:", v41, v15, v16);
  }
  else
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v35;
      v48 = 2112;
      v49 = v12;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate due to unknown model extracted from record: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke;
    v44[3] = &unk_1E89C0870;
    v45 = v16;
    dispatch_async(v15, v44);
    v20 = v45;
  }
LABEL_15:

}

- (void)recoverDueToInvalidRecordInCloudWithHome:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  HMDMediaDestinationBackingStoreHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Recovering cloud data due to invalid cloud record", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDMediaDestinationBackingStoreHandler destination](v12, "destination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dropAllChangesWithObjectID:", v16);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationBackingStoreHandler metricsDispatcher](v12, "metricsDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submitFailureEventWithFailureCode:error:", 3, v17);

  -[HMDMediaDestinationBackingStoreHandler destination](v12, "destination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:](HMDMediaDestinationBackingStoreHandler, "backingStoreObjectForMediaDestination:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setObjectChangeType:", 2);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__HMDMediaDestinationBackingStoreHandler_recoverDueToInvalidRecordInCloudWithHome_migrationQueue_completion___block_invoke;
  v23[3] = &unk_1E89C1D68;
  v24 = v20;
  v25 = v10;
  v21 = v20;
  v22 = v10;
  dispatch_async(v9, v23);

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
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction object updated with new object: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v12;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping due to Home Theater QFA enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }
  else
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
        v42 = (void *)MEMORY[0x1D17BA0A0]();
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
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio destination with unrecongnized model: %@", buf, 0x16u);

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
          v46 = v8;
          v31 = (void *)MEMORY[0x1D17BA0A0]();
          v32 = v12;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v48 = v34;
            v49 = 2112;
            v50 = v23;
            v51 = 2112;
            v52 = v30;
            _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Updated audio destination: %@ new audio destination: %@", buf, 0x20u);

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

          v8 = v46;
        }
        objc_msgSend(v10, "respondWithSuccess");

      }
    }
    else
    {
      v38 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to process unknown transaction object: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v23);
    }

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

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove unknown transaction object: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
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

void __109__HMDMediaDestinationBackingStoreHandler_recoverDueToInvalidRecordInCloudWithHome_migrationQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], v2, 0);

}

uint64_t __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping migration due to add transaction already exists", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_15;
    block[3] = &unk_1E89C0870;
    v10 = *(NSObject **)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    dispatch_async(v10, block);
    v11 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metricsDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitFailureEventWithFailureCode:error:", 2, v11);

    objc_msgSend(*(id *)(a1 + 32), "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:](HMDMediaDestinationBackingStoreHandler, "backingStoreObjectForMediaDestination:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setObjectChangeType:", 1);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_2;
    v18[3] = &unk_1E89C1D68;
    v15 = *(NSObject **)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v19 = v14;
    v20 = v16;
    v17 = v14;
    dispatch_async(v15, v18);

  }
}

uint64_t __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v1 + 16))(v1, v2, MEMORY[0x1E0C9AA60], 0);

}

uint64_t __94__HMDMediaDestinationBackingStoreHandler_migrateWithHome_cloudZone_migrationQueue_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (a2)
    return objc_msgSend(v3, "migrateWithCurrentCloudRecord:home:cloudZone:migrationQueue:completion:", a2, a1[5], a1[7], a1[6], a1[8]);
  else
    return objc_msgSend(v3, "recoverDueToNoRecordInCloudWithHome:migrationQueue:completion:", a1[5], a1[6], a1[8]);
}

+ (id)backingStoreObjectForMediaDestination:(id)a3
{
  id v3;
  HMDMediaDestinationModel *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[HMDMediaDestinationModel initWithDestination:changeType:]([HMDMediaDestinationModel alloc], "initWithDestination:changeType:", v3, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "supportedOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationModel setSupportedOptions:](v4, "setSupportedOptions:", v5);

  objc_msgSend(v3, "audioGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaDestinationModel setAudioGroupIdentifier:](v4, "setAudioGroupIdentifier:", v6);
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_37100 != -1)
    dispatch_once(&logCategory__hmf_once_t24_37100, &__block_literal_global_37101);
  return (id)logCategory__hmf_once_v25_37102;
}

void __53__HMDMediaDestinationBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_37102;
  logCategory__hmf_once_v25_37102 = v0;

}

@end
