@implementation HMIAnalysisStateManager

- (HMIAnalysisStateManager)initWithHomeUUID:(id)a3
{
  id v4;
  HMIAnalysisStateManager *v5;
  uint64_t v6;
  NSUUID *homeUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIAnalysisStateManager;
  v5 = -[HMIAnalysisStateManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v6;

  }
  return v5;
}

- (void)publishLocalState:(id)a3
{
  id v4;
  void *v5;
  HMIAnalysisStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Publishing local state", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIAnalysisStateManager delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stateManager:didReceiveLocalUpdate:", v6, v4);

}

- (void)handleRemoteStateUpdate:(id)a3
{
  -[HMIAnalysisStateManager handleRemoteStateUpdate:completionHandler:](self, "handleRemoteStateUpdate:completionHandler:", a3, &__block_literal_global_20);
}

- (void)handleRemoteStateUpdate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMIAnalysisStateManager *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HMIAnalysisStateManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  HMIAnalysisStateManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[3];
  _QWORD v38[3];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldEnableTorsoRecognition");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "torsoAnnotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_filter:", &__block_literal_global_38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "torsoAnnotations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = objc_msgSend(v11, "count");

    if (v13 == v14)
      goto LABEL_10;
    v15 = (void *)MEMORY[0x220735570]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "torsoAnnotations");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v34, "count");
      v20 = v19 - objc_msgSend(v11, "count");
      objc_msgSend(v6, "torsoAnnotations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v18;
      v41 = 2048;
      v42 = v20;
      v43 = 2048;
      v44 = objc_msgSend(v21, "count");
      _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropped %lu incompatible torsoprint annotations out of %lu total", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    if (!objc_msgSend(v11, "hmf_isEmpty"))
    {
LABEL_10:
      +[HMITaskService taskServiceClient](HMITaskService, "taskServiceClient");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = HMITaskTypeUpdateTorsoModelTask;
      v37[0] = CFSTR("taskType");
      v37[1] = CFSTR("homeUUID");
      -[HMIAnalysisStateManager homeUUID](self, "homeUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = CFSTR("torsoAnnotations");
      v38[1] = v27;
      v38[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __69__HMIAnalysisStateManager_handleRemoteStateUpdate_completionHandler___block_invoke_42;
      v35[3] = &unk_24DBEC2A8;
      v35[4] = self;
      v36 = v7;
      v29 = objc_msgSend(v26, "submitTaskWithOptions:progressHandler:completionHandler:", v28, 0, v35);
      v30 = (void *)MEMORY[0x220735570]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        v41 = 1024;
        LODWORD(v42) = v29;
        _os_log_impl(&dword_219D45000, v32, OS_LOG_TYPE_INFO, "%{public}@Submitted torso model update task, taskID:%u", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v30);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x220735570]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Dropping remote analysis torso update since torso rec is not enabled on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }

}

uint64_t __69__HMIAnalysisStateManager_handleRemoteStateUpdate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "torsoModelVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMITorsoprinter currentModelUUID](HMITorsoprinter, "currentModelUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

void __69__HMIAnalysisStateManager_handleRemoteStateUpdate_completionHandler___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMITaskResultCodeAsString(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = (void *)MEMORY[0x220735570]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v14;
      v15 = "%{public}@Successfully update torso model";
      v16 = v13;
      v17 = OS_LOG_TYPE_INFO;
      v18 = 12;
LABEL_6:
      _os_log_impl(&dword_219D45000, v16, v17, v15, (uint8_t *)&v21, v18);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v14;
    v23 = 2112;
    v24 = v6;
    v15 = "%{public}@Error in update torso model, error:%@";
    v16 = v13;
    v17 = OS_LOG_TYPE_ERROR;
    v18 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, v19, v20);

}

- (id)stateUpdateFromFaceEvents:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HMIAnalysisStateUpdate *v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a3, "na_map:", &__block_literal_global_45);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
    v6 = -[HMIAnalysisStateUpdate initWithTorsoAnnotations:]([HMIAnalysisStateUpdate alloc], "initWithTorsoAnnotations:", v5);
  else
    v6 = 0;

  return v6;
}

uint64_t __53__HMIAnalysisStateManager_stateUpdateFromFaceEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "torsoAnnotation");
}

- (HMIAnalysisStateManagerDelegate)delegate
{
  return (HMIAnalysisStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
