@implementation HKFeatureAvailabilityStore

- (HKFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  HKFeatureAvailabilityStore *v9;
  HKFeatureAvailabilityStore *v10;
  HKObserverSet *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HKObserverSet *observers;
  HKTaskServerProxyProvider *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HKTaskServerProxyProvider *proxyProvider;
  HKFeatureAvailabilityStoreServerConfiguration *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HKFeatureAvailabilityStore;
  v9 = -[HKFeatureAvailabilityStore init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifier, a3);
    v11 = [HKObserverSet alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKFeatureAvailabilityStore:%@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKObserverSet initWithName:loggingCategory:](v11, "initWithName:loggingCategory:", v12, v13);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v14;

    v16 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v16, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v8, v17, v10, v18);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v19;

    -[HKProxyProvider setShouldRetryOnInterruption:](v10->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v21 = -[HKFeatureAvailabilityStoreServerConfiguration initWithFeatureIdentifier:]([HKFeatureAvailabilityStoreServerConfiguration alloc], "initWithFeatureIdentifier:", v7);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v21);

  }
  return v10;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), self->_featureIdentifier);
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_2;
  v3[3] = &unk_1E37F32D8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getFeatureOnboardingRecordWithCompletion:", v3);
}

void __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke;
  v10[3] = &unk_1E37F3328;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getFeatureOnboardingRecordWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_2;
  v3[3] = &unk_1E37F1870;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion:", v3);
}

void __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__43;
  v29 = __Block_byref_object_dispose__43;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__43;
  v23 = __Block_byref_object_dispose__43;
  v24 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke;
  v15[3] = &unk_1E37F3350;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_3;
  v14[3] = &unk_1E37E8B48;
  v14[4] = &v19;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);
  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError(v10);
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_2;
  v4[3] = &unk_1E37F1870;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_canCompleteOnboardingForCountryCode:completion:", v2, v4);
}

void __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__43;
  v29 = __Block_byref_object_dispose__43;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__43;
  v23 = __Block_byref_object_dispose__43;
  v24 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke;
  v15[3] = &unk_1E37F3350;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_3;
  v14[3] = &unk_1E37E8B48;
  v14[4] = &v19;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);
  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError(v10);
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_2;
  v4[3] = &unk_1E37F3378;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_onboardingEligibilityForCountryCode:completion:", v2, v4);
}

void __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_2;
  v3[3] = &unk_1E37F1870;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_onboardedCountryCodeSupportedStateWithCompletion:", v3);
}

void __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_2;
  v3[3] = &unk_1E37F1870;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getIsCurrentOnboardingVersionCompletedWithCompletion:", v3);
}

void __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v10[3] = &unk_1E37F3328;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getIsCurrentOnboardingVersionCompletedWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_2;
  v3[3] = &unk_1E37E9048;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_earliestDateLowestOnboardingVersionCompletedWithCompletion:", v3);
}

void __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_2;
  v3[3] = &unk_1E37F33A0;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getPairedFeatureAttributesWithCompletion:", v3);
}

void __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_2;
  v3[3] = &unk_1E37F33C8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getFeatureAvailabilityRequirementsWithCompletion:", v3);
}

void __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)regionAvailabilityWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_2;
  v3[3] = &unk_1E37F33F0;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getRegionAvailabilityWithCompletion:", v3);
}

void __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKFeatureAvailabilityStore registerObserver:queue:activationHandler:](self, "registerObserver:queue:activationHandler:", a3, a4, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKObserverSet *observers;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  observers = self->_observers;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke;
  v13[3] = &unk_1E37F1C20;
  v15 = &v16;
  v13[4] = self;
  v12 = v10;
  v14 = v12;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v8, v9, v13);
  if (!*((_BYTE *)v17 + 24))
    (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);

  _Block_object_dispose(&v16, 8);
}

void __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void *v5;
  id v6;
  id location;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v3 = 3221225472;
  v4 = __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke_2;
  v5 = &unk_1E37E95B8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutomaticProxyReconnectionHandler:", &v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setShouldRetryOnInterruption:", 1, v2, v3, v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "_startObservingWithActivationHandler:", *(_QWORD *)(a1 + 40));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutomaticProxyReconnectionHandler:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke_3;
  v5[3] = &unk_1E37E6A70;
  v5[4] = v2;
  return objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_97, v5);
}

uint64_t __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2_cold_1(a1);

}

