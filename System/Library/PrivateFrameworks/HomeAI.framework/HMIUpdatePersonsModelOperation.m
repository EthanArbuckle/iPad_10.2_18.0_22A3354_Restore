@implementation HMIUpdatePersonsModelOperation

- (HMIUpdatePersonsModelOperation)initWithSourceUUID:(id)a3 homeUUID:(id)a4 external:(BOOL)a5
{
  id v9;
  id v10;
  HMIUpdatePersonsModelOperation *v11;
  HMIUpdatePersonsModelOperation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIUpdatePersonsModelOperation;
  v11 = -[HMFOperation initWithTimeout:](&v14, sel_initWithTimeout_, 300.0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceUUID, a3);
    objc_storeStrong((id *)&v12->_homeUUID, a4);
    v12->_external = a5;
  }

  return v12;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIUpdatePersonsModelOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)mainInsideAutoreleasePool
{
  -[HMIUpdatePersonsModelOperation updatePersonsModelWithRetryOnError:](self, "updatePersonsModelWithRetryOnError:", 1);
}

- (void)updatePersonsModelWithRetryOnError:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMIUpdatePersonsModelOperation *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  id location;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  +[HMITaskService taskServiceClient](HMITaskService, "taskServiceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = HMITaskTypeUpdatePersonsModelTask;
  v26[0] = CFSTR("taskType");
  v26[1] = CFSTR("sourceUUID");
  -[HMIUpdatePersonsModelOperation sourceUUID](self, "sourceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  v26[2] = CFSTR("homeUUID");
  -[HMIUpdatePersonsModelOperation homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  v26[3] = CFSTR("isExternal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMIUpdatePersonsModelOperation external](self, "external"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__HMIUpdatePersonsModelOperation_updatePersonsModelWithRetryOnError___block_invoke;
  v16[3] = &unk_24DBECE60;
  objc_copyWeak(&v17, &location);
  v18 = a3;
  v10 = objc_msgSend(v5, "submitTaskWithOptions:progressHandler:completionHandler:", v9, 0, v16);
  v11 = (void *)MEMORY[0x220735570]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v14;
    v22 = 1024;
    v23 = v10;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitted persons model update task, taskID:%u, retryOnError:%@", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v11);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __69__HMIUpdatePersonsModelOperation_updatePersonsModelWithRetryOnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMITaskResultCodeAsString(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v11 = (void *)MEMORY[0x220735570]();
      v12 = WeakRetained;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v14;
        _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully updated persons model", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v12, "finish");
    }
    else
    {
      v15 = *(unsigned __int8 *)(a1 + 40);
      v16 = (void *)MEMORY[0x220735570]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543618;
          v23 = v20;
          v24 = 2112;
          v25 = v6;
          _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to update persons model, error:%@, retrying...", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v17, "updatePersonsModelWithRetryOnError:", 0);
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543618;
          v23 = v21;
          v24 = 2112;
          v25 = v6;
          _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update persons model, error:%@", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v17, "cancelWithError:", v6);
      }
    }

  }
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIUpdatePersonsModelOperation sourceUUID](self, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMIUpdatePersonsModelOperation external](self, "external");
  v6 = CFSTR("home");
  if (v5)
    v6 = CFSTR("external");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (BOOL)external
{
  return self->_external;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
