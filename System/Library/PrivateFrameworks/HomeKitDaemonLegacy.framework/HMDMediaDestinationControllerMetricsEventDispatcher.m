@implementation HMDMediaDestinationControllerMetricsEventDispatcher

- (HMDMediaDestinationControllerMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDMediaDestinationControllerMetricsEventDispatcher *v12;
  HMDMediaDestinationControllerMetricsEventDispatcher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDMediaDestinationControllerMetricsEventDispatcher;
  v12 = -[HMDMediaDestinationControllerMetricsEventDispatcher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_logEventSubmitter, a4);
    objc_storeWeak((id *)&v13->_dataSource, v11);
  }

  return v13;
}

- (void)submitReceivedUpdateDestinationRequestMessageEventWithDestinationIdentifier:(id)a3 existingDestinationIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent *v10;
  void *v11;
  id v12;

  v6 = a3;
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceDestinationTypeWithIdentifier:](self, "dataSourceDestinationTypeWithIdentifier:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceDestinationTypeWithIdentifier:](self, "dataSourceDestinationTypeWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceIsTriggeredOnControllerDevice](self, "dataSourceIsTriggeredOnControllerDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceCurrentUserPrivilege](self, "dataSourceCurrentUserPrivilege");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent initWithExistingDestinationType:destinationType:isTriggeredOnControllerDevice:userPrivilege:]([HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent alloc], "initWithExistingDestinationType:destinationType:isTriggeredOnControllerDevice:userPrivilege:", v12, v7, v8, v9);
  -[HMDMediaDestinationControllerMetricsEventDispatcher logEventSubmitter](self, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitLogEvent:", v10);

}

- (void)submitTransactionUpdatedDestinationEventWithDestinationIdentifier:(id)a3 existingDestinationIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaDestinationControllerTransactionUpdatedDestinationLogEvent *v10;
  void *v11;
  id v12;

  v6 = a3;
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceDestinationTypeWithIdentifier:](self, "dataSourceDestinationTypeWithIdentifier:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceDestinationTypeWithIdentifier:](self, "dataSourceDestinationTypeWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceIsTriggeredOnControllerDevice](self, "dataSourceIsTriggeredOnControllerDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceCurrentUserPrivilege](self, "dataSourceCurrentUserPrivilege");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDMediaDestinationControllerTransactionUpdatedDestinationLogEvent initWithExistingDestinationType:destinationType:isTriggeredOnControllerDevice:userPrivilege:]([HMDMediaDestinationControllerTransactionUpdatedDestinationLogEvent alloc], "initWithExistingDestinationType:destinationType:isTriggeredOnControllerDevice:userPrivilege:", v12, v7, v8, v9);
  -[HMDMediaDestinationControllerMetricsEventDispatcher logEventSubmitter](self, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitLogEvent:", v10);

}

- (void)submitFailureEventWithEventErrorCode:(unint64_t)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaDestinationControllerFailureLogEvent *v14;
  void *v15;
  __CFString *v16;

  v6 = a4;
  if (a3 > 0xB)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E89AA340[a3];
  v16 = v7;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceIsTriggeredOnControllerDevice](self, "dataSourceIsTriggeredOnControllerDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceCurrentUserPrivilege](self, "dataSourceCurrentUserPrivilege");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMediaDestinationControllerFailureLogEvent initWithDestinationControllerErrorCode:errorCode:errorDomain:isTriggeredOnControllerDevice:userPrivilege:]([HMDMediaDestinationControllerFailureLogEvent alloc], "initWithDestinationControllerErrorCode:errorCode:errorDomain:isTriggeredOnControllerDevice:userPrivilege:", v16, v10, v11, v12, v13);
  -[HMDMediaDestinationControllerMetricsEventDispatcher logEventSubmitter](self, "logEventSubmitter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitLogEvent:", v14);

}

- (void)startStagedDestinationIdentifierCommittedEventWithStagedDestinationIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMetricsEventDispatcher *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *v11;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *trackedStagedDestinationIdentifierEvent;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Tracking staged destination identifier: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceIsTriggeredOnControllerDevice](v6, "dataSourceIsTriggeredOnControllerDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceCurrentUserPrivilege](v6, "dataSourceCurrentUserPrivilege");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent initWithStagedDestinationIdentifier:isTriggeredOnControllerDevice:userPrivilege:]([HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent alloc], "initWithStagedDestinationIdentifier:isTriggeredOnControllerDevice:userPrivilege:", v4, v9, v10);
  os_unfair_lock_lock_with_options();
  trackedStagedDestinationIdentifierEvent = v6->_trackedStagedDestinationIdentifierEvent;
  v6->_trackedStagedDestinationIdentifierEvent = v11;

  os_unfair_lock_unlock(&v6->_lock);
}

