@implementation LACDTOSensorRepairStateProviderCRAdapter

- (LACDTOSensorRepairStateProviderCRAdapter)initWithReplyQueue:(id)a3
{
  id v5;
  LACDTOSensorRepairStateProviderCRAdapter *v6;
  LACDTOSensorRepairStateProviderCRAdapter *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOSensorRepairStateProviderCRAdapter;
  v6 = -[LACDTOSensorRepairStateProviderCRAdapter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2409DC000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ will dealloc", (uint8_t *)&v2, 0xCu);
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke;
  block[3] = &unk_2510C1B50;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_2;
    v4[3] = &unk_2510C1B28;
    objc_copyWeak(&v6, v2);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_fetchRepairStateWithCompletion:", v4);

    objc_destroyWeak(&v6);
  }

}

void __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_3;
    v10[3] = &unk_2510C1B00;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v14);
  }

}

void __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v3;
  }

}

- (void)_fetchRepairStateWithCompletion:(id)a3
{
  void (**v4)(id, LACDTOMutableSensorRepairState *, _QWORD);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  LACDTOMutableSensorRepairState *v13;
  NSObject *v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, LACDTOMutableSensorRepairState *, _QWORD))a3;
  if (!CoreRepairCoreLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)v15 = xmmword_2510C1B70;
    *(_QWORD *)&v15[16] = 0;
    CoreRepairCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreRepairCoreLibraryCore_frameworkLibrary && getCRIsSelfRepairedComponentSymbolLoc())
  {
    LACLogDTOSensor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 138543362;
      *(_QWORD *)&v15[4] = self;
      _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start self-repair query", v15, 0xCu);
    }

    +[LACDTOSignpostEvent repairStatusQueryWillStart](LACDTOSignpostEvent, "repairStatusQueryWillStart");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "send");

    __76__LACDTOSensorRepairStateProviderCRAdapter__fetchRepairStateWithCompletion___block_invoke();
    v8 = v7;
    +[LACDTOSignpostEvent repairStatusQueryDidFinish](LACDTOSignpostEvent, "repairStatusQueryDidFinish");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "send");

    LACLogDTOSensor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v15 = 138543618;
      *(_QWORD *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2112;
      *(_QWORD *)&v15[14] = v11;
      _os_log_impl(&dword_2409DC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish self-repair query with result %@", v15, 0x16u);

    }
    if ((_DWORD)v8)
      v12 = 3;
    else
      v12 = 0;
    v13 = -[LACDTOMutableSensorRepairState initWithFlag:]([LACDTOMutableSensorRepairState alloc], "initWithFlag:", v12);
    v4[2](v4, v13, 0);
  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("Required Core Repair dependency was not found"), *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    v13 = (LACDTOMutableSensorRepairState *)objc_claimAutoreleasedReturnValue();
    LACLogDTOSensor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[LACDTOSensorRepairStateProviderCRAdapter _fetchRepairStateWithCompletion:].cold.1((uint64_t)self, (uint64_t)v13, v14);

    ((void (**)(id, LACDTOMutableSensorRepairState *, LACDTOMutableSensorRepairState *))v4)[2](v4, 0, v13);
  }

}

void __76__LACDTOSensorRepairStateProviderCRAdapter__fetchRepairStateWithCompletion___block_invoke()
{
  if (+[LACMobileGestalt deviceHasFaceID](LACMobileGestalt, "deviceHasFaceID"))
  {
    soft_CRIsSelfRepairedComponent(1027);
  }
  else if (+[LACMobileGestalt deviceHasTouchID](LACMobileGestalt, "deviceHasTouchID"))
  {
    soft_CRIsSelfRepairedComponent(1028);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_fetchRepairStateWithCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
