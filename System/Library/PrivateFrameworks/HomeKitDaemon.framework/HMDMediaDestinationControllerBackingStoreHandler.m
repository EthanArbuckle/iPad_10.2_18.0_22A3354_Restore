@implementation HMDMediaDestinationControllerBackingStoreHandler

- (HMDMediaDestinationControllerBackingStoreHandler)initWithData:(id)a3 backingStore:(id)a4 metricsEventDispatcher:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDMediaDestinationControllerBackingStoreHandler *v16;
  uint64_t v17;
  HMMutableMediaDestinationControllerData *data;
  HMDMediaDestinationControllerBackingStoreHandler *result;
  HMDMediaDestinationControllerBackingStoreHandler *v20;
  SEL v21;
  id v22;
  id v23;
  objc_super v24;

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
    v20 = (HMDMediaDestinationControllerBackingStoreHandler *)_HMFPreconditionFailure();
    -[HMDMediaDestinationControllerBackingStoreHandler updateDestinationIdentifier:completion:](v20, v21, v22, v23);
    return result;
  }
  v14 = v13;
  objc_msgSend(v10, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaDestinationControllerBackingStoreHandler;
  v16 = -[HMDBackingStoreHandler initWithIdentifier:backingStore:](&v24, sel_initWithIdentifier_backingStore_, v15, v11);

  if (v16)
  {
    v17 = objc_msgSend(v10, "mutableCopy");
    data = v16->_data;
    v16->_data = (HMMutableMediaDestinationControllerData *)v17;

    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_metricsEventDispatcher, a5);
  }

  return v16;
}

- (void)updateDestinationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationControllerBackingStoreHandler *v9;
  NSObject *v10;
  void *v11;
  HMDMediaDestinationControllerModel *v12;
  void *v13;
  HMDMediaDestinationControllerModel *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to destination identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = [HMDMediaDestinationControllerModel alloc];
  -[HMDMediaDestinationControllerBackingStoreHandler data](v9, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMediaDestinationControllerModel initWithData:changeType:](v12, "initWithData:changeType:", v13, 2);

  -[HMDMediaDestinationControllerModel setDestinationModelIdentifier:](v14, "setDestinationModelIdentifier:", v6);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__HMDMediaDestinationControllerBackingStoreHandler_updateDestinationIdentifier_completion___block_invoke;
  v16[3] = &unk_24E79B3A0;
  v16[4] = v9;
  v17 = v7;
  v15 = v7;
  -[HMDBackingStoreHandler runTransactionWithModel:reason:completion:](v9, "runTransactionWithModel:reason:completion:", v14, CFSTR("UpdateDestinationIdentifier"), v16);

}

- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMDMediaDestinationControllerBackingStoreHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationControllerModel *v12;
  void *v13;
  HMDMediaDestinationControllerModel *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationControllerSupportOptionsAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating to supported options: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = [HMDMediaDestinationControllerModel alloc];
  -[HMDMediaDestinationControllerBackingStoreHandler data](v8, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMediaDestinationControllerModel initWithData:changeType:](v12, "initWithData:changeType:", v13, 2);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerModel setSupportedOptions:](v14, "setSupportedOptions:", v15);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__HMDMediaDestinationControllerBackingStoreHandler_updateSupportedOptions_completion___block_invoke;
  v17[3] = &unk_24E79B3A0;
  v17[4] = v8;
  v18 = v6;
  v16 = v6;
  -[HMDBackingStoreHandler runTransactionWithModel:reason:completion:](v8, "runTransactionWithModel:reason:completion:", v14, CFSTR("UpdateSupportedOptions"), v17);

}

- (void)updateAvailableDestinationIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationControllerBackingStoreHandler *v9;
  NSObject *v10;
  void *v11;
  HMDMediaDestinationControllerModel *v12;
  void *v13;
  HMDMediaDestinationControllerModel *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to available destination identifiers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = [HMDMediaDestinationControllerModel alloc];
  -[HMDMediaDestinationControllerBackingStoreHandler data](v9, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMediaDestinationControllerModel initWithData:changeType:](v12, "initWithData:changeType:", v13, 2);

  -[HMDMediaDestinationControllerModel setAvailableDestinationModelIdentifiers:](v14, "setAvailableDestinationModelIdentifiers:", v6);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__HMDMediaDestinationControllerBackingStoreHandler_updateAvailableDestinationIdentifiers_completion___block_invoke;
  v16[3] = &unk_24E79B3A0;
  v16[4] = v9;
  v17 = v7;
  v15 = v7;
  -[HMDBackingStoreHandler runTransactionWithModel:reason:completion:](v9, "runTransactionWithModel:reason:completion:", v14, CFSTR("UpdateAvailableDestinationIdentifiers"), v16);

}

