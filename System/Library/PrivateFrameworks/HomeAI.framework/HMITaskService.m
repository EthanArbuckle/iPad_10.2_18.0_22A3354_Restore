@implementation HMITaskService

+ (id)taskService
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HMITaskService_taskService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (taskService_onceToken != -1)
    dispatch_once(&taskService_onceToken, block);
  return (id)taskService_server;
}

void __29__HMITaskService_taskService__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  HMITaskServiceServer *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x220735570]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_219D45000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing HMITaskServiceServer", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_alloc_init(HMITaskServiceServer);
  v7 = (void *)taskService_server;
  taskService_server = (uint64_t)v6;

}

+ (id)taskServiceClient
{
  void *v3;
  char v4;
  _QWORD v6[5];
  char v7;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLPreferenceForKey:defaultValue:", CFSTR("taskServiceRunLocally"), 0);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__HMITaskService_taskServiceClient__block_invoke;
  v6[3] = &__block_descriptor_41_e5_v8__0l;
  v7 = v4;
  v6[4] = a1;
  if (taskServiceClient_onceToken != -1)
    dispatch_once(&taskServiceClient_onceToken, v6);
  return (id)taskServiceClient_client;
}

void __35__HMITaskService_taskServiceClient__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  HMITaskServiceClient *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = (void *)MEMORY[0x220735570]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@RUNNING TASK SERVICE LOCALLY: returning taskService", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    +[HMITaskService taskService](HMITaskService, "taskService");
    v8 = (HMITaskServiceClient *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Initializing HMITaskServiceClient", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v8 = objc_alloc_init(HMITaskServiceClient);
  }
  v10 = (void *)taskServiceClient_client;
  taskServiceClient_client = (uint64_t)v8;

}

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMITaskService;
  return -[HMITaskService init](&v3, sel_init);
}

- (int)submitTaskWithOptions:(id)a3 completionHandler:(id)a4
{
  return -[HMITaskService submitTaskWithOptions:progressHandler:completionHandler:](self, "submitTaskWithOptions:progressHandler:completionHandler:", a3, 0, a4);
}

- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (BOOL)cancelTask:(int)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (int)submitTask:(id)a3 progressHandler:(id)a4 completionHander:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

@end