- (void)_startObservingWithActivationHandler:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke;
  v10[3] = &unk_1E37F3328;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2_cold_1(a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_1E37F3300;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_1E37E8AD0;
  v9[4] = self;
  v9[5] = &v11;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_1E37E9020;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)_handleAutomaticProxyReconnection
{
  _BOOL4 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  HKFeatureAvailabilityStore *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = -[HKFeatureAvailabilityStore _synchronouslyStartObservingWithError:](self, "_synchronouslyStartObservingWithError:", &v7);
  v4 = v7;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification of successful server reconnection", buf, 0xCu);
    }

    -[HKFeatureAvailabilityStore _notifyObserversForOnboardingCompletionUpdate](self, "_notifyObserversForOnboardingCompletionUpdate");
    -[HKFeatureAvailabilityStore _notifyObserversForPairedDeviceCapabilityUpdate](self, "_notifyObserversForPairedDeviceCapabilityUpdate");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HKFeatureAvailabilityHealthDataRequirementStore _handleAutomaticProxyReconnection].cold.1((uint64_t)self);

  }
}

- (void)client_featureAvailabilityExtensionDidUpdateOnboardingCompletion
{
  NSObject *v3;
  int v4;
  HKFeatureAvailabilityStore *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of onboarding completion update", (uint8_t *)&v4, 0xCu);
  }

  -[HKFeatureAvailabilityStore _notifyObserversForOnboardingCompletionUpdate](self, "_notifyObserversForOnboardingCompletionUpdate");
}

- (void)client_featureAvailabilityExtensionDidUpdatePairedDeviceCapability
{
  NSObject *v3;
  int v4;
  HKFeatureAvailabilityStore *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of paired device capability update", (uint8_t *)&v4, 0xCu);
  }

  -[HKFeatureAvailabilityStore _notifyObserversForPairedDeviceCapabilityUpdate](self, "_notifyObserversForPairedDeviceCapabilityUpdate");
}

- (void)client_featureAvailabilityProvidingDidUpdateSettings
{
  NSObject *v3;
  int v4;
  HKFeatureAvailabilityStore *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of settings update", (uint8_t *)&v4, 0xCu);
  }

  -[HKFeatureAvailabilityStore _notifyObserversForSettingsUpdate](self, "_notifyObserversForSettingsUpdate");
}

- (void)_notifyObserversForOnboardingCompletionUpdate
{
  NSObject *v3;
  void *v4;
  HKObserverSet *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HKFeatureAvailabilityStore *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKObserverSet count](self->_observers, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of onboarding completion update", buf, 0x16u);

  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HKFeatureAvailabilityStore__notifyObserversForOnboardingCompletionUpdate__block_invoke;
  v6[3] = &unk_1E37F3458;
  v6[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v6);
}

uint64_t __75__HKFeatureAvailabilityStore__notifyObserversForOnboardingCompletionUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversForPairedDeviceCapabilityUpdate
{
  NSObject *v3;
  void *v4;
  HKObserverSet *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HKFeatureAvailabilityStore *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKObserverSet count](self->_observers, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of paired device capability update", buf, 0x16u);

  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__HKFeatureAvailabilityStore__notifyObserversForPairedDeviceCapabilityUpdate__block_invoke;
  v6[3] = &unk_1E37F3458;
  v6[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v6);
}

void __77__HKFeatureAvailabilityStore__notifyObserversForPairedDeviceCapabilityUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdatePairedDeviceCapability:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversForSettingsUpdate
{
  NSObject *v3;
  void *v4;
  HKObserverSet *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HKFeatureAvailabilityStore *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKObserverSet count](self->_observers, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of settings update", buf, 0x16u);

  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HKFeatureAvailabilityStore__notifyObserversForSettingsUpdate__block_invoke;
  v6[3] = &unk_1E37F3458;
  v6[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v6);
}

void __63__HKFeatureAvailabilityStore__notifyObserversForSettingsUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v24[3] = &unk_1E37F3480;
  v25 = v12;
  v26 = v13;
  v29 = a4;
  v27 = v14;
  v28 = v15;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2;
  v22[3] = &unk_1E37E6B38;
  v23 = v28;
  v18 = v28;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v24, v22);

}

uint64_t __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", a1[4], a1[8], a1[5], a1[6], a1[7]);
}

uint64_t __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke;
  v18[3] = &unk_1E37F34A8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveOnboardingCompletion:settings:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke;
  v18[3] = &unk_1E37F34A8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setFeatureSettingData:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke;
  v18[3] = &unk_1E37F34A8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setFeatureSettingString:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke;
  v18[3] = &unk_1E37F34A8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setFeatureSettingNumber:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
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
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke;
  v14[3] = &unk_1E37F34D0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeFeatureSettingValueForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke;
  v10[3] = &unk_1E37F3328;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetOnboardingWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
