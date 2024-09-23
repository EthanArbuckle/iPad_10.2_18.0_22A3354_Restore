@implementation HKDataCollector

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_quantityType);
}

- (HKDataCollector)initWithHealthStore:(id)a3 bundleIdentifier:(id)a4 quantityType:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  HKRetryableOperation *v14;
  void *v15;
  HKDataCollectorState *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HKDataCollectorTaskServerConfiguration *v24;
  HKTaskServerProxyProvider *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  HKDataCollectorCollectionConfiguration *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v42;
  _QWORD v44[4];
  id v45;
  id location;
  objc_super v47;
  uint8_t buf[4];
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)HKDataCollector;
  v11 = -[HKDataCollector init](&v47, sel_init);
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    HKCreateSerialDispatchQueue(v11, CFSTR("resource"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    v14 = -[HKRetryableOperation initWithQueue:retryCount:]([HKRetryableOperation alloc], "initWithQueue:retryCount:", *((_QWORD *)v11 + 1), 5);
    v15 = (void *)*((_QWORD *)v11 + 6);
    *((_QWORD *)v11 + 6) = v14;

    v11[176] = 1;
    v16 = objc_alloc_init(HKDataCollectorState);
    v17 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v16;

    v18 = objc_msgSend(v10, "copy");
    v19 = (void *)*((_QWORD *)v11 + 26);
    *((_QWORD *)v11 + 26) = v18;

    v20 = objc_msgSend(v9, "copy");
    v21 = (void *)*((_QWORD *)v11 + 5);
    *((_QWORD *)v11 + 5) = v20;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v11 + 3);
    *((_QWORD *)v11 + 3) = v22;

    v24 = -[HKDataCollectorTaskServerConfiguration initWithQuantityType:bundleIdentifier:canResumeFromLastDatum:]([HKDataCollectorTaskServerConfiguration alloc], "initWithQuantityType:bundleIdentifier:canResumeFromLastDatum:", *((_QWORD *)v11 + 26), *((_QWORD *)v11 + 5), 0);
    v25 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v8, CFSTR("HKDataCollectorTaskServerIdentifier"), v11, *((_QWORD *)v11 + 3));
    v26 = (void *)*((_QWORD *)v11 + 4);
    *((_QWORD *)v11 + 4) = v25;

    objc_msgSend(*((id *)v11 + 4), "setShouldRetryOnInterruption:", 0);
    objc_msgSend(*((id *)v11 + 4), "setTaskConfiguration:", v24);
    objc_initWeak(&location, v11);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __69__HKDataCollector_initWithHealthStore_bundleIdentifier_quantityType___block_invoke;
    v44[3] = &unk_1E37E95B8;
    objc_copyWeak(&v45, &location);
    objc_msgSend(*((id *)v11 + 4), "setAutomaticProxyReconnectionHandler:", v44);
    objc_msgSend(*((id *)v11 + 4), "setShouldRetryOnInterruption:", 1);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = (void *)*((_QWORD *)v11 + 18);
    *((_QWORD *)v11 + 18) = v27;

    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = (void *)*((_QWORD *)v11 + 20);
    *((_QWORD *)v11 + 20) = v29;

    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = (void *)*((_QWORD *)v11 + 19);
    *((_QWORD *)v11 + 19) = v31;

    v33 = -[HKDataCollectorCollectionConfiguration initWithCollectionInterval:collectionLatency:collectionType:]([HKDataCollectorCollectionConfiguration alloc], "initWithCollectionInterval:collectionLatency:collectionType:", 1, 600.0, 600.0);
    v34 = (void *)*((_QWORD *)v11 + 10);
    *((_QWORD *)v11 + 10) = v33;

    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = (void *)*((_QWORD *)v11 + 17);
    *((_QWORD *)v11 + 17) = v35;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v11 + 88) = _Q0;
    *((CFAbsoluteTime *)v11 + 25) = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v42 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v11;
      _os_log_impl(&dword_19A0E6000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Initialized.", buf, 0xCu);
    }
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

  }
  return (HKDataCollector *)v11;
}

void __69__HKDataCollector_initWithHealthStore_bundleIdentifier_quantityType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestRegistration");

}

- (HKDataCollectorCollectionConfiguration)collectionConfiguration
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__HKDataCollector_collectionConfiguration__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKDataCollectorCollectionConfiguration *)v3;
}

void __42__HKDataCollector_collectionConfiguration__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)resumeWithCompletion:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HKDataCollector_resumeWithCompletion___block_invoke;
  block[3] = &unk_1E37F1FA0;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __40__HKDataCollector_resumeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKDataCollectorTaskServerConfiguration *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  uint64_t v18;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 178))
  {
    objc_msgSend(*(id *)(v2 + 32), "clientQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HKDataCollector_resumeWithCompletion___block_invoke_2;
    block[3] = &unk_1E37E8CB0;
    v4 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v17 = v4;
    v18 = *(_QWORD *)(a1 + 48);
    dispatch_async(v3, block);

    v5 = v17;
LABEL_5:

    return;
  }
  if (*(_BYTE *)(v2 + 177))
  {
    objc_msgSend(*(id *)(v2 + 32), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__HKDataCollector_resumeWithCompletion___block_invoke_3;
    v13[3] = &unk_1E37E8CB0;
    v7 = *(id *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v15 = *(_QWORD *)(a1 + 48);
    dispatch_async(v6, v13);

    v5 = v14;
    goto LABEL_5;
  }
  *(_BYTE *)(v2 + 177) = 1;
  v8 = -[HKDataCollectorTaskServerConfiguration initWithQuantityType:bundleIdentifier:canResumeFromLastDatum:]([HKDataCollectorTaskServerConfiguration alloc], "initWithQuantityType:bundleIdentifier:canResumeFromLastDatum:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setTaskConfiguration:", v8);

  v9 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 184);
  *(_QWORD *)(v10 + 184) = v9;

  v12 = *(_QWORD **)(a1 + 32);
  if (!v12[9])
    objc_msgSend(v12, "_queue_requestRegistration");
}

void __40__HKDataCollector_resumeWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v4, v5, CFSTR("This %@ has already been invalidated."), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

}

void __40__HKDataCollector_resumeWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v4, v5, CFSTR("%@ has already been resumed. %@ must be called only once, and before any calls to insertDatums:device:metadata:completion:"), v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v8);

}

- (void)insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 completion:(id)a6
{
  -[HKDataCollector insertDatums:device:metadata:options:completion:](self, "insertDatums:device:metadata:options:completion:", a3, a4, a5, 0, a6);
}

