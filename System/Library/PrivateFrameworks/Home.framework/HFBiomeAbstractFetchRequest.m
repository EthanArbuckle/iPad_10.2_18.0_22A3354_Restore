@implementation HFBiomeAbstractFetchRequest

- (HFBiomeAbstractFetchRequest)initWithHome:(id)a3
{
  id v5;
  HFBiomeAbstractFetchRequest *v6;
  HFBiomeAbstractFetchRequest *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  BMHomeKitClientAccessoryControlStream *v12;
  BMHomeKitClientAccessoryControlStream *accessoryControlStream;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFBiomeAbstractFetchRequest;
  v6 = -[HFBiomeAbstractFetchRequest init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Home.biomefetchrequest", v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

    v12 = (BMHomeKitClientAccessoryControlStream *)objc_alloc_init(MEMORY[0x1E0D02658]);
    accessoryControlStream = v7->_accessoryControlStream;
    v7->_accessoryControlStream = v12;

  }
  return v7;
}

- (HFBiomeAbstractFetchRequest)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFBiomeAbstractFetchRequest.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFBiomeAbstractFetchRequest init]",
    v5);

  return 0;
}

- (BOOL)publisherFilter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;

  objc_msgSend(a3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_11;
  -[HFBiomeAbstractFetchRequest home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_11;
  -[HFBiomeAbstractFetchRequest room](self, "room");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[HFBiomeAbstractFetchRequest room](self, "room");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roomUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (!v17)
      goto LABEL_11;
  }
  -[HFBiomeAbstractFetchRequest zone](self, "zone");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v4, "zoneUniqueIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFBiomeAbstractFetchRequest zone](self, "zone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v20, "containsObject:", v23);

    if (!v24)
      goto LABEL_11;
  }
  -[HFBiomeAbstractFetchRequest accessory](self, "accessory");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_9;
  v26 = (void *)v25;
  -[HFBiomeAbstractFetchRequest accessory](self, "accessory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uniqueIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryUniqueIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "isEqualToString:", v30);

  if (v31)
  {
LABEL_9:
    -[HFBiomeAbstractFetchRequest service](self, "service");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      -[HFBiomeAbstractFetchRequest service](self, "service");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceUniqueIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToString:", v37);

    }
    else
    {
      v38 = 1;
    }
  }
  else
  {
LABEL_11:
    v38 = 0;
  }

  return v38;
}

- (id)successHandler
{
  return 0;
}

- (void)_fetchWithPromise:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  -[HFBiomeAbstractFetchRequest accessoryControlStream](self, "accessoryControlStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publisherFromStartTime:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke;
  v19[3] = &unk_1EA734618;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v9, "filterWithIsIncluded:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2;
  v16[3] = &unk_1EA734640;
  v12 = v4;
  v17 = v12;
  objc_copyWeak(&v18, &location);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_3;
  v14[3] = &unk_1EA734668;
  objc_copyWeak(&v15, &location);
  v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v16, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

uint64_t __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "publisherFilter:", v3);

  return v5;
}

void __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[HFBiomeAbstractFetchRequest _fetchWithPromise:]_block_invoke_2";
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_9;
    block[3] = &unk_1EA727188;
    v13 = *(id *)(a1 + 32);
    v14 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v5 = v13;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "successHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2_11;
    v9[3] = &unk_1EA727188;
    v10 = v7;
    v11 = *(id *)(a1 + 32);
    v5 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_9(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2_11(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "finishWithResult:");
  else
    return objc_msgSend(v1, "finishWithNoResult");
}

void __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1DF0DABF0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventHandler:", v5);

  objc_autoreleasePoolPop(v3);
}

- (id)fetch
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__HFBiomeAbstractFetchRequest_fetch__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __36__HFBiomeAbstractFetchRequest_fetch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = +[HFUtilities isInternalTest](HFUtilities, "isInternalTest");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_fetchWithPromise:", v3);
  }
  else
  {
    objc_msgSend(v5, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__HFBiomeAbstractFetchRequest_fetch__block_invoke_2;
    v7[3] = &unk_1EA727188;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __36__HFBiomeAbstractFetchRequest_fetch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWithPromise:", *(_QWORD *)(a1 + 40));
}

- (HMHome)home
{
  return (HMHome *)objc_getProperty(self, a2, 8, 1);
}

- (HMRoom)room
{
  return (HMRoom *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRoom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMZone)zone
{
  return (HMZone *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMService)service
{
  return (HMService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BMHomeKitClientAccessoryControlStream)accessoryControlStream
{
  return (BMHomeKitClientAccessoryControlStream *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryControlStream, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
