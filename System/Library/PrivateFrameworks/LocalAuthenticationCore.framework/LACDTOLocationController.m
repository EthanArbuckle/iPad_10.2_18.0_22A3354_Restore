@implementation LACDTOLocationController

- (LACDTOLocationController)initWithLocationProvider:(id)a3 monitor:(id)a4 workQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTOLocationController *v12;
  LACDTOLocationController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOLocationController;
  v12 = -[LACDTOLocationController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationProvider, a3);
    objc_storeStrong((id *)&v13->_monitor, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
    -[LACDTOLocationMonitor setDelegate:](v13->_monitor, "setDelegate:", v13);
  }

  return v13;
}

- (void)setLocationState:(id)a3
{
  id v5;
  NSObject *v6;
  LACDTOLocationState **p_locationState;
  LACDTOLocationState *v8;
  _BOOL4 v9;
  NSObject *v10;
  LACDTOEvent *v11;
  void *v12;
  int v13;
  LACDTOLocationController *v14;
  __int16 v15;
  LACDTOLocationState *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[LACDTOLocationController workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  p_locationState = &self->_locationState;
  if (!-[LACDTOLocationState isEqual:](self->_locationState, "isEqual:", v5))
  {
    v8 = *p_locationState;
    objc_storeStrong((id *)&self->_locationState, a3);
    if (v8)
    {
      v9 = -[LACDTOLocationState isInFamiliarLocation](v8, "isInFamiliarLocation");
      if (v9 != -[LACDTOLocationState isInFamiliarLocation](*p_locationState, "isInFamiliarLocation"))
      {
        LACLogDTOState();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138543874;
          v14 = self;
          v15 = 2112;
          v16 = v8;
          v17 = 2112;
          v18 = v5;
          _os_log_impl(&dword_2409DC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ DSLMode changed from: %@ to %@", (uint8_t *)&v13, 0x20u);
        }

        v11 = -[LACDTOEvent initWithRawValue:value:]([LACDTOEvent alloc], "initWithRawValue:value:", 1, v5);
        -[LACDTOLocationController eventBus](self, "eventBus");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dispatchEvent:sender:", v11, self);

      }
    }

  }
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  LACDTOLocationProvider *locationProvider;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  LACDTOLocationController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LACDTOLocationController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  LACLogDTOLocation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  locationProvider = self->_locationProvider;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__LACDTOLocationController_checkIsInFamiliarLocationWithCompletion___block_invoke;
  v9[3] = &unk_2510C0C10;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  -[LACDTOLocationProvider checkIsInFamiliarLocationWithCompletion:](locationProvider, "checkIsInFamiliarLocationWithCompletion:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __68__LACDTOLocationController_checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLocation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(WeakRetained, "setLocationState:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)pendingEvaluationControllerDidStartTrackingPendingEvaluations:(id)a3
{
  -[LACDTOLocationMonitor startMonitoringWithReason:](self->_monitor, "startMonitoringWithReason:", CFSTR("Pending evaluations detected"));
}

- (void)pendingEvaluationControllerDidStopTrackingPendingEvaluations:(id)a3
{
  -[LACDTOLocationMonitor stopMonitoringWithReason:](self->_monitor, "stopMonitoringWithReason:", CFSTR("Pending evaluations finished"));
}

- (void)locationMonitor:(id)a3 didReceiveLocationState:(id)a4
{
  if (self->_monitor == a3)
    -[LACDTOLocationController setLocationState:](self, "setLocationState:", a4);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
  objc_storeStrong((id *)&self->eventBus, a3);
}

- (LACDTOLocationState)locationState
{
  return self->_locationState;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->eventBus, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end
