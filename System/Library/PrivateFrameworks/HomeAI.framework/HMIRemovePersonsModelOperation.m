@implementation HMIRemovePersonsModelOperation

- (HMIRemovePersonsModelOperation)initWithSourceUUID:(id)a3 homeUUID:(id)a4 external:(BOOL)a5
{
  id v9;
  id v10;
  HMIRemovePersonsModelOperation *v11;
  HMIRemovePersonsModelOperation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIRemovePersonsModelOperation;
  v11 = -[HMFOperation initWithTimeout:](&v14, sel_initWithTimeout_, 10.0);
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
  -[HMIRemovePersonsModelOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)mainInsideAutoreleasePool
{
  -[HMIRemovePersonsModelOperation removePersonsModelWithRetryOnError:](self, "removePersonsModelWithRetryOnError:", 1);
}

- (void)removePersonsModelWithRetryOnError:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMIRemovePersonsModelOperation *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  id location;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  +[HMITaskService taskServiceClient](HMITaskService, "taskServiceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = HMITaskTypeRemovePersonsModelTask;
  v25[0] = CFSTR("taskType");
  v25[1] = CFSTR("homeUUID");
  -[HMIRemovePersonsModelOperation homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v6;
  v25[2] = CFSTR("sourceUUID");
  -[HMIRemovePersonsModelOperation sourceUUID](self, "sourceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__HMIRemovePersonsModelOperation_removePersonsModelWithRetryOnError___block_invoke;
  v15[3] = &unk_24DBECE60;
  objc_copyWeak(&v16, &location);
  v17 = a3;
  v9 = objc_msgSend(v5, "submitTaskWithOptions:progressHandler:completionHandler:", v8, 0, v15);
  v10 = (void *)MEMORY[0x220735570]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v13;
    v21 = 1024;
    v22 = v9;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@Submitted persons model remove task, taskID:%u, retryOnError:%@", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v10);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __69__HMIRemovePersonsModelOperation_removePersonsModelWithRetryOnError___block_invoke(uint64_t a1, void *a2, void *a3)
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
        _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully removed persons model", (uint8_t *)&v22, 0xCu);

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
          _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to remove persons model, error:%@, retrying...", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v17, "removePersonsModelWithRetryOnError:", 0);
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
          _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove persons model, error:%@", (uint8_t *)&v22, 0x16u);

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
  -[HMIRemovePersonsModelOperation sourceUUID](self, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMIRemovePersonsModelOperation external](self, "external");
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