- (void)insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HKQuantityType *quantityType;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  BOOL v23;
  id v24;
  NSObject *v25;
  NSObject *queue;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  SEL v32;
  unint64_t v33;
  id v34;
  uint8_t buf[4];
  HKDataCollector *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v16)
    v17 = v16;
  else
    v17 = &__block_literal_global_88;
  if ((a6 & 1) != 0)
  {
    _HKInitializeLogging();
    v18 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      quantityType = self->_quantityType;
      v20 = v18;
      -[HKObjectType identifier](quantityType, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v21;
      _os_log_impl(&dword_19A0E6000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Transient data collection on type %{public}@", buf, 0x16u);

    }
  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v17);
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v34 = 0;
    v23 = -[HKDataCollector _validateDatums:error:](self, "_validateDatums:error:", v13, &v34);
    v24 = v34;
    if (v23)
    {
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
      }
      else
      {
        +[HKDevice localDevice](HKDevice, "localDevice");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__HKDataCollector_insertDatums_device_metadata_options_completion___block_invoke_33;
      block[3] = &unk_1E37F1FE8;
      block[4] = self;
      v31 = v22;
      v32 = a2;
      v28 = v13;
      v14 = v14;
      v29 = v14;
      v30 = v15;
      v33 = a6;
      dispatch_sync(queue, block);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v22)[2](v22, 0, v24);
    }

  }
  else
  {
    _HKInitializeLogging();
    v25 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_19A0E6000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring empty batch with device: %@", buf, 0x16u);
    }
    v22[2](v22, 1, 0);
  }

}

void __67__HKDataCollector_insertDatums_device_metadata_options_completion___block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 178))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = objc_opt_class();
    v6 = *(_QWORD *)(a1 + 72);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v5, v6, CFSTR("This %@ has already been invalidated."), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v8);

  }
  else
  {
    if (!*(_BYTE *)(v2 + 177) && !*(_QWORD *)(v2 + 72))
    {
      objc_msgSend((id)v2, "_queue_requestRegistration");
      v2 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v2 + 177) = 1;
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSaveCompletion:", v9);

    objc_msgSend(*(id *)(a1 + 32), "_queue_batchDatums:device:metadata:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
  }
}

- (void)_queue_batchDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  void *v7;
  id v13;
  id v14;
  id v15;
  id v16;
  NSMutableArray *v17;
  NSMutableArray *pendingBatches;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  void *v27;
  _HKDataCollectorPendingBatch *v28;
  CFAbsoluteTime Current;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  _HKDataCollectorPendingBatch *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *log;
  os_log_t loga;
  os_log_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  _HKDataCollectorPendingBatch *v67;
  _HKDataCollectorPendingBatch *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  uint8_t buf[4];
  HKDataCollector *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!self->_pendingBatches)
  {
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingBatches = self->_pendingBatches;
    self->_pendingBatches = v17;

  }
  self->_totalDatumCount += objc_msgSend(v13, "count");
  -[NSMutableArray lastObject](self->_pendingBatches, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v19;
  if (!v19)
    goto LABEL_28;
  v20 = v19;
  v69 = v16;
  objc_msgSend(v19, "device");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21 != v14)
  {
    objc_msgSend(v20, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_18;
    a4 = v22;
    objc_msgSend(v20, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqual:", v7))
    {
LABEL_17:

      goto LABEL_18;
    }
  }
  objc_msgSend(v20, "metadata");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v23 == v15)
  {
    v63 = a4;
    v66 = v7;
    v71 = v14;
    goto LABEL_12;
  }
  objc_msgSend(v20, "metadata");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

    if (v21 != v14)
      goto LABEL_17;
LABEL_18:

    v16 = v69;
    goto LABEL_28;
  }
  v25 = v20;
  v20 = (void *)v24;
  v63 = a4;
  v66 = v7;
  v71 = v14;
  objc_msgSend(v25, "metadata");
  a4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqual:", a4))
  {
    v26 = 0;
    goto LABEL_13;
  }
LABEL_12:
  v26 = ((a6 & 1) == 0) ^ objc_msgSend(v74, "isTransient");
  if (v23 == v15)
  {

    v14 = v71;
    if (v21 == v71)
    {

LABEL_21:
      v16 = v69;
      v27 = v74;
      if ((v26 & 1) != 0)
        goto LABEL_22;
LABEL_28:
      v39 = [_HKDataCollectorPendingBatch alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completion:](v39, "initWithIdentifier:data:metadata:device:options:completion:", v40, v13, v15, v14, a6, v16);

      -[NSMutableArray addObject:](self->_pendingBatches, "addObject:", v28);
      if (self->_totalDatumCount >= 5001)
        -[HKDataCollector _queue_pruneOldDatums](self, "_queue_pruneOldDatums");
      _HKInitializeLogging();
      v41 = (void *)HKLogDataCollection;
      if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      {
        v60 = v41;
        -[_HKDataCollectorPendingBatch batchUUID](v28, "batchUUID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromUUID(v65);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v13, "count");
        objc_msgSend(v13, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "dateInterval");
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject startDate](loga, "startDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromDate(v43);
        v73 = v14;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastObject");
        v68 = v28;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "dateInterval");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "endDate");
        v47 = v16;
        v48 = v15;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromDate(v49);
        v70 = v13;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v76 = self;
        v77 = 2114;
        v78 = v42;
        v79 = 2048;
        v80 = v56;
        v81 = 2114;
        v82 = v44;
        v83 = 2114;
        v84 = v50;
        v85 = 2112;
        v86 = v73;
        _os_log_impl(&dword_19A0E6000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Inserting %lu datums from %{public}@ -> %{public}@, device: %@", buf, 0x3Eu);

        v15 = v48;
        v16 = v47;

        v28 = v68;
        v13 = v70;

        v14 = v73;
      }
      v27 = v74;
      goto LABEL_33;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_13:

  v14 = v71;
  if (v21 != v71)
    goto LABEL_20;

  v16 = v69;
  v27 = v74;
  if (!v26)
    goto LABEL_28;
LABEL_22:
  objc_msgSend(v27, "batchByAddingData:completion:", v13, v16);
  v28 = (_HKDataCollectorPendingBatch *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_pendingBatches, "removeLastObject");
  -[NSMutableArray addObject:](self->_pendingBatches, "addObject:", v28);
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastLogTime > 120.0)
  {
    _HKInitializeLogging();
    v30 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      log = v30;
      -[_HKDataCollectorPendingBatch batchUUID](v28, "batchUUID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromUUID(v64);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKDataCollectorPendingBatch data](v28, "data");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v61, "count");
      -[_HKDataCollectorPendingBatch data](v28, "data");
      v59 = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v59, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "dateInterval");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "startDate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate(v53);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKDataCollectorPendingBatch data](v28, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastObject");
      v67 = v28;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dateInterval");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "endDate");
      v35 = v15;
      v36 = v13;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate(v37);
      v72 = v14;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v76 = self;
      v77 = 2114;
      v78 = v52;
      v79 = 2048;
      v80 = v51;
      v81 = 2114;
      v82 = v31;
      v83 = 2114;
      v84 = v38;
      _os_log_impl(&dword_19A0E6000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Now contains %ld datums from %{public}@ -> %{public}@.", buf, 0x34u);

      v13 = v36;
      v15 = v35;
      v16 = v69;

      v28 = v67;
      v14 = v72;

    }
    self->_lastLogTime = Current;
    v27 = v74;
  }
  if (self->_totalDatumCount >= 5001)
    -[HKDataCollector _queue_pruneOldDatums](self, "_queue_pruneOldDatums");
