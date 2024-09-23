@implementation GDInternalViewUpdateNotificationSubscription

- (id)initForViewName:(id)a3 systemwideUniqueSubscriptionIdentifier:(id)a4 useCase:(id)a5 targetQueue:(id)a6 onReceiveUpdateNotificationBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GDInternalViewUpdateNotificationSubscription *v16;
  id v17;
  const char *v18;
  BMBiomeScheduler *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  BMBiomeScheduler *scheduler;
  BMBiomeScheduler *v39;
  BPSSink *sink;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  objc_super v47;

  v44 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v47.receiver = self;
  v47.super_class = (Class)GDInternalViewUpdateNotificationSubscription;
  v16 = -[GDInternalViewUpdateNotificationSubscription init](&v47, sel_init);
  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D025E0]);
    v19 = (BMBiomeScheduler *)objc_msgSend_initWithIdentifier_targetQueue_(v17, v18, (uint64_t)v12, v14);
    BiomeLibrary();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IntelligencePlatform(v20, v21, v22);
    v43 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_Views(v23, v24, v25);
    v42 = v14;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_Updated(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_DSLPublisherWithUseCase_(v29, v30, (uint64_t)v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filterWithKeyPath_value_(v31, v32, (uint64_t)CFSTR("eventBody.viewName"), v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subscribeOn_(v33, v34, (uint64_t)v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1AE8FC3E4;
    v45[3] = &unk_1E5DD94B8;
    v46 = v15;
    objc_msgSend_sinkWithCompletion_receiveInput_(v35, v36, (uint64_t)&unk_1E5DD9490, v45);
    v37 = objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v16->_targetQueue, a6);
    scheduler = v16->_scheduler;
    v16->_scheduler = v19;
    v39 = v19;

    v14 = v42;
    sink = v16->_sink;
    v16->_sink = (BPSSink *)v37;

    v12 = v43;
  }

  return v16;
}

- (void)cancelSubscription
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sink(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v5, v3, v4);

}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end