- (void)removeControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerBackingStoreHandler *v6;
  NSObject *v7;
  void *v8;
  HMDMediaDestinationControllerModel *v9;
  void *v10;
  HMDMediaDestinationControllerModel *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing destination controller", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = [HMDMediaDestinationControllerModel alloc];
  -[HMDMediaDestinationControllerBackingStoreHandler data](v6, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDMediaDestinationControllerModel initWithData:changeType:](v9, "initWithData:changeType:", v10, 3);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__HMDMediaDestinationControllerBackingStoreHandler_removeControllerWithCompletion___block_invoke;
  v13[3] = &unk_24E79B3A0;
  v13[4] = v6;
  v14 = v4;
  v12 = v4;
  -[HMDBackingStoreHandler runTransactionWithModel:reason:completion:](v6, "runTransactionWithModel:reason:completion:", v11, CFSTR("MediaDestinationControllerRemoveControllerWithCompletion"), v13);

}

- (void)mergeData:(id)a3
{
  id v4;
  HMMutableMediaDestinationControllerData *v5;
  HMMutableMediaDestinationControllerData *data;
  void *v7;
  HMDMediaDestinationControllerBackingStoreHandler *v8;
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
  if ((-[HMMutableMediaDestinationControllerData isEqual:](self->_data, "isEqual:", v4) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = (HMMutableMediaDestinationControllerData *)objc_msgSend(v4, "mutableCopy");
    data = self->_data;
    self->_data = v5;

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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merged data: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMMediaDestinationControllerData)data
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[HMMutableMediaDestinationControllerData copy](self->_data, "copy");
  os_unfair_lock_unlock(p_lock);
  return (HMMediaDestinationControllerData *)v4;
}

- (void)updateDestinationIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMMutableMediaDestinationControllerData setDestinationIdentifier:](self->_data, "setDestinationIdentifier:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)updateAvailableDestinationIdentifiers:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMMutableMediaDestinationControllerData setAvailableDestinationIdentifiers:](self->_data, "setAvailableDestinationIdentifiers:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)updateSupportedOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableMediaDestinationControllerData setSupportedOptions:](self->_data, "setSupportedOptions:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyDidUpdateDestinationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMediaDestinationControllerBackingStoreHandler *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationControllerBackingStoreHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated destination identifier: %@ delegate: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "mediaDestinationControllerBackingStoreHandler:didUpdateDestinationIdentifier:", v7, v4);

}

- (void)notifyDidUpdateAvailableDestinationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMediaDestinationControllerBackingStoreHandler *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaDestinationControllerBackingStoreHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated available destination identifiers: %@ delegate: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "mediaDestinationControllerBackingStoreHandler:didUpdateAvailableDestinationIdentifiers:", v7, v4);

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaDestinationControllerBackingStoreHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaDestinationControllerBackingStoreHandler *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  HMDMediaDestinationControllerBackingStoreHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDMediaDestinationControllerBackingStoreHandler *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDMediaDestinationControllerBackingStoreHandler *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  HMDMediaDestinationControllerBackingStoreHandler *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
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
    v51 = 138543618;
    v52 = v14;
    v53 = 2112;
    v54 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating media destination controller using transaction object: %@", (uint8_t *)&v51, 0x16u);

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
      objc_msgSend(v21, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreHandler identifier](v12, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if ((v24 & 1) != 0)
      {
        v25 = objc_msgSend(v8, "objectChangeType");
        if (v25 == 1)
        {
          v26 = (void *)MEMORY[0x227676638]();
          v27 = v12;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138543362;
            v52 = v29;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly processing destination controller add after one already exists", (uint8_t *)&v51, 0xCu);

          }
          objc_autoreleasePoolPop(v26);
        }
        objc_msgSend(v21, "setProperties");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "containsObject:", CFSTR("destinationModelIdentifier")))
        {
          objc_msgSend(v21, "destinationModelIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaDestinationControllerBackingStoreHandler transactionObjectUpdatedDestinationIdentifier:message:](v12, "transactionObjectUpdatedDestinationIdentifier:message:", v31, v10);

        }
        if (objc_msgSend(v30, "containsObject:", CFSTR("availableDestinationModelIdentifierStrings")))
        {
          objc_msgSend(v21, "availableDestinationModelIdentifiers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaDestinationControllerBackingStoreHandler transactionObjectUpdatedAvailableDestinationIdentifiers:message:](v12, "transactionObjectUpdatedAvailableDestinationIdentifiers:message:", v32, v10);

        }
        if (objc_msgSend(v30, "containsObject:", CFSTR("supportedOptions")))
        {
          objc_msgSend(v21, "supportedOptions");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaDestinationControllerBackingStoreHandler transactionObjectUpdatedSupportedOptions:message:](v12, "transactionObjectUpdatedSupportedOptions:message:", objc_msgSend(v33, "unsignedIntegerValue"), v10);

        }
        if (v25 == 1)
        {
          -[HMDMediaDestinationControllerBackingStoreHandler delegate](v12, "delegate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x227676638]();
          v36 = v12;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138543874;
            v52 = v38;
            v53 = 2112;
            v54 = v21;
            v55 = 2112;
            v56 = v34;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Notifying of unexpected model add: %@ delegate: %@", (uint8_t *)&v51, 0x20u);

          }
          objc_autoreleasePoolPop(v35);
          objc_msgSend(v34, "mediaDestinationControllerBackingStoreHandlerDidProcessUnexpectedModelAdd:", v36);

        }
        objc_msgSend(v10, "respondWithSuccess");
        goto LABEL_35;
      }
      v46 = (void *)MEMORY[0x227676638]();
      v47 = v12;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uuid");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543618;
        v52 = v49;
        v53 = 2112;
        v54 = v50;
        _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Received unknown media destination controller model with identifier: %@", (uint8_t *)&v51, 0x16u);

      }
      objc_autoreleasePoolPop(v46);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v30);
      -[HMDMediaDestinationControllerBackingStoreHandler metricsEventDispatcher](v47, "metricsEventDispatcher");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v45 = 1;
    }
    else
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v12;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543618;
        v52 = v42;
        v53 = 2112;
        v54 = v8;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media destination controller model from new model object: %@", (uint8_t *)&v51, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v30);
      -[HMDMediaDestinationControllerBackingStoreHandler metricsEventDispatcher](v40, "metricsEventDispatcher");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v45 = 7;
    }
    objc_msgSend(v43, "submitFailureEventWithEventErrorCode:error:", v45, v30);

