@implementation HMAccessorySettingsMetricsDispatcher

- (HMAccessorySettingsMetricsDispatcher)initWithCoreAnalyticsMetricDispatcher:(id)a3
{
  id v5;
  HMAccessorySettingsMetricsDispatcher *v6;
  HMAccessorySettingsMetricsDispatcher *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *trackingEvents;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessorySettingsMetricsDispatcher;
  v6 = -[HMAccessorySettingsMetricsDispatcher init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_metricEventDispatcher, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackingEvents = v7->_trackingEvents;
    v7->_trackingEvents = v8;

  }
  return v7;
}

- (void)startEventWithMessage:(id)a3 updateKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySettingsMetricsDispatcher *v9;
  NSObject *v10;
  void *v11;
  HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *v12;
  void *v13;
  HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *v14;
  void *v15;
  HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *v16;
  void *v17;
  HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting tracking for event message: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = [HMAccessorySettingsMessageDispatcherStartSendingMessageEvent alloc];
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMAccessorySettingsMessageDispatcherStartSendingMessageEvent initWithMessageName:updateKeyPath:](v12, "initWithMessageName:updateKeyPath:", v13, v7);

  -[HMAccessorySettingsMetricsDispatcher metricEventDispatcher](v9, "metricEventDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendEvent:", v14);

  v16 = [HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent alloc];
  objc_msgSend(v6, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent initWithMessageName:](v16, "initWithMessageName:", v17);

  objc_msgSend(v6, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsMetricsDispatcher startTrackingEvent:withEventIdentifier:](v9, "startTrackingEvent:withEventIdentifier:", v18, v19);

}

- (void)submitEventWithMessage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySettingsMetricsDispatcher *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessorySettingsMetricsDispatcher *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
    v19 = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Submitting tracking for event message: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsMetricsDispatcher finishTrackingEventWithIdentifier:](v9, "finishTrackingEventWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "setError:", v7);
    -[HMAccessorySettingsMetricsDispatcher metricEventDispatcher](v9, "metricEventDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendEvent:", v13);

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get tracked fetch event with message: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)startTrackingEvent:(id)a3 withEventIdentifier:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "start");
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackingEvents, "setObject:forKeyedSubscript:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)finishTrackingEventWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackingEvents, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackingEvents, "setObject:forKeyedSubscript:", 0, v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
    objc_msgSend(v5, "finish");

  return v5;
}

- (HMCoreAnalyticsMetricEventDispatcher)metricEventDispatcher
{
  return (HMCoreAnalyticsMetricEventDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricEventDispatcher, 0);
  objc_storeStrong((id *)&self->_trackingEvents, 0);
}

@end
