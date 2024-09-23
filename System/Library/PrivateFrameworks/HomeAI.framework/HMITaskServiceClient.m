@implementation HMITaskServiceClient

- (HMITaskServiceClient)init
{
  HMITaskServiceClient *v2;
  void *v3;
  id v4;
  uint64_t v5;
  VCPHomeKitAnalysisService *remote;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)HMITaskServiceClient;
  v2 = -[HMITaskService initPrivate](&v8, sel_initPrivate);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getVCPHomeKitAnalysisServiceClass_softClass;
    v13 = getVCPHomeKitAnalysisServiceClass_softClass;
    if (!getVCPHomeKitAnalysisServiceClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getVCPHomeKitAnalysisServiceClass_block_invoke;
      v9[3] = &unk_24DBE9EA0;
      v9[4] = &v10;
      __getVCPHomeKitAnalysisServiceClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v4, "analysisService");
    v5 = objc_claimAutoreleasedReturnValue();
    remote = v2->_remote;
    v2->_remote = (VCPHomeKitAnalysisService *)v5;

  }
  return v2;
}

- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMITaskServiceClient *v15;
  NSObject *v16;
  void *v17;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Progress handler is not available in the client task service."), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v11 = v10;
  -[HMITaskServiceClient remote](self, "remote");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "requestResidentMaintenanceWithOptions:andCompletionHandler:", v8, v11);

  if (v13 == -1)
  {
    v14 = (void *)MEMORY[0x220735570]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@requestResidentMaintenanceWithOptions failed", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

  return v13;
}

- (BOOL)cancelTask:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[HMITaskServiceClient remote](self, "remote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequest:", v3);

  return 1;
}

- (VCPHomeKitAnalysisService)remote
{
  return (VCPHomeKitAnalysisService *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remote, 0);
}

@end