LABEL_33:

}

- (void)finishWithCompletion:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HKDataCollector_finishWithCompletion___block_invoke;
  block[3] = &unk_1E37F1FA0;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __40__HKDataCollector_finishWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[5];
  id v24;
  _QWORD block[5];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 178))
  {
    objc_msgSend(*(id *)(v2 + 32), "clientQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HKDataCollector_finishWithCompletion___block_invoke_2;
    block[3] = &unk_1E37E8CB0;
    v4 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v26 = v4;
    v27 = *(_QWORD *)(a1 + 48);
    dispatch_async(v3, block);

    v5 = v26;
  }
  else
  {
    *(_BYTE *)(v2 + 178) = 1;
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__HKDataCollector_finishWithCompletion___block_invoke_3;
    aBlock[3] = &unk_1E37E67C0;
    v7 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v24 = v7;
    v8 = _Block_copy(aBlock);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count");
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count");
    _HKInitializeLogging();
    v11 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10 + v9;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 160);
      v15 = v11;
      v16 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 138543874;
      v29 = v13;
      v30 = 2048;
      v31 = v12;
      v32 = 2048;
      v33 = v16;
      _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing data collection with %ld unsent batches and %ld unpersisted batches.", buf, 0x20u);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count")
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count"))
    {
      v17 = objc_msgSend(v8, "copy");
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 192);
      *(_QWORD *)(v18 + 192) = v17;

      objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "clientQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __40__HKDataCollector_finishWithCompletion___block_invoke_35;
      v21[3] = &unk_1E37E6CD0;
      v22 = v8;
      dispatch_async(v20, v21);

    }
    v5 = v24;
  }

}

void __40__HKDataCollector_finishWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v4, v5, CFSTR("This %@ has already been invalidated."), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

}

void __40__HKDataCollector_finishWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: All data successfully flushed.", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __40__HKDataCollector_finishWithCompletion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_queue_considerSendingBatches
{
  void *v3;
  NSMutableDictionary *unconfirmedBatchesByUUID;
  NSObject *v5;
  double Current;
  double unitTest_maxDatumAgeOverride;
  double v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int64_t totalDatumCount;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  HKDataCollector *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableDictionary count](self->_unconfirmedBatchesByUUID, "count"))
  {
    _HKInitializeLogging();
    v3 = (void *)HKLogDataCollection;
    if (!os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      return;
    unconfirmedBatchesByUUID = self->_unconfirmedBatchesByUUID;
    v5 = v3;
    *(_DWORD *)buf = 138543618;
    v44 = self;
    v45 = 2048;
    v46 = -[NSMutableDictionary count](unconfirmedBatchesByUUID, "count");
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %lu unconfirmed batches; delaying next send.",
      buf,
      0x16u);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[HKDataCollectorCollectionConfiguration collectionLatency](self->_collectionConfiguration, "collectionLatency");
    if (self->_unitTest_maxDatumAgeOverride >= 0.0)
      unitTest_maxDatumAgeOverride = self->_unitTest_maxDatumAgeOverride;
    v8 = Current - unitTest_maxDatumAgeOverride;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = self->_flushRequests;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15;

          if (v16 >= v8)
            v8 = v16;
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v11);
    }

    -[NSMutableArray firstObject](self->_pendingBatches, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v5 = v17;
    if (v17)
    {
      -[NSObject data](v17, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dateInterval");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_shouldFlushAll
        || (objc_msgSend(v21, "timeIntervalSinceReferenceDate"), v22 < v8)
        || self->_totalDatumCount > 4999
        || self->_invalidated)
      {
        _HKInitializeLogging();
        v23 = (void *)HKLogDataCollection;
        if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)MEMORY[0x1E0C99D68];
          v25 = v23;
          objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:", v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          totalDatumCount = self->_totalDatumCount;
          *(_DWORD *)buf = 138544386;
          v44 = self;
          v45 = 2114;
          v46 = (uint64_t)v5;
          v47 = 2112;
          v48 = v21;
          v49 = 2112;
          v50 = v26;
          v51 = 2048;
          v52 = totalDatumCount;
          _os_log_impl(&dword_19A0E6000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending batch %{public}@ (start date %@, latest start %@, datum count %ld)", buf, 0x34u);

        }
        if (!self->_registrationUUID)
        {
          -[HKDataCollector _queue_requestRegistration](self, "_queue_requestRegistration");

          goto LABEL_35;
        }
        -[HKDataCollector _queue_sendBatch:](self, "_queue_sendBatch:", v5);
      }

    }
    else
    {
      -[HKDataCollector _queue_checkForFinish](self, "_queue_checkForFinish");
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v28 = self->_flushRequests;
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v35 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "completion", (_QWORD)v34);
            v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v33[2](v33, 1, 0);

          }
          v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v30);
      }

      -[NSMutableArray removeAllObjects](self->_flushRequests, "removeAllObjects");
      self->_shouldFlushAll = 0;
    }
    -[HKDataCollector _queue_considerCompletingFlushRequests](self, "_queue_considerCompletingFlushRequests", (_QWORD)v34);
    -[HKDataCollector _queue_updateReconsiderationTimer](self, "_queue_updateReconsiderationTimer");
  }
LABEL_35:

}

- (void)_queue_considerCompletingFlushRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  HKDataCollector *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray firstObject](self->_pendingBatches, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = self;
  -[NSMutableDictionary allValues](self->_unconfirmedBatchesByUUID, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateInterval");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "hk_isBeforeDate:", v8))
        {
          v18 = v17;

          v8 = v18;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v11);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v30->_flushRequests;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (!v20)
  {
    v22 = v19;
    goto LABEL_27;
  }
  v21 = v20;
  v29 = v4;
  v22 = 0;
  v23 = *(_QWORD *)v32;
  do
  {
    for (j = 0; j != v21; ++j)
    {
      if (*(_QWORD *)v32 != v23)
        objc_enumerationMutation(v19);
      v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
      objc_msgSend(v25, "date", v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "hk_isBeforeDate:", v8);

      if (v27)
      {
        objc_msgSend(v25, "completion");
        v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v28[2](v28, 1, 0);

        if (!v22)
          v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableArray addObject:](v22, "addObject:", v25);
      }
    }
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  }
  while (v21);

  v4 = v29;
  if (v22)
  {
    -[NSMutableArray removeObjectsInArray:](v30->_flushRequests, "removeObjectsInArray:", v22);
LABEL_27:

  }
}

