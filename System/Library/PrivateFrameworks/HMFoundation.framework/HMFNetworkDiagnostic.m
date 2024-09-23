@implementation HMFNetworkDiagnostic

- (HMFNetworkDiagnostic)initWithDevice:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMFNetworkDiagnostic *v12;
  HMFNetworkDiagnostic *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMFNetworkDiagnostic;
  v12 = -[HMFNetworkDiagnostic init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (id)runWithDelay:(double)a3
{
  return +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue", a3);
}

- (id)run
{
  return +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
}

+ (id)runDiagnostics:(id)a3 timeout:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];

  v5 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__HMFNetworkDiagnostic_runDiagnostics_timeout___block_invoke;
  v11[3] = &unk_1E3B384D0;
  v11[4] = v12;
  objc_msgSend(v5, "na_map:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFFuture allSettled:](HMFFuture, "allSettled:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ignoreResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeout:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v12, 8);
  return v9;
}

double __47__HMFNetworkDiagnostic_runDiagnostics_timeout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double result;

  objc_msgSend(a2, "runWithDelay:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v3 + 24) + 1.0;
  *(double *)(v3 + 24) = result;
  return result;
}

- (void)stop
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v5, 0);

}

- (void)handleReceivedData:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v6, 0);

}

- (id)dumpReport
{
  return &stru_1E3B39EC0;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_3 != -1)
    dispatch_once(&_MergedGlobals_3_3, &__block_literal_global_14);
  return (id)qword_1ED012EC8;
}

void __35__HMFNetworkDiagnostic_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFNetworkDiagnostic"), CFSTR("com.apple.HomeKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012EC8;
  qword_1ED012EC8 = v0;

}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMFNetworkDiagnostic device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (HMFNetworkService)device
{
  return self->_device;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFNetworkDiagnosticDelegate)delegate
{
  return (HMFNetworkDiagnosticDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
