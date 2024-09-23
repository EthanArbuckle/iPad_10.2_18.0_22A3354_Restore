@implementation HMDBackgroundSystemTaskScheduler

- (BOOL)registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0D00E68];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "sharedScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__HMDBackgroundSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke;
  v15[3] = &unk_1E89A86E8;
  v16 = v7;
  v12 = v7;
  v13 = objc_msgSend(v11, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v10, v9, v15);

  return v13;
}

- (id)taskRequestForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  HMDBackgroundSystemTaskRequest *v9;

  v3 = (void *)MEMORY[0x1E0D00E68];
  v4 = a3;
  objc_msgSend(v3, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "taskRequestForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    v9 = -[HMDBackgroundSystemTaskRequest initWithTaskRequest:]([HMDBackgroundSystemTaskRequest alloc], "initWithTaskRequest:", v8);
  else
    v9 = 0;

  return v9;
}

- (BOOL)cancelTaskRequestWithIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0D00E68];
  v6 = a3;
  objc_msgSend(v5, "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "cancelTaskRequestWithIdentifier:error:", v6, a4);

  return (char)a4;
}

- (BOOL)submitTaskRequest:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D00E68];
  v6 = a3;
  objc_msgSend(v5, "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "taskRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v7, "submitTaskRequest:error:", v8, a4);
  return (char)a4;
}

void __91__HMDBackgroundSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDBackgroundSystemTask *v4;

  v3 = a2;
  v4 = -[HMDBackgroundSystemTask initWithUnderlyingTask:]([HMDBackgroundSystemTask alloc], "initWithUnderlyingTask:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