- (void)_queue_requestRegistration
{
  NSObject *v3;
  HKRetryableOperation *retryableOperation;
  _QWORD v5[5];
  _QWORD v6[5];
  uint8_t buf[4];
  HKDataCollector *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_requiresRegistration)
  {
    self->_requiresRegistration = 0;
    _HKInitializeLogging();
    v3 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = self;
      _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering with healthd", buf, 0xCu);
    }
    retryableOperation = self->_retryableOperation;
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke;
    v6[3] = &unk_1E37F0BF8;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_5;
    v5[3] = &unk_1E37E6BD8;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v6, v5);
  }
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_2;
  v9[3] = &unk_1E37F2010;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_4;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v9, v7);

}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_3;
  v3[3] = &unk_1E37E6AE8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_registerWithCompletion:", v3);

}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "hk_isHealthKitErrorWithCode:", 101);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __45__HKDataCollector__queue_requestRegistration__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _HKInitializeLogging();
    v6 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished registration; awaiting registration complete.",
        buf,
        0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (_QWORD *)(a1 + 32);
    *(_BYTE *)(v9 + 176) = 1;
    _HKInitializeLogging();
    v10 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
      __45__HKDataCollector__queue_requestRegistration__block_invoke_5_cold_1(v8, (uint64_t)v5, v10);
    v11 = (void *)objc_msgSend(*(id *)(*v8 + 144), "copy");
    objc_msgSend(*(id *)(*v8 + 144), "removeAllObjects");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "callCompletionsWithSuccess:error:", 0, v5, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

    objc_msgSend((id)*v8, "_queue_checkForFinish");
  }

}

- (void)_requestRegistration
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HKDataCollector__requestRegistration__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __39__HKDataCollector__requestRegistration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRegistration");
}

- (void)_queue_checkForFinish
{
  id finishCompletion;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    finishCompletion = self->_finishCompletion;
    if (finishCompletion)
    {
      v4 = _Block_copy(finishCompletion);
      v5 = self->_finishCompletion;
      self->_finishCompletion = 0;

      -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__HKDataCollector__queue_checkForFinish__block_invoke;
      block[3] = &unk_1E37E6CD0;
      v9 = v4;
      v7 = v4;
      dispatch_async(v6, block);

    }
  }
}

uint64_t __40__HKDataCollector__queue_checkForFinish__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_queue_sendBatch:(id)a3
{
  id v4;
  NSMutableDictionary *unconfirmedBatchesByUUID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *log;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  HKDataCollector *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unconfirmedBatchesByUUID = self->_unconfirmedBatchesByUUID;
  objc_msgSend(v4, "batchUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](unconfirmedBatchesByUUID, "setObject:forKeyedSubscript:", v4, v6);

  -[NSMutableArray removeObject:](self->_pendingBatches, "removeObject:", v4);
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_totalDatumCount -= objc_msgSend(v7, "count");

  self->_shouldFlushAll = 1;
  _HKInitializeLogging();
  v8 = (void *)HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    objc_msgSend(v4, "batchUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKDiagnosticStringFromUUID(v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v21, "count");
    objc_msgSend(v4, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = self;
    v27 = 2114;
    v28 = v18;
    v29 = 2048;
    v30 = v17;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v15;
    _os_log_impl(&dword_19A0E6000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Sending %ld datums from %{public}@ to %{public}@", buf, 0x34u);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __36__HKDataCollector__queue_sendBatch___block_invoke;
  v23[3] = &unk_1E37E6A20;
  v23[4] = self;
  v24 = v4;
  v16 = v4;
  -[HKDataCollector _queue_taskServer_insertBatch:completion:](self, "_queue_taskServer_insertBatch:completion:", v16, v23);

}

void __36__HKDataCollector__queue_sendBatch___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    _HKInitializeLogging();
    v7 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v10 = v7;
      objc_msgSend(v8, "batchUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromUUID(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v9;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_INFO, "%{public}@: Batch %{public}@: successfully sent to daemon.", (uint8_t *)&v17, 0x16u);

LABEL_11:
    }
  }
  else
  {
    if ((objc_msgSend(v5, "hk_isXPCConnectionError") & 1) == 0
      && !objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 114))
    {
      _HKInitializeLogging();
      v14 = (void *)HKLogDataCollection;
      if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
        __36__HKDataCollector__queue_sendBatch___block_invoke_cold_2(a1, v14);
      v15 = *(void **)(a1 + 40);
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
      objc_msgSend(v15, "batchUUID");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v10);
      goto LABEL_11;
    }
    _HKInitializeLogging();
    v13 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
      __36__HKDataCollector__queue_sendBatch___block_invoke_cold_1(a1, v13);
  }

}

- (void)_queue_updateReconsiderationTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *reconsiderationSource;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  BOOL v18;
  double v19;
  dispatch_time_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_pendingBatches, "count")
    && !-[NSMutableDictionary count](self->_unconfirmedBatchesByUUID, "count"))
  {
    if (!self->_reconsiderationSource)
    {
      v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
      reconsiderationSource = self->_reconsiderationSource;
      self->_reconsiderationSource = v3;

      objc_initWeak(&location, self);
      v5 = self->_reconsiderationSource;
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __52__HKDataCollector__queue_updateReconsiderationTimer__block_invoke;
      v24 = &unk_1E37E85F0;
      objc_copyWeak(&v25, &location);
      dispatch_source_set_event_handler(v5, &v21);
      dispatch_resume((dispatch_object_t)self->_reconsiderationSource);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    -[NSMutableArray firstObject](self->_pendingBatches, "firstObject", v21, v22, v23, v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;
    -[HKDataCollectorCollectionConfiguration collectionLatency](self->_collectionConfiguration, "collectionLatency");
    v14 = v12 + v13;

    v15 = v14 - CFAbsoluteTimeGetCurrent();
    v16 = v15 * 1000000000.0;
    v17 = self->_reconsiderationSource;
    v18 = v15 <= 0.25;
    v19 = 250000000.0;
    if (!v18)
      v19 = v16;
    v20 = dispatch_time(0, (unint64_t)v19);
    dispatch_source_set_timer(v17, v20, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

  }
}

void __52__HKDataCollector__queue_updateReconsiderationTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_considerSendingBatches");

}

- (void)_queue_pruneOldDatums
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int64_t totalDatumCount;

  -[HKDataCollector _queue_considerSendingBatches](self, "_queue_considerSendingBatches");
  v3 = 0;
  do
  {
    if (v3 >= -[NSMutableArray count](self->_pendingBatches, "count"))
      break;
    -[NSMutableArray objectAtIndexedSubscript:](self->_pendingBatches, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_totalDatumCount - 5000;
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 <= v5)
    {
      -[HKDataCollector _removeBatch:](self, "_removeBatch:", v4);
    }
    else
    {
      objc_msgSend(v4, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDataCollector _prunedBatch:maximumLength:](self, "_prunedBatch:maximumLength:", v4, objc_msgSend(v8, "count") - v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pendingBatches, "replaceObjectAtIndex:withObject:", v3, v9);
        objc_msgSend(v4, "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        objc_msgSend(v9, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        self->_totalDatumCount += objc_msgSend(v12, "count") - v11;

        ++v3;
      }
      else
      {
        -[HKDataCollector _removeBatch:](self, "_removeBatch:", v4);
      }

    }
    totalDatumCount = self->_totalDatumCount;

  }
  while (totalDatumCount > 5000);
}