LABEL_35:
    goto LABEL_36;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = v12;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 138543362;
    v52 = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping due to Home Theater QFA enabled", (uint8_t *)&v51, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
LABEL_36:

}

- (void)transactionObjectUpdatedDestinationIdentifier:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaDestinationControllerBackingStoreHandler *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationControllerBackingStoreHandler data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((HMFEqualObjects() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638](-[HMDMediaDestinationControllerBackingStoreHandler updateDestinationIdentifier:](self, "updateDestinationIdentifier:", v6));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Transaction updated destination identifier: %@ to destination identifier: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v7, "transactionResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markChanged");

    objc_msgSend(v7, "transactionResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "markSaveToAssistant");

    -[HMDMediaDestinationControllerBackingStoreHandler metricsEventDispatcher](v11, "metricsEventDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "submitTransactionUpdatedDestinationEventWithDestinationIdentifier:existingDestinationIdentifier:", v6, v9);

    -[HMDMediaDestinationControllerBackingStoreHandler notifyDidUpdateDestinationIdentifier:](v11, "notifyDidUpdateDestinationIdentifier:", v6);
  }

}

- (void)transactionObjectUpdatedAvailableDestinationIdentifiers:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDMediaDestinationControllerBackingStoreHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaDestinationControllerBackingStoreHandler data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "availableDestinationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToSet:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638](-[HMDMediaDestinationControllerBackingStoreHandler updateAvailableDestinationIdentifiers:](self, "updateAvailableDestinationIdentifiers:", v6));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v16;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Transaction updated available destination identifiers: %@ to identifiers: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v7, "transactionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markChanged");

    objc_msgSend(v7, "transactionResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "markSaveToAssistant");

    -[HMDMediaDestinationControllerBackingStoreHandler notifyDidUpdateAvailableDestinationIdentifiers:](v14, "notifyDidUpdateAvailableDestinationIdentifiers:", v6);
  }

}

- (void)transactionObjectUpdatedSupportedOptions:(unint64_t)a3 message:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDMediaDestinationControllerBackingStoreHandler *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDMediaDestinationControllerBackingStoreHandler data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedOptions");

  if (v8 != a3)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationControllerSupportOptionsAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Transaction updated supported options: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDMediaDestinationControllerBackingStoreHandler updateSupportedOptions:](v10, "updateSupportedOptions:", a3);
    objc_msgSend(v6, "transactionResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markChanged");

  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationControllerBackingStoreHandler *v9;
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove unknown child with model object: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v12);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackingStoreHandler identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaDestinationControllerBackingStoreHandlerDelegate)delegate
{
  return (HMDMediaDestinationControllerBackingStoreHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDMediaDestinationControllerMetricsEventDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetricsEventDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_data, 0);
}

void __83__HMDMediaDestinationControllerBackingStoreHandler_removeControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run remove destination controller transaction completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Run remove destination controller transaction completed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __101__HMDMediaDestinationControllerBackingStoreHandler_updateAvailableDestinationIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run update available destination identifiers transaction completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Run update available destination identifiers transaction completed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__HMDMediaDestinationControllerBackingStoreHandler_updateSupportedOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run update supported options transaction completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Run update supported options transaction completed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __91__HMDMediaDestinationControllerBackingStoreHandler_updateDestinationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run update destination identifier transaction completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Run update destination identifier transaction completed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)backingStoreObjectForData:(id)a3
{
  id v3;
  HMDMediaDestinationControllerModel *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[HMDMediaDestinationControllerModel initWithData:changeType:]([HMDMediaDestinationControllerModel alloc], "initWithData:changeType:", v3, 0);
  objc_msgSend(v3, "availableDestinationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerModel setAvailableDestinationModelIdentifiers:](v4, "setAvailableDestinationModelIdentifiers:", v5);

  objc_msgSend(v3, "destinationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaDestinationControllerModel setDestinationModelIdentifier:](v4, "setDestinationModelIdentifier:", v6);
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1)
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_5636);
  return (id)logCategory__hmf_once_v32;
}

void __63__HMDMediaDestinationControllerBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;

}

@end