- (void)submitStagedDestinationIdentifierCommittedEventWithCommittedDestinationIdentifier:(id)a3
{
  id v4;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *v5;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *v6;
  void *v7;
  char v8;
  HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *trackedStagedDestinationIdentifierEvent;
  void *v10;
  HMDMediaDestinationControllerMetricsEventDispatcher *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDMediaDestinationControllerMetricsEventDispatcher *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = self->_trackedStagedDestinationIdentifierEvent;
  v6 = v5;
  if (v5
    && (-[HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent stagedDestinationIdentifier](v5, "stagedDestinationIdentifier"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = HMFEqualObjects(), v7, (v8 & 1) != 0))
  {
    trackedStagedDestinationIdentifierEvent = self->_trackedStagedDestinationIdentifierEvent;
    self->_trackedStagedDestinationIdentifierEvent = 0;

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@submitting staged destination identifier committed event with committed destination identifier: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDMediaDestinationControllerMetricsEventDispatcher logEventSubmitter](v11, "logEventSubmitter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "submitLogEvent:", v6);

  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping staged destination identifier committed event due to out-dated information", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)submitDailySetDestinationEvent
{
  void *v3;
  HMDMediaDestinationControllerMetricsEventDispatcher *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaDestinationControllerDailySetDestinationEvent *v10;
  void *v11;
  void *v12;
  HMDMediaDestinationControllerMetricsEventDispatcher *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting daily set destination event", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSource](v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v4;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v15;
      v16 = "%{public}@Failed to submit daily set destination event due to no data source";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 12;
LABEL_10:
      _os_log_impl(&dword_1CD062000, v17, v18, v16, (uint8_t *)&v20, v19);

    }
LABEL_11:

    objc_autoreleasePoolPop(v12);
    goto LABEL_12;
  }
  if ((objc_msgSend(v7, "isTriggeredOnControllerDeviceForMediaDestinationControllerMetricsEventDispatcher:", v4) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v4;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      v16 = "%{public}@Skipping daily set destination event due to event not triggered on the controller provided by data source: %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_INFO;
      v19 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceCurrentDestinationType](v4, "dataSourceCurrentDestinationType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDMediaDestinationControllerDailySetDestinationEvent initWithExistingDestinationType:]([HMDMediaDestinationControllerDailySetDestinationEvent alloc], "initWithExistingDestinationType:", v9);
  -[HMDMediaDestinationControllerMetricsEventDispatcher logEventSubmitter](v4, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitLogEvent:", v10);

LABEL_12:
}

- (id)dataSourceCurrentUserPrivilege
{
  void *v2;
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;

  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSourceCurrentUser](self, "dataSourceCurrentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "privilege");
    if (v4 > 4)
      v5 = CFSTR("None");
    else
      v5 = off_1E89BB648[v4];
    v6 = v5;
  }
  else
  {
    v6 = CFSTR("NotSet");
  }

  return v6;
}

- (id)dataSourceCurrentUser
{
  void *v3;
  void *v4;
  void *v5;
  HMDMediaDestinationControllerMetricsEventDispatcher *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUserForMediaDestinationControllerMetricsEventDispatcher:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from data source: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

  return v4;
}

- (id)dataSourceCurrentDestinationType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  HMDMediaDestinationControllerMetricsEventDispatcher *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentDestinationTypeForMediaDestinationControllerMetricsEventDispatcher:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "integerValue");
      HMMediaDestinationTypeAsString();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("NotSet");
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current destination type due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    HMMediaDestinationTypeAsString();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)dataSourceDestinationTypeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  HMDMediaDestinationControllerMetricsEventDispatcher *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDMediaDestinationControllerMetricsEventDispatcher dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:", self, v4);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination type due to no data source", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }
    HMMediaDestinationTypeAsString();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("NotSet");
  }

  return v7;
}

- (id)dataSourceIsTriggeredOnControllerDevice
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  HMDMediaDestinationControllerMetricsEventDispatcher *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDMediaDestinationControllerMetricsEventDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "isTriggeredOnControllerDeviceForMediaDestinationControllerMetricsEventDispatcher:", self);
    HMFBooleanToString();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get is triggered on controller device due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = CFSTR("NotSet");
  }

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationControllerMetricsEventDispatcher identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaDestinationControllerMetricsEventDispatcherDataSource)dataSource
{
  return (HMDMediaDestinationControllerMetricsEventDispatcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent)trackedStagedDestinationIdentifierEvent
{
  return (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTrackedStagedDestinationIdentifierEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedStagedDestinationIdentifierEvent, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12 != -1)
    dispatch_once(&logCategory__hmf_once_t12, &__block_literal_global_42044);
  return (id)logCategory__hmf_once_v13;
}

void __66__HMDMediaDestinationControllerMetricsEventDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13;
  logCategory__hmf_once_v13 = v0;

}

@end
