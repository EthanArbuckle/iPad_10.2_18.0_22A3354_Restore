@implementation HKWorkoutControl

- (HKWorkoutControl)initWithHealthStore:(id)a3
{
  id v4;
  HKWorkoutControl *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutControl;
  v5 = -[HKWorkoutControl init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)finishAllWorkoutsWithCompletion:(id)a3
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
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke;
  v10[3] = &unk_1E37EC4A8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_finishAllWorkoutsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateWorkoutMarkerWithCompletion:(id)a3
{
  -[HKWorkoutControl generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:](self, "generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:", 0, a3);
}

- (void)generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  HKProxyProvider *proxyProvider;
  uint64_t v9;
  void *v10;
  HKProxyProvider *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  HKWorkoutControl *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Pause/resume event requested.", buf, 0xCu);
  }
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke;
  v18[3] = &unk_1E37E67C0;
  v18[4] = self;
  v19 = v6;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_proxyProvider;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_7;
  v15[3] = &unk_1E37EC4D0;
  v17 = a3;
  v16 = v10;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v14 = v16;
  v12 = v16;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v11, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

void __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  v7 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a2)
  {
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v9;
      v10 = "%{public}@: Generated pause or resume request";
      v11 = v6;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v7)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138543618;
    v15 = v13;
    v16 = 2114;
    v17 = v5;
    v10 = "%{public}@: Pause/resume event generation failed: %{public}@";
    v11 = v6;
    v12 = 22;
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v8);

}

uint64_t __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  void *v8;
  HKProxyProvider *proxyProvider;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  int64_t v16;
  double v17;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke;
  v14[3] = &unk_1E37EC4F8;
  v16 = a3;
  v17 = a4;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v15;
  v11 = v15;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_generateFakeDataForActivityType:minutes:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
}

uint64_t __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generatePauseOrResumeRequest:(id)a3
{
  -[HKWorkoutControl generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:](self, "generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:", 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
