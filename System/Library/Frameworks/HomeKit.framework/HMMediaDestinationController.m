@implementation HMMediaDestinationController

- (HMMediaDestinationController)initWithControllerData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMMediaDestinationController *v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "supportedOptions");
  objc_msgSend(v4, "availableDestinationIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMMediaDestinationController initWithIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:](self, "initWithIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v5, v6, v7, v8);
  return v9;
}

- (HMMediaDestinationController)initWithIdentifier:(id)a3 destinationIdentifier:(id)a4 supportedOptions:(unint64_t)a5 availableDestinationIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMediaDestinationController *v15;
  HMMediaDestinationController *v16;
  uint64_t v17;
  NSString *lastNotifiedDestinationIdentifier;
  HMMediaDestinationController *v20;
  SEL v21;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_7:
    v20 = (HMMediaDestinationController *)_HMFPreconditionFailure();
    return (HMMediaDestinationController *)-[HMMediaDestinationController supportsSameRoomB620Destinations](v20, v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)HMMediaDestinationController;
  v15 = -[HMMediaDestinationController init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_destinationIdentifier, a4);
    objc_msgSend(v12, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    lastNotifiedDestinationIdentifier = v16->_lastNotifiedDestinationIdentifier;
    v16->_lastNotifiedDestinationIdentifier = (NSString *)v17;

    v16->_supportedOptions = a5;
    objc_storeStrong((id *)&v16->_availableDestinationIdentifiers, a6);
  }

  return v16;
}

- (BOOL)supportsSameRoomB620Destinations
{
  return (-[HMMediaDestinationController supportedOptions](self, "supportedOptions") >> 2) & 1;
}

- (void)updateDestination:(id)a3 completionHandler:(id)a4
{
  -[HMMediaDestinationController updateDestination:options:completionHandler:](self, "updateDestination:options:completionHandler:", a3, 0, a4);
}

- (void)updateDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMMediaDestinationController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMMediaDestinationController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMMediaDestinationController *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, void *);
  void *v38;
  HMMediaDestinationController *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationControllerUpateOptionsAsString(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v13;
    v43 = 2112;
    v44 = v8;
    v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending update destination message with destination: %@ options: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMMediaDestinationController context](v11, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v8)
      +[HMMediaDestination payloadForDestination:options:](HMMediaDestination, "payloadForDestination:options:", v8, a4);
    else
      +[HMMediaDestination payloadForNullDestination](HMMediaDestination, "payloadForNullDestination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v17;
    if (v17)
    {
      v23 = (void *)objc_msgSend(v17, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("HMMediaDestinationControllerUpdateOptionsPayloadKey"));

      v25 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMMediaDestinationController identifier](v11, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithTarget:", v26);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMMediaDestinationControllerUpdateDestinationRequestMessage"), v27, v23);
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __76__HMMediaDestinationController_updateDestination_options_completionHandler___block_invoke;
      v38 = &unk_1E3AB59B8;
      v39 = v11;
      v40 = v9;
      objc_msgSend(v28, "setResponseHandler:", &v35);
      v29 = (void *)objc_msgSend(v28, "copy", v35, v36, v37, v38, v39);
      objc_msgSend(v16, "sendMessage:", v29);

    }
    else
    {
      v30 = (void *)MEMORY[0x1A1AC1AAC]();
      v31 = v11;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        HMMediaDestinationControllerUpateOptionsAsString(a4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v33;
        v43 = 2112;
        v44 = v8;
        v45 = 2112;
        v46 = v34;
        _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination payload for destination: %@ options: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaDestinationController callCompletionHandler:error:](v31, "callCompletionHandler:error:", v9, v23);
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v11;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v21;
      v43 = 2112;
      v44 = v15;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination due to no message dispatcher given by context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaDestinationController callCompletionHandler:error:](v19, "callCompletionHandler:error:", v9, v22);
  }

}

- (void)configureWithContext:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMediaDestinationController *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  HMMediaDestinationController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v11;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring destination controller: %@ context: %@ data source: %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMediaDestinationController setContext:](v9, "setContext:", v6);
  -[HMMediaDestinationController setDataSource:](v9, "setDataSource:", v7);
  -[HMMediaDestinationController configureLastNotifiedDestinationIdentifier](v9, "configureLastNotifiedDestinationIdentifier");

}

- (void)configureLastNotifiedDestinationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  HMMediaDestinationController *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMMediaDestinationController destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioDestinationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationController lastNotifiedDestinationIdentifier](self, "lastNotifiedDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring last notified destination identifier: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMMediaDestinationController setLastNotifiedDestinationIdentifier:](v8, "setLastNotifiedDestinationIdentifier:", v4);
  }

}

