@implementation HKHeadphoneAudioExposureControl

- (HKHeadphoneAudioExposureControl)initWithHealthStore:(id)a3
{
  id v4;
  HKHeadphoneAudioExposureControl *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  HKHeadphoneAudioExposureControl *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHeadphoneAudioExposureControl;
  v5 = -[HKHeadphoneAudioExposureControl init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v11 = v5;
  }

  return v5;
}

- (void)rebuildWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke;
  v10[3] = &unk_24D7BD798;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke_2;
  v8[3] = &unk_24D7BD7C0;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_rebuildWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInfoWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke;
  v10[3] = &unk_24D7BD798;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke_2;
  v8[3] = &unk_24D7BD7C0;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchInfoWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)insertQuantityWithExposure:(double)a3 duration:(double)a4 startDate:(id)a5 includesNotificationSample:(BOOL)a6 synced:(BOOL)a7 completion:(id)a8
{
  id v14;
  void *v15;
  HKProxyProvider *proxyProvider;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  BOOL v27;
  BOOL v28;

  v14 = a5;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke;
  v22[3] = &unk_24D7BD7E8;
  v25 = a3;
  v26 = a4;
  v23 = v14;
  v27 = a6;
  v28 = a7;
  v24 = v15;
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke_2;
  v20[3] = &unk_24D7BD7C0;
  v21 = v24;
  v18 = v24;
  v19 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertQuantityWithExposure:duration:startDate:includesNotificationSample:synced:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDoseLimitInfoWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke;
  v10[3] = &unk_24D7BD798;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke_2;
  v8[3] = &unk_24D7BD7C0;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDoseLimitWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)overrideDoseLimit:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke;
  v14[3] = &unk_24D7BD810;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke_2;
  v12[3] = &unk_24D7BD7C0;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_overrideDoseLimit:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