- (void)_queue_resetUnpersistedBatches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_unpersistedBatchesByUUID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableArray addObject:](self->_pendingBatches, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_unpersistedBatchesByUUID, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_unconfirmedBatchesByUUID, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableArray addObject:](self->_pendingBatches, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeAllObjects](self->_unconfirmedBatchesByUUID, "removeAllObjects");
  -[NSMutableArray sortUsingComparator:](self->_pendingBatches, "sortUsingComparator:", &__block_literal_global_41);
}

uint64_t __49__HKDataCollector__queue_resetUnpersistedBatches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  return v13;
}

- (void)_removeBatch:(id)a3
{
  NSMutableArray *pendingBatches;
  id v5;
  void *v6;
  id v7;

  pendingBatches = self->_pendingBatches;
  v5 = a3;
  -[NSMutableArray removeObject:](pendingBatches, "removeObject:", v5);
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_totalDatumCount -= objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1300, CFSTR("Reached datum buffer limit, pruning datums."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletionsWithSuccess:error:", 0, v7);

}

- (id)_prunedBatch:(id)a3 maximumLength:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _HKDataCollectorPendingBatch *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _HKDataCollectorPendingBatch *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD aBlock[4];
  id v37;

  v6 = a3;
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v8, "count") + ~a4, a4 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_45);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _HKInitializeLogging();
    v11 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
      -[HKDataCollector _prunedBatch:maximumLength:].cold.1((uint64_t)self, (uint64_t)v6, v11);
    goto LABEL_5;
  }
  objc_msgSend(v6, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") - a4 + v10;

  objc_msgSend(v6, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v13 == v15)
  {
LABEL_5:
    v16 = 0;
    goto LABEL_12;
  }
  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v6, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "saveCompletion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1300, CFSTR("Reached datum buffer limit, pruning datums."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "data");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "saveCompletion");
        v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v24)[2](v24, 0, v21);

      }
    }
  }
  objc_msgSend(v6, "data");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "subarrayWithRange:", v13, objc_msgSend(v26, "count") - v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "hk_map:", &__block_literal_global_48);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HKDataCollector__prunedBatch_maximumLength___block_invoke_2;
  aBlock[3] = &unk_1E37E6BD8;
  v37 = v28;
  v29 = v28;
  v30 = _Block_copy(aBlock);
  v31 = [_HKDataCollectorPendingBatch alloc];
  objc_msgSend(v6, "batchUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completion:](v31, "initWithIdentifier:data:metadata:device:options:completion:", v32, v27, v33, v34, 0, v30);

LABEL_12:
  return v16;
}

BOOL __46__HKDataCollector__prunedBatch_maximumLength___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "saveCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __46__HKDataCollector__prunedBatch_maximumLength___block_invoke_46(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "saveCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _Block_copy(v2);

  return v3;
}

void __46__HKDataCollector__prunedBatch_maximumLength___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setState:(id)a3
{
  id v4;
  HKDataCollectorState *v5;
  HKDataCollectorState *state;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (HKDataCollectorState *)objc_msgSend(v4, "copy");
  state = self->_state;
  self->_state = v5;

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__HKDataCollector_setState___block_invoke;
  v9[3] = &unk_1E37E6980;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(queue, v9);

}

uint64_t __28__HKDataCollector_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendState:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_sendState:(id)a3
{
  id v4;
  HKRetryableOperation *retryableOperation;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryableOperation = self->_retryableOperation;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HKDataCollector__queue_sendState___block_invoke;
  v7[3] = &unk_1E37E6B60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v7, &__block_literal_global_49);

}

void __36__HKDataCollector__queue_sendState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(v5 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__HKDataCollector__queue_sendState___block_invoke_2;
  v11[3] = &unk_1E37F20F8;
  v11[4] = v5;
  v12 = v6;
  v13 = v3;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __36__HKDataCollector__queue_sendState___block_invoke_4;
  v9[3] = &unk_1E37E6B38;
  v10 = v13;
  v8 = v13;
  objc_msgSend(v7, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

void __36__HKDataCollector__queue_sendState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__HKDataCollector__queue_sendState___block_invoke_3;
  v6[3] = &unk_1E37E6AE8;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "remote_setCollectionState:completion:", v5, v6);

}

uint64_t __36__HKDataCollector__queue_sendState___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__HKDataCollector__queue_sendState___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HKDataCollector_setDelegate___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

_QWORD *__31__HKDataCollector_setDelegate___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 216), *(id *)(a1 + 40));
  result = *(_QWORD **)(a1 + 32);
  if (!result[9])
    return (_QWORD *)objc_msgSend(result, "_queue_requestRegistration");
  return result;
}

- (void)_queue_taskServer_insertBatch:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  HKRetryableOperation *retryableOperation;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_registrationUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDataCollector.m"), 770, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_registrationUUID"));

  }
  retryableOperation = self->_retryableOperation;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke;
  v12[3] = &unk_1E37E6B60;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v12, v8);

}

void __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_2;
  v12[3] = &unk_1E37F20F8;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = v3;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_4;
  v10[3] = &unk_1E37E6B38;
  v11 = v15;
  v9 = v15;
  objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

void __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "options");
  objc_msgSend(*(id *)(a1 + 32), "batchUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_3;
  v12[3] = &unk_1E37E6AE8;
  v13 = v10;
  objc_msgSend(v4, "remote_insertDatums:device:metadata:options:batchUUID:registrationUUID:completion:", v5, v6, v7, v8, v9, v11, v12);

}

uint64_t __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_synchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKDataCollector_clientRemote_synchronizeWithCompletion___block_invoke;
  block[3] = &unk_1E37E6CD0;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __58__HKDataCollector_clientRemote_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_beginCollectionWithConfiguration:(id)a3 lastPersistedDatum:(id)a4 registrationUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke;
  block[3] = &unk_1E37EBEA8;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);

}