- (void)unconfigure
{
  -[HMMediaDestinationController setContext:](self, "setContext:", 0);
}

- (NSArray)availableDestinationIdentifiers
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_availableDestinationIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAvailableDestinationIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *availableDestinationIdentifiers;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  availableDestinationIdentifiers = self->_availableDestinationIdentifiers;
  self->_availableDestinationIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)destinationIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_destinationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDestinationIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *destinationIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  destinationIdentifier = self->_destinationIdentifier;
  self->_destinationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMMediaDestination)destination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMMediaDestinationController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMMediaDestinationController *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMMediaDestinationController destinationIdentifier](self, "destinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMMediaDestinationController dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "mediaDestinationController:destinationWithIdentifier:", self, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        v13 = (void *)MEMORY[0x1A1AC1AAC]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v16;
          v20 = 2112;
          v21 = v3;
          v22 = 2112;
          v23 = v5;
          _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination with identifier: %@ from data source: %@", (uint8_t *)&v18, 0x20u);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v12;
        v20 = 2112;
        v21 = v3;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@No data source set to get destination with identifier: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (HMMediaDestination *)v7;
}

- (NSArray)availableDestinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMMediaDestinationController *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  HMMediaDestinationController *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMMediaDestinationController availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMMediaDestinationController availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__HMMediaDestinationController_availableDestinations__block_invoke;
    v12[3] = &unk_1E3AAE188;
    v13 = v4;
    v14 = self;
    objc_msgSend(v5, "na_map:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@No data source set to get available destinations with identifiers: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (void)callCompletionHandler:(id)a3
{
  -[HMMediaDestinationController callCompletionHandler:error:](self, "callCompletionHandler:error:", a3, 0);
}

- (void)callCompletionHandler:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMediaDestinationController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMMediaDestinationController *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMMediaDestinationController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "callCompletion:error:", v6, v7);
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no delegate caller given by context: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no handler provided", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)notifyDidUpdateDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMMediaDestinationController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__HMMediaDestinationController_notifyDidUpdateDestination__block_invoke;
    v10[3] = &unk_1E3AB5E18;
    v10[4] = self;
    objc_msgSend(v4, "invokeBlock:", v10);
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated destination due to no delegate caller given by context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_notifyDidUpdateDestination
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HMMediaDestinationController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMediaDestinationController *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMMediaDestinationController destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationController lastNotifiedDestinationIdentifier](self, "lastNotifiedDestinationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaDestinationController lastNotifiedDestinationIdentifier](v8, "lastNotifiedDestinationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Skipping notifying of update destination due to matching destination identifiers: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(v3, "audioDestinationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaDestinationController setLastNotifiedDestinationIdentifier:](self, "setLastNotifiedDestinationIdentifier:", v12);

    -[HMMediaDestinationController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v17;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying client did update destination: %@ delegate: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "mediaDestinationController:didUpdateDestination:", v15, v3);

  }
}

- (void)notifyDidUpdateAvailableDestinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMMediaDestinationController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__HMMediaDestinationController_notifyDidUpdateAvailableDestinations__block_invoke;
    v10[3] = &unk_1E3AB5E18;
    v10[4] = self;
    objc_msgSend(v4, "invokeBlock:", v10);
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated available destinations due to no delegate caller given by context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (BOOL)availableDestinationIdentifiersIsEqualToIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMMediaDestinationController availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__HMMediaDestinationController_availableDestinationIdentifiersIsEqualToIdentifiers___block_invoke;
    v9[3] = &unk_1E3AB0478;
    v10 = v5;
    v7 = objc_msgSend(v4, "na_allObjectsPassTest:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  HMMediaDestinationController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  HMMediaDestinationController *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  HMMediaDestinationController *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *availableDestinationIdentifiers;
  NSUUID *v40;
  NSUUID *destinationIdentifier;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v21;
      v51 = 2112;
      v52 = v4;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge new media destination controller using new object: %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  -[HMMediaDestinationController identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if ((v9 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaDestinationController identifier](v19, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v22;
      v51 = 2112;
      v52 = v23;
      v53 = 2112;
      v54 = v24;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge new media destination controller with identifier: %@ due to existing identifier: %@", buf, 0x20u);

    }
LABEL_14:

    objc_autoreleasePoolPop(v18);
    v25 = 0;
    goto LABEL_27;
  }
  -[HMMediaDestinationController destinationIdentifier](self, "destinationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_15;
  -[HMMediaDestinationController lastNotifiedDestinationIdentifier](self, "lastNotifiedDestinationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HMFEqualObjects();

  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
LABEL_15:
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "destinationIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v29;
      v51 = 2112;
      v52 = v30;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Merging new media destination controller destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v17 = 1;
  }
  objc_msgSend(v6, "availableDestinationIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HMMediaDestinationController availableDestinationIdentifiersIsEqualToIdentifiers:](self, "availableDestinationIdentifiersIsEqualToIdentifiers:", v31);

  if (!v32)
  {
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "availableDestinationIdentifiers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v36;
      v51 = 2112;
      v52 = v37;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@Merging new media destination controller available destinations: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
  }
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "availableDestinationIdentifiers");
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableDestinationIdentifiers = self->_availableDestinationIdentifiers;
  self->_availableDestinationIdentifiers = v38;

  objc_msgSend(v6, "destinationIdentifier");
  v40 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  destinationIdentifier = self->_destinationIdentifier;
  self->_destinationIdentifier = v40;

  os_unfair_lock_unlock(&self->_lock);
  -[HMMediaDestinationController mergeSupportedOptionsWithNewController:](self, "mergeSupportedOptionsWithNewController:", v6);
  if ((v17 & 1) != 0)
  {
    -[HMMediaDestinationController context](self, "context");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "queue");
    v43 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMMediaDestinationController_mergeFromNewObject___block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v43, block);

  }
  if (!v32)
  {
    -[HMMediaDestinationController context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "queue");
    v45 = objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __51__HMMediaDestinationController_mergeFromNewObject___block_invoke_2;
    v47[3] = &unk_1E3AB5E18;
    v47[4] = self;
    dispatch_async(v45, v47);

  }
  v25 = v17 | !v32;
LABEL_27:

  return v25;
}

- (void)mergeSupportedOptionsWithNewController:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  HMMediaDestinationController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMMediaDestinationController supportedOptions](self, "supportedOptions");
  if (v5 != objc_msgSend(v4, "supportedOptions"))
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationControllerSupportOptionsAsString(objc_msgSend(v4, "supportedOptions"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Merging supported options: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMMediaDestinationController setSupportedOptions:](v7, "setSupportedOptions:", objc_msgSend(v4, "supportedOptions"));
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaDestinationController identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationController identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationController destinationIdentifier](self, "destinationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("destinationIdentifier"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  HMMediaDestinationControllerSupportOptionsAsString(-[HMMediaDestinationController supportedOptions](self, "supportedOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("supportedOptions"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationController availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("availableDestinationIdentifiers"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaDestinationController *v4;
  HMMediaDestinationController *v5;
  HMMediaDestinationController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMMediaDestinationController *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMMediaDestinationController identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaDestinationController identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMMediaDestinationController availableDestinationIdentifiers](v6, "availableDestinationIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[HMMediaDestinationController availableDestinationIdentifiersIsEqualToIdentifiers:](self, "availableDestinationIdentifiersIsEqualToIdentifiers:", v9))
        {
          -[HMMediaDestinationController destinationIdentifier](self, "destinationIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMediaDestinationController destinationIdentifier](v6, "destinationIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaDestinationController identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMMediaDestinationControllerDelegate)delegate
{
  return (HMMediaDestinationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMMediaDestinationControllerDataSource)dataSource
{
  return (HMMediaDestinationControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (NSString)lastNotifiedDestinationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastNotifiedDestinationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotifiedDestinationIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_availableDestinationIdentifiers, 0);
}

uint64_t __51__HMMediaDestinationController_mergeFromNewObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDidUpdateDestination");
}

uint64_t __51__HMMediaDestinationController_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDidUpdateAvailableDestinations");
}

uint64_t __84__HMMediaDestinationController_availableDestinationIdentifiersIsEqualToIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __68__HMMediaDestinationController_notifyDidUpdateAvailableDestinations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling did update available destinations for delegate: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "mediaDestinationControllerDidUpdateAvailableDestinations:", *(_QWORD *)(a1 + 32));

}

uint64_t __58__HMMediaDestinationController_notifyDidUpdateDestination__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDidUpdateDestination");
}

id __53__HMMediaDestinationController_availableDestinations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mediaDestinationController:destinationWithIdentifier:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination with identifier: %@ from data source: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }

  return v4;
}

void __76__HMMediaDestinationController_updateDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update destination message responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:error:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update destination message succeeded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1)
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global_6853);
  return (id)logCategory__hmf_once_v30;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __43__HMMediaDestinationController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30;
  logCategory__hmf_once_v30 = v0;

}

@end
