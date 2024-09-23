@implementation MPCAMSEngagementEventConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/AMSEngagement");
}

- (void)subscribeToEventStream:(id)a3
{
  id v5;
  id v6;
  void *v7;
  AMSEngagement *v8;
  AMSEngagement *engagement;
  uint64_t v10;
  MPCPlaybackEngineEventStreamSubscription *subscription;
  MPCPlaybackEngineEventStreamSubscription *v12;
  MPCPlaybackEngineEventStreamSubscription *v13;
  MPCPlaybackEngineEventStreamSubscription *v14;
  MPCPlaybackEngineEventStreamSubscription *v15;
  MPCPlaybackEngineEventStreamSubscription *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BE08148]);
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("Music"), CFSTR("1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (AMSEngagement *)objc_msgSend(v6, "initWithBag:", v7);
  engagement = self->_engagement;
  self->_engagement = v8;

  v10 = MEMORY[0x24BDAC760];
  subscription = self->_subscription;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke;
  v22[3] = &unk_24CAB94A0;
  v22[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](subscription, "subscribeToEventType:handler:", CFSTR("item-resume"), v22);
  v12 = self->_subscription;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_2;
  v21[3] = &unk_24CAB94A0;
  v21[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v12, "subscribeToEventType:handler:", CFSTR("item-position-jump"), v21);
  v13 = self->_subscription;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_3;
  v20[3] = &unk_24CAB94A0;
  v20[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v13, "subscribeToEventType:handler:", CFSTR("item-pause"), v20);
  v14 = self->_subscription;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_4;
  v19[3] = &unk_24CAB94A0;
  v19[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v14, "subscribeToEventType:handler:", CFSTR("item-end"), v19);
  v15 = self->_subscription;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_5;
  v18[3] = &unk_24CAB94A0;
  v18[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v15, "subscribeToEventType:handler:", CFSTR("application-termination"), v18);
  v16 = self->_subscription;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_6;
  v17[3] = &unk_24CAB94A0;
  v17[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v16, "subscribeToEventType:handler:", CFSTR("remote-control-begin"), v17);

}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;
  AMSEngagement *engagement;

  subscription = self->_subscription;
  self->_subscription = 0;

  engagement = self->_engagement;
  self->_engagement = 0;

}

- (BOOL)_enqueueDataForPlaybackChangingEvent:(id)a3 cursor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  _QWORD v60[2];
  const __CFString *v61;
  uint64_t v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v6);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = objc_claimAutoreleasedReturnValue();

  v70[0] = CFSTR("device-changed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithTypes:matchingPayload:", v12, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)v11;
  v44 = (void *)v9;
  if (v9)
  {
    v68 = CFSTR("queue-section-id");
    v69 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v66 = CFSTR("queue-section-id");
    v67 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v15);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v64[0] = CFSTR("queue-section-id");
      v64[1] = CFSTR("queue-item-id");
      v65[0] = v9;
      v65[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v16);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v46 = 0;
    }
    v18 = v7;
    v17 = (void *)v14;
  }
  else
  {
    v46 = 0;
    v47 = 0;
    v17 = 0;
    v18 = v7;
  }
  objc_msgSend(v17, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("account-id"));
  v20 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v20;
  if (v20)
  {
    v63[0] = CFSTR("account-begin");
    v63[1] = CFSTR("account-update");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = CFSTR("account-id");
    v62 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "findPreviousEventWithTypes:matchingPayload:", v21, v22);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v17, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("queue-delegated-account-id"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v60[0] = CFSTR("account-update");
    v60[1] = CFSTR("account-begin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = CFSTR("account-id");
    v59 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "findPreviousEventWithTypes:matchingPayload:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v48);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v28, CFSTR("device"));

  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v29, CFSTR("queue-add"));

  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v30, CFSTR("container-begin"));

  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v46);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v31, CFSTR("item-begin"));

  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v32, CFSTR("account"));

  -[MPCAMSEngagementEventConsumer _JSONEncodableEvent:](self, "_JSONEncodableEvent:", v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v33, CFSTR("enqueuer-account"));

  objc_msgSend(v49, "setObject:forKeyedSubscript:", v41, CFSTR("related-events"));
  MPCPlaybackEngineEventPayloadJSONFromPayload(v49);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Engagement_Oversize");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v53 = objc_opt_class();
    v54 = 2114;
    v55 = v36;
    v56 = 2114;
    v57 = v34;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: started enqueueing event with id: %{public}@\nEvent: %{public}@", buf, 0x20u);
  }

  -[AMSEngagement enqueueData:](self->_engagement, "enqueueData:", v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __77__MPCAMSEngagementEventConsumer__enqueueDataForPlaybackChangingEvent_cursor___block_invoke;
  v50[3] = &unk_24CAB6FB0;
  v50[4] = self;
  v51 = v36;
  v39 = v36;
  objc_msgSend(v38, "addFinishBlock:", v50);

  return 1;
}

- (id)_JSONEncodableEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDBCED8];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("event-type"));

    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("time"));

    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("id"));

    objc_msgSend(v4, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("payload"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CB172D0, CFSTR("meta"));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (AMSEngagement)engagement
{
  return self->_engagement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagement, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

void __77__MPCAMSEngagementEventConsumer__enqueueDataForPlaybackChangingEvent_cursor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Engagement");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Finished enqueueing event with id: %{public}@. error=%{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished enqueueing event with id: %{public}@.", (uint8_t *)&v12, 0x16u);
  }

}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueDataForPlaybackChangingEvent:cursor:", a2, a3);
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueDataForPlaybackChangingEvent:cursor:", a2, a3);
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueDataForPlaybackChangingEvent:cursor:", a2, a3);
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueDataForPlaybackChangingEvent:cursor:", a2, a3);
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueDataForPlaybackChangingEvent:cursor:", a2, a3);
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueDataForPlaybackChangingEvent:cursor:", a2, a3);
}

@end