void __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  _HKDataCollectorPendingBatch *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _HKDataCollectorPendingBatch *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  const void **v48;
  void (**v49)(void *, _QWORD);
  _QWORD *v50;
  void *v51;
  void *v52;
  id obj;
  id v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[4];
  id v67;
  id v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    *(_DWORD *)buf = 138543874;
    v72 = v3;
    v73 = 2114;
    v74 = v4;
    v75 = 2114;
    v76 = v5;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning client-side data collection with configuration %{public}@, last datum %{public}@", buf, 0x20u);
  }
  v6 = objc_msgSend(a1[7], "copy");
  v7 = a1[4];
  v8 = (void *)v7[9];
  v7[9] = v6;

  v9 = objc_msgSend(a1[5], "copy");
  v10 = a1[4];
  v11 = (void *)v10[10];
  v10[10] = v9;

  v12 = _Block_copy(*((const void **)a1[4] + 23));
  v13 = a1[4];
  v14 = (void *)v13[23];
  v13[23] = 0;

  v15 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    objc_msgSend(*((id *)a1[4] + 4), "clientQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_57;
    block[3] = &unk_1E37E6D40;
    v68 = v12;
    v67 = a1[6];
    dispatch_async(v16, block);

  }
  objc_msgSend(a1[4], "_queue_resetUnpersistedBatches");
  if (a1[6])
  {
    v52 = v12;
    v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1[6], "dateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = *((id *)a1[4] + 18);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v19)
    {
      v20 = v19;
      v55 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          v22 = a1;
          if (*(_QWORD *)v63 != v55)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v23, "data", v52);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dateInterval");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "hk_isAfterOrEqualToDate:", v18);

          if (v28)
          {
            objc_msgSend(v54, "addObject:", v23);
          }
          else
          {
            objc_msgSend(v23, "data");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "dateInterval");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "endDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "hk_isBeforeOrEqualToDate:", v18);

            if (v33)
            {
              objc_msgSend(v23, "callCompletionsWithSuccess:error:", 1, 0);
            }
            else
            {
              objc_msgSend(v23, "data");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v60[0] = MEMORY[0x1E0C809B0];
              v60[1] = 3221225472;
              v60[2] = __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_2;
              v60[3] = &unk_1E37F2140;
              v61 = v18;
              objc_msgSend(v34, "hk_filter:", v60);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v36 = [_HKDataCollectorPendingBatch alloc];
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "metadata");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "device");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "completions");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completions:](v36, "initWithIdentifier:data:metadata:device:options:completions:", v37, v35, v38, v39, 0, v40);

              objc_msgSend(v54, "addObject:", v41);
            }
          }
          a1 = v22;
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v20);
    }

    objc_storeStrong((id *)a1[4] + 18, v54);
    *((_QWORD *)a1[4] + 7) = 0;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v42 = *((id *)a1[4] + 18);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v57 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "data", v52);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *((_QWORD *)a1[4] + 7) += objc_msgSend(v47, "count");

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v44);
    }

    v12 = v52;
  }
  v48 = (const void **)a1[4];
  if (v48[13])
  {
    v49 = (void (**)(void *, _QWORD))_Block_copy(v48[13]);
    v50 = a1[4];
    v51 = (void *)v50[13];
    v50[13] = 0;

    ((void (**)(void *, id))v49)[2](v49, a1[4]);
    v48 = (const void **)a1[4];
  }
  objc_msgSend(v48, "_queue_considerSendingBatches", v52);

}

uint64_t __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hk_isAfterOrEqualToDate:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)clientRemote_collectionConfigurationDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__38;
  v15 = __Block_byref_object_dispose__38;
  v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HKDataCollector_clientRemote_collectionConfigurationDidChange___block_invoke;
  block[3] = &unk_1E37EBC00;
  block[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  dispatch_sync(queue, block);
  if (v12[5])
  {
    -[HKDataCollector delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "dataCollector:didUpdateCollectionConfiguration:", self, v12[5]);

  }
  _Block_object_dispose(&v11, 8);

}

uint64_t __65__HKDataCollector_clientRemote_collectionConfigurationDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    _HKInitializeLogging();
    v2 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v3;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Received updated configuration: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v8;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
}

- (void)clientRemote_receivedBatch:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKDataCollector_clientRemote_receivedBatch_error___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __52__HKDataCollector_clientRemote_receivedBatch_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v4 = (void *)HKLogDataCollection;
    v5 = os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v5)
        goto LABEL_8;
      v6 = *(_QWORD *)(a1 + 32);
      v7 = v4;
      objc_msgSend(0, "batchUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromUUID(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543618;
      *(_QWORD *)&v23[4] = v6;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v9;
      v10 = "%{public}@: Duplicate receipt confirmation of batch %{public}@, ignoring.";
    }
    else
    {
      if (!v5)
        goto LABEL_8;
      v11 = *(_QWORD *)(a1 + 32);
      v7 = v4;
      objc_msgSend(0, "batchUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromUUID(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543618;
      *(_QWORD *)&v23[4] = v11;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v9;
      v10 = "%{public}@: Received receipt confirmation for unknown batch %{public}@, ignoring.";
    }
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, v10, v23, 0x16u);

  }
LABEL_8:
  v12 = *(_QWORD *)(a1 + 48);
  _HKInitializeLogging();
  v13 = (void *)HKLogDataCollection;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v20 = v13;
      HKDiagnosticStringFromUUID(v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v23 = 138543874;
      *(_QWORD *)&v23[4] = v19;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v21;
      *(_WORD *)&v23[22] = 2114;
      v24 = v22;
      _os_log_error_impl(&dword_19A0E6000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Batch %{public}@: Fatal error sending batch, failing send: %{public}@", v23, 0x20u);

    }
    objc_msgSend(v2, "callCompletionsWithSuccess:error:", 0, *(_QWORD *)(a1 + 48), *(_OWORD *)v23, *(_QWORD *)&v23[16]);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = v13;
      objc_msgSend(v2, "batchUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromUUID(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543618;
      *(_QWORD *)&v23[4] = v14;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v17;
      _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: confirmed receipt.", v23, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)v23, *(_OWORD *)&v23[8]);
    objc_msgSend(*(id *)(a1 + 32), "_queue_considerCompletingFlushRequests");
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");

}

- (void)clientRemote_finishedPersistenceForBatch:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKDataCollector_clientRemote_finishedPersistenceForBatch_error___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __66__HKDataCollector_clientRemote_finishedPersistenceForBatch_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 160), "removeObjectForKey:", a1[5]);
    if (a1[6])
    {
      _HKInitializeLogging();
      v3 = (void *)HKLogDataCollection;
      if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
      {
        v9 = a1[4];
        v8 = (void *)a1[5];
        v10 = v3;
        HKDiagnosticStringFromUUID(v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1[6];
        v13 = 138543874;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2114;
        v18 = v12;
        _os_log_error_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Batch %{public}@: Persistence failed: %{public}@.", (uint8_t *)&v13, 0x20u);

      }
      v4 = a1[6];
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v2, "callCompletionsWithSuccess:error:", v4 == 0);
  }
  else
  {
    _HKInitializeLogging();
    v5 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = (void *)a1[5];
      v13 = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Daemon reported persistence finished for batch %{public}@, but no record of that batch exists.", (uint8_t *)&v13, 0x16u);
    }
  }

}

