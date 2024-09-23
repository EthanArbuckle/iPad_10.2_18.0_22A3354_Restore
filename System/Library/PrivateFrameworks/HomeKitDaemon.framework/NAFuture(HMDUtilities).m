@implementation NAFuture(HMDUtilities)

- (id)hmfFuture
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__NAFuture_HMDUtilities__hmfFuture__block_invoke;
  v9[3] = &unk_24E799520;
  v10 = v11;
  objc_msgSend(a1, "addSuccessBlock:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __35__NAFuture_HMDUtilities__hmfFuture__block_invoke_2;
  v7[3] = &unk_24E79BD80;
  v8 = v11;
  v5 = (id)objc_msgSend(v4, "addFailureBlock:", v7);

  return v2;
}

+ (id)futureWithRetries:()HMDUtilities timeInterval:workQueue:block:
{
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;

  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v11[2](v11, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reschedule:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke;
  v33[3] = &unk_24E799520;
  v17 = v12;
  v34 = v17;
  v18 = (id)objc_msgSend(v15, "addSuccessBlock:", v33);
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_2;
  v26[3] = &unk_24E77FE88;
  v30 = a4;
  v19 = v17;
  v31 = a2;
  v27 = v19;
  v28 = v10;
  v32 = a1;
  v29 = v11;
  v20 = v11;
  v21 = v10;
  v22 = (id)objc_msgSend(v15, "addFailureBlock:", v26);
  v23 = v29;
  v24 = v19;

  return v24;
}

+ (id)futureWithRetryIntervals:()HMDUtilities workQueue:block:
{
  id v8;
  id v9;
  void (**v10)(id, id);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, id);
  id v20;
  id v21;
  id v22;
  void (**v23)(id, id);
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  void (**v30)(id, id);
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v10[2](v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reschedule:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke;
  v32[3] = &unk_24E799520;
  v16 = v11;
  v33 = v16;
  v17 = (id)objc_msgSend(v14, "addSuccessBlock:", v32);
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_2;
  v26[3] = &unk_24E77FEB0;
  v27 = v8;
  v18 = v16;
  v28 = v18;
  v29 = v9;
  v30 = v10;
  v31 = a1;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  v22 = (id)objc_msgSend(v14, "addFailureBlock:", v26);
  v23 = v30;
  v24 = v18;

  return v24;
}

+ (id)combineAllFuturesFlatteningArrayResults:()HMDUtilities
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE6B608];
  v4 = (void *)MEMORY[0x24BE6B628];
  v5 = a3;
  objc_msgSend(v4, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:scheduler:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "flatMap:", &__block_literal_global_711);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)combineAllFuturesIgnoringEmptyResults:()HMDUtilities
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE6B608];
  v4 = (void *)MEMORY[0x24BE6B628];
  v5 = a3;
  objc_msgSend(v4, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:scheduler:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "flatMap:", &__block_literal_global_714);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
