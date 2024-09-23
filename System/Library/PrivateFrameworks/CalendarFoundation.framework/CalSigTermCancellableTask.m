@implementation CalSigTermCancellableTask

+ (BOOL)performCancellableTask:(id)a3
{
  void (**v3)(id, void *);
  CalSignalSensor *v4;
  CalSignalSensor *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void (**)(id, void *))a3;
  v4 = -[CalSignalSensor initWithSignal:]([CalSignalSensor alloc], "initWithSignal:", 15);
  v5 = -[CalSignalSensor initWithSignal:]([CalSignalSensor alloc], "initWithSignal:", 2);
  v6 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__CalSigTermCancellableTask_performCancellableTask___block_invoke;
  v11[3] = &unk_1E2A84518;
  v12 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x19400A168](v11);
  -[CalSignalSensor setFireBlock:](v4, "setFireBlock:", v8);
  -[CalSignalSensor setFireBlock:](v5, "setFireBlock:", v8);
  -[CalSignalSensor startSensor](v4, "startSensor");
  -[CalSignalSensor startSensor](v5, "startSensor");
  objc_msgSend(v7, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v9);

  -[CalSignalSensor stopSensor](v4, "stopSensor");
  -[CalSignalSensor stopSensor](v5, "stopSensor");
  LOBYTE(v3) = objc_msgSend(v9, "isCancelled");

  return (char)v3;
}

uint64_t __52__CalSigTermCancellableTask_performCancellableTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