- (void)clientRemote_collectThroughDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _HKDataCollectorFlushRequest *v5;
  void *v6;
  _HKDataCollectorFlushRequest *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Received flush request through %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__38;
  v20 = __Block_byref_object_dispose__38;
  v21 = 0;
  v5 = [_HKDataCollectorFlushRequest alloc];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_62;
  v13 = &unk_1E37F2168;
  v6 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v17 = buf;
  v16 = *(id *)(a1 + 48);
  v7 = -[_HKDataCollectorFlushRequest initWithDate:completion:](v5, "initWithDate:completion:", v15, &v10);
  objc_msgSend(*(id *)(a1 + 32), "_queue_callToDelegateAndEnqueueForClientFlushRequest:", v7, v10, v11, v12, v13, v14);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v8;

  _Block_object_dispose(buf, 8);
}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_62(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  char v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 32);
  v17[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_2;
  v17[3] = &unk_1E37F2190;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[4] = v4;
  v18 = v5;
  v11 = *(_OWORD *)(a1 + 48);
  v8 = (id)v11;
  v19 = v11;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_63;
  v13[3] = &unk_1E37F21B8;
  v9 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v12 = *(_OWORD *)(a1 + 48);
  v10 = (id)v12;
  v15 = v12;
  v16 = a2;
  objc_msgSend(v6, "fetchProxyWithHandler:errorHandler:", v17, v13);

}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  id v8;
  __int128 v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_3;
  v7[3] = &unk_1E37F2168;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(a2, "remote_synchronizeWithCompletion:", v7);

}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Flush request through %{public}@ complete.", (uint8_t *)&v11, 0x16u);
  }
  v8 = *(NSObject **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v8)
  {
    dispatch_source_cancel(v8);
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_63(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Flush request through %{public}@ complete but synchronization failed; reporting completion anyway.",
      (uint8_t *)&v10,
      0x16u);
  }
  v7 = *(NSObject **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)_queue_callToDelegateAndEnqueueForClientFlushRequest:(id)a3
{
  id v4;
  double unitTest_clientFlushRequestTimeoutOverride;
  int64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD handler[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[2];
  id v27;
  id v28;
  _QWORD aBlock[5];
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unitTest_clientFlushRequestTimeoutOverride = self->_unitTest_clientFlushRequestTimeoutOverride;
  if (unitTest_clientFlushRequestTimeoutOverride >= 0.0)
    v6 = (unint64_t)(unitTest_clientFlushRequestTimeoutOverride * 1000000000.0);
  else
    v6 = 1000000000;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke;
  aBlock[3] = &unk_1E37F21E0;
  aBlock[4] = self;
  v31 = v32;
  v8 = v4;
  v30 = v8;
  v9 = _Block_copy(aBlock);
  -[HKDataCollector delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_3;
    v25[3] = &unk_1E37E68A0;
    v11 = (id *)v26;
    v26[0] = v10;
    v26[1] = self;
    v27 = v8;
    v28 = v9;
    v12 = _Block_copy(v25);

    v13 = v27;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_flushRequests, "addObject:", v8);
      -[HKDataCollector _queue_considerSendingBatches](self, "_queue_considerSendingBatches");
      v14 = 0;
      goto LABEL_10;
    }
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_4;
    v21[3] = &unk_1E37E67E8;
    v11 = &v22;
    v22 = v10;
    v23 = v8;
    v24 = v9;
    v12 = _Block_copy(v21);

    v13 = v23;
  }

  v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v15 = dispatch_time(0, v6);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v16, v12);

  handler[0] = v7;
  handler[1] = 3221225472;
  handler[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_5;
  handler[3] = &unk_1E37E6838;
  v20 = v32;
  handler[4] = self;
  v19 = v8;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_resume(v14);

LABEL_10:
  _Block_object_dispose(v32, 8);

  return v14;
}

void __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[5];
  __int128 v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_2;
  block[3] = &unk_1E37E6838;
  block[4] = v1;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

uint64_t __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
}

void __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataCollector:didRequestCollectionThroughDate:completion:", v3, v4, *(_QWORD *)(a1 + 56));

}

void __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataCollectorDidRequestCollectionThroughDate:completion:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    _HKInitializeLogging();
    v2 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v1 + 32);
      v3 = *(void **)(v1 + 40);
      v5 = v2;
      objc_msgSend(v3, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to get data flushed through %{public}@ from client in a timely fashion. Continuing to flush data to healthd.", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 136), "addObject:", *(_QWORD *)(v1 + 40));
    return objc_msgSend(*(id *)(v1 + 32), "_queue_considerSendingBatches");
  }
  return result;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3D4C58);
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FB28);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_, 2, 0);

  return v2;
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  HKDataCollector *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
  -[HKDataCollector connectionInterrupted](self, "connectionInterrupted");
}

- (void)connectionInterrupted
{
  NSObject *queue;
  id unitTest_connectionInterruptedHandler;
  void (**v5)(void *, HKDataCollector *);
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HKDataCollector_connectionInterrupted__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(queue, block);
  unitTest_connectionInterruptedHandler = self->_unitTest_connectionInterruptedHandler;
  if (unitTest_connectionInterruptedHandler)
  {
    v5 = (void (**)(void *, HKDataCollector *))_Block_copy(unitTest_connectionInterruptedHandler);
    v5[2](v5, self);

  }
}

uint64_t __40__HKDataCollector_connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_queue_resetUnpersistedBatches");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateReconsiderationTimer");
}

- (id)exportedInterface
{
  return +[HKDataCollector clientInterface](HKDataCollector, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKDataCollector serverInterface](HKDataCollector, "serverInterface");
}

