@implementation HMAudioAnalysisLastKnownEventSubscriber

- (HMAudioAnalysisLastKnownEventSubscriber)initWithContext:(id)a3 subscriptionProvider:(id)a4 dataSource:(id)a5 workQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMAudioAnalysisLastKnownEventSubscriber *v15;
  HMAudioAnalysisLastKnownEventSubscriber *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMAudioAnalysisLastKnownEventSubscriber;
  v15 = -[HMAudioAnalysisLastKnownEventSubscriber init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeWeak((id *)&v16->_subscriptionProvider, v12);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    objc_storeStrong((id *)&v16->_workQueue, a6);
  }

  return v16;
}

- (NSUUID)homeIdentifier
{
  void *v2;
  void *v3;

  -[HMAudioAnalysisLastKnownEventSubscriber dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)subscribeLastKnownEventsForAccessory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAudioAnalysisLastKnownEventSubscriber *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAudioAnalysisLastKnownEventSubscriber dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryUUIDForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMAudioAnalysisAggregateEventBulletin topicWithAccessoryUUID:homeUUID:](HMAudioAnalysisAggregateEventBulletin, "topicWithAccessoryUUID:homeUUID:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMAudioAnalysisLastKnownEventSubscriber subscriptionProvider](self, "subscriptionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke;
    v18[3] = &unk_1E3AB1D88;
    v18[4] = self;
    v19 = v7;
    objc_msgSend(v12, "registerConsumer:topicFilters:completion:", self, v13, v18);

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@accessory identifier invalid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }

}

- (void)_didReceiveEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  HMAudioAnalysisLastKnownEventSubscriber *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAudioAnalysisLastKnownEventSubscriber *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HMAudioAnalysisLastKnownEventSubscriber *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAudioAnalysisLastKnownEventSubscriber workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v27 = 0;
  +[HMAudioAnalysisAggregateEventBulletin decodeBulletinsFromEvent:error:](HMAudioAnalysisAggregateEventBulletin, "decodeBulletinsFromEvent:error:", v4, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@unable to decode bulletin event with :%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  -[HMAudioAnalysisLastKnownEventSubscriber delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bulletins");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v17;
    v30 = 2112;
    v31 = v18;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updates with events: %@ delegate: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMAudioAnalysisLastKnownEventSubscriber context](v15, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegateCaller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __60__HMAudioAnalysisLastKnownEventSubscriber__didReceiveEvent___block_invoke;
  v23[3] = &unk_1E3AB5CD0;
  v24 = v13;
  v25 = v15;
  v26 = v6;
  v21 = v6;
  v22 = v13;
  objc_msgSend(v20, "invokeBlock:", v23);

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[HMAudioAnalysisLastKnownEventSubscriber workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HMAudioAnalysisLastKnownEventSubscriber_didReceiveEvent_topic___block_invoke;
  v8[3] = &unk_1E3AB5ED8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[HMAudioAnalysisLastKnownEventSubscriber workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMAudioAnalysisLastKnownEventSubscriber_didReceiveCachedEvent_topic_source___block_invoke;
  block[3] = &unk_1E3AB5CD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (HMAudioAnalysisLastKnownEventSubscriberDelegate)delegate
{
  return (HMAudioAnalysisLastKnownEventSubscriberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_loadWeakRetained((id *)&self->_subscriptionProvider);
}

- (HMAudioAnalysisLastKnownEventSubscriberDataSource)dataSource
{
  return (HMAudioAnalysisLastKnownEventSubscriberDataSource *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_subscriptionProvider);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __78__HMAudioAnalysisLastKnownEventSubscriber_didReceiveCachedEvent_topic_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveEvent:topic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __65__HMAudioAnalysisLastKnownEventSubscriber_didReceiveEvent_topic___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveEvent:", *(_QWORD *)(a1 + 40));
}

void __60__HMAudioAnalysisLastKnownEventSubscriber__didReceiveEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "bulletins");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subscriber:didUpdateBulletins:", v3, v4);

  }
}

void __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Subscribe changed topics with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribe changed topics, received cached events %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_3;
      block[3] = &unk_1E3AB5ED8;
      v15 = v5;
      v16 = *(_QWORD *)(a1 + 32);
      v25 = v15;
      v26 = v16;
      dispatch_async(v14, block);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegateCaller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_5;
  v21[3] = &unk_1E3AB60A0;
  v19 = *(id *)(a1 + 40);
  v22 = v6;
  v23 = v19;
  v20 = v6;
  objc_msgSend(v18, "invokeBlock:", v21);

}

uint64_t __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_2;
  v3[3] = &unk_1E3AB1D60;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveEvent:");
}

@end