- (BOOL)_validateDatums:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HKQuantityType *quantityType;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HKQuantityType *v33;
  uint64_t v34;
  void *v35;
  HKQuantityType *v36;
  uint64_t v37;
  uint64_t v39;
  id *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v7)
  {
    v8 = v7;
    v40 = a4;
    v9 = 0;
    v10 = *(_QWORD *)v42;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        if (v12
          && !-[HKDataCollector _datumsInDateOrder:secondDatum:](self, "_datumsInDateOrder:secondDatum:", v12, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v11)))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v40, 3, CFSTR("Datums must be in date order. Incorrect date ranges for datums: (%@), (%@)"), v12, v13);
          v27 = 0;
          goto LABEL_27;
        }
        v9 = v13;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v40, 3, CFSTR("A valid %@ object is required."), objc_opt_class(), v39);
          goto LABEL_25;
        }
        quantityType = self->_quantityType;
        objc_msgSend(v9, "quantity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_unit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(quantityType) = -[HKQuantityType isCompatibleWithUnit:](quantityType, "isCompatibleWithUnit:", v16);

        if ((quantityType & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v40, 3, CFSTR("Quantity (%@) does not have a unit compatible with data stream quantity type %@"), v9, self->_quantityType);
          goto LABEL_25;
        }
        if (-[HKSampleType isMaximumDurationRestricted](self->_quantityType, "isMaximumDurationRestricted"))
        {
          objc_msgSend(v9, "dateInterval");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "duration");
          v19 = v18;
          -[HKSampleType maximumAllowedDuration](self->_quantityType, "maximumAllowedDuration");
          v21 = v20;

          if (v19 > v21)
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v9, "dateInterval");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateInterval");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "endDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = self->_quantityType;
            -[HKSampleType maximumAllowedDuration](v33, "maximumAllowedDuration");
            objc_msgSend(v28, "hk_assignError:code:format:", v40, 3, CFSTR("Duration between startDate (%@) and endDate (%@) is above the maximum allowed duration for this sample type. Maximum duration for type %@ is %f"), v30, v32, v33, v34);
            goto LABEL_24;
          }
        }
        if (-[HKSampleType isMinimumDurationRestricted](self->_quantityType, "isMinimumDurationRestricted"))
        {
          objc_msgSend(v9, "dateInterval");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "duration");
          v24 = v23;
          -[HKSampleType minimumAllowedDuration](self->_quantityType, "minimumAllowedDuration");
          v26 = v25;

          if (v24 < v26)
          {
            v35 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v9, "dateInterval");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateInterval");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "endDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = self->_quantityType;
            -[HKSampleType minimumAllowedDuration](v36, "minimumAllowedDuration");
            objc_msgSend(v35, "hk_assignError:code:format:", v40, 3, CFSTR("Duration between startDate (%@) and endDate (%@) is below the minimum allowed duration for this sample type. Minimum duration for type %@ is %f"), v30, v32, v36, v37);
LABEL_24:

LABEL_25:
            v27 = 0;
            goto LABEL_26;
          }
        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v8)
        continue;
      break;
    }
    v27 = 1;
LABEL_26:
    v12 = v9;
LABEL_27:

  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (BOOL)_datumsInDateOrder:(id)a3 secondDatum:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hk_isAfterDate:", v12) & 1) != 0 || (objc_msgSend(v10, "hk_isAfterDate:", v14) & 1) != 0)
    LOBYTE(v15) = 0;
  else
    v15 = objc_msgSend(v10, "hk_isAfterDate:", v12) ^ 1;

  return v15;
}

- (void)unitTest_setMaxDatumAgeOverride:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HKDataCollector_unitTest_setMaxDatumAgeOverride___block_invoke;
  v4[3] = &unk_1E37E8940;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

double __51__HKDataCollector_unitTest_setMaxDatumAgeOverride___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 88) = result;
  return result;
}

- (void)unitTest_setClientFlushRequestTimeoutOverride:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HKDataCollector_unitTest_setClientFlushRequestTimeoutOverride___block_invoke;
  v4[3] = &unk_1E37E8940;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

double __65__HKDataCollector_unitTest_setClientFlushRequestTimeoutOverride___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 96) = result;
  return result;
}

- (void)unitTest_setRegistrationCompleteHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HKDataCollector_unitTest_setRegistrationCompleteHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __59__HKDataCollector_unitTest_setRegistrationCompleteHandler___block_invoke(uint64_t a1)
{
  void (**v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void (***)(void))(a1 + 40);
  if (*(_QWORD *)(v3 + 72))
  {
    v2[2]();
  }
  else
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

  }
}

- (void)unitTest_setConnectionInterruptedHandler:(id)a3
{
  void *v4;
  id unitTest_connectionInterruptedHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  unitTest_connectionInterruptedHandler = self->_unitTest_connectionInterruptedHandler;
  self->_unitTest_connectionInterruptedHandler = v4;

}

- (void)unitTest_preSetStateHandler:(id)a3
{
  void *v4;
  id unitTest_preSetStateHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  unitTest_preSetStateHandler = self->_unitTest_preSetStateHandler;
  self->_unitTest_preSetStateHandler = v4;

}

- (id)unitTest_pendingBatches
{
  NSObject *queue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__38;
  v11 = __Block_byref_object_dispose__38;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HKDataCollector_unitTest_pendingBatches__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__HKDataCollector_unitTest_pendingBatches__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)unitTest_unconfirmedBatches
{
  NSObject *queue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__38;
  v11 = __Block_byref_object_dispose__38;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HKDataCollector_unitTest_unconfirmedBatches__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__HKDataCollector_unitTest_unconfirmedBatches__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)unitTest_unpersistedBatches
{
  NSObject *queue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__38;
  v11 = __Block_byref_object_dispose__38;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HKDataCollector_unitTest_unpersistedBatches__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__HKDataCollector_unitTest_unpersistedBatches__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HKDataCollectorState)state
{
  return self->_state;
}

- (HKQuantityType)quantityType
{
  return (HKQuantityType *)objc_getProperty(self, a2, 208, 1);
}

- (HKDevice)device
{
  return (HKDevice *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HKDataCollectorDelegate)delegate
{
  return (HKDataCollectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong(&self->_finishCompletion, 0);
  objc_storeStrong(&self->_resumeCompletion, 0);
  objc_storeStrong((id *)&self->_reconsiderationSource, 0);
  objc_storeStrong((id *)&self->_unpersistedBatchesByUUID, 0);
  objc_storeStrong((id *)&self->_unconfirmedBatchesByUUID, 0);
  objc_storeStrong((id *)&self->_pendingBatches, 0);
  objc_storeStrong((id *)&self->_flushRequests, 0);
  objc_storeStrong(&self->_unitTest_preSetStateHandler, 0);
  objc_storeStrong(&self->_unitTest_connectionInterruptedHandler, 0);
  objc_storeStrong(&self->_unitTest_registrationCompleteHandler, 0);
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_registrationUUID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_retryableOperation, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_5_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "%{public}@: Failed to initiate registration: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __36__HKDataCollector__queue_sendBatch___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_4_3(a1, a2);
  objc_msgSend(v2, "batchUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromUUID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_2_8(&dword_19A0E6000, v6, v7, "%{public}@: Batch %{public}@: Connection error sending batch, will retry: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3_4();
}

void __36__HKDataCollector__queue_sendBatch___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_4_3(a1, a2);
  objc_msgSend(v2, "batchUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromUUID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_2_8(&dword_19A0E6000, v6, v7, "%{public}@: Batch %{public}@: Unexpected fatal error sending batch; dropping: %{public}@",
    v8,
    v9,
    v10,
    v11,
    v12);

  OUTLINED_FUNCTION_3_4();
}

- (void)_prunedBatch:(NSObject *)a3 maximumLength:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "%{public}@: Error: Failed to find a completion block in batch to be pruned: %{public}@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
