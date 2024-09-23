@implementation HMDHAPAccessoryPrimaryResidentOperationTask

- (HMDHAPAccessoryPrimaryResidentOperationTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHAPAccessoryPrimaryResidentOperationTask;
  return -[HMDHAPAccessoryTask initWithContext:requests:completion:](&v6, sel_initWithContext_requests_completion_, a3, a4, a5);
}

- (void)execute
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask setExecutionTime:](self, "setExecutionTime:", v3);

  v4 = dispatch_group_create();
  -[HMDHAPAccessoryTask requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryPrimaryResidentOperationTask _processLocalRequests:responseWaitGroup:](self, "_processLocalRequests:responseWaitGroup:", v5, v4);
  -[HMDHAPAccessoryTask workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_group_notify(v4, v6, block);

}

- (void)_processLocalRequests:(id)a3 responseWaitGroup:(id)a4
{
  id *v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  _Unwind_Exception *v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[5];
  id location[4];
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke;
  v29[3] = &unk_24E79AA10;
  v29[4] = self;
  v12 = v9;
  v13 = v10;
  v14 = v29;
  if (v12 == v13)
  {
    v22 = (_Unwind_Exception *)_HMFPreconditionFailure();
    objc_destroyWeak(v4);
    objc_destroyWeak(location);
    _Unwind_Resume(v22);
  }
  location[0] = v11;
  location[1] = (id)3221225472;
  location[2] = __migrateRequestsPassingTest_block_invoke;
  location[3] = &unk_24E79AEE0;
  v31 = v14;
  objc_msgSend(v12, "indexesOfObjectsPassingTest:", location);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectsAtIndexes:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v16);

  objc_msgSend(v12, "removeObjectsAtIndexes:", v15);
  if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicResponse responsesWithRequests:error:](HMDCharacteristicResponse, "responsesWithRequests:error:", v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHAPAccessoryTask completion](self, "completion");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v19)[2](v19, v18);

  }
  if ((objc_msgSend(v12, "hmf_isEmpty") & 1) == 0)
  {
    dispatch_group_enter(v8);
    objc_initWeak(location, self);
    v23 = v11;
    v24 = 3221225472;
    v25 = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_360;
    v26 = &unk_24E79AE08;
    objc_copyWeak(&v28, location);
    v27 = v8;
    -[HMDHAPAccessoryPrimaryResidentOperationTask _makeLocalTaskWithRequests:completion:](self, "_makeLocalTaskWithRequests:completion:", v12, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryPrimaryResidentOperationTask setLocalTask:](self, "setLocalTask:", v20, v23, v24, v25, v26);

    -[HMDHAPAccessoryPrimaryResidentOperationTask localTask](self, "localTask");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "execute");

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }

}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (NSMutableArray)remoteFallbackTasks
{
  return self->_remoteFallbackTasks;
}

- (void)setRemoteFallbackTasks:(id)a3
{
  objc_storeStrong((id *)&self->_remoteFallbackTasks, a3);
}

- (HMDHAPAccessoryTask)localTask
{
  return self->_localTask;
}

- (void)setLocalTask:(id)a3
{
  objc_storeStrong((id *)&self->_localTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTask, 0);
  objc_storeStrong((id *)&self->_remoteFallbackTasks, 0);
}

uint64_t __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  unint64_t v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRemote")
    && objc_msgSend(v6, "hasBTLELink")
    && (objc_msgSend(v6, "hasIPLink") & 1) == 0)
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("kAccessoriesListKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kAccessoryLinkQuality"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kAccessoryLastSeen"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (v13 && v17)
    {
      v36 = 0;
      objc_msgSend(v6, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 5;
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v32 = v18;
      objc_msgSend(v18, "retrieveStateForTrackedAccessory:stateNumber:isReachable:linkQuality:lastSeen:", v19, 0, &v36, &v35, &v34);
      v33 = v34;

      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferenceForKey:", CFSTR("BTLEAccessoryLossDetectionTimeInSec"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      if (v36
        || (v24 = objc_msgSend(v13, "integerValue"), v24 >= v35)
        || objc_msgSend(v17, "unsignedIntegerValue") >= v23)
      {

        v7 = 0;
      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v35);
          v31 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "shortDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544898;
          v38 = v27;
          v39 = 2112;
          v40 = v3;
          v41 = 2112;
          v42 = v13;
          v43 = 2112;
          v44 = v17;
          v45 = 2112;
          v46 = v28;
          v47 = 2112;
          v48 = v33;
          v49 = 2112;
          v50 = v29;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic request: %@, accessory has a better link quality: %@(%@s) / %@(%@s) to the device originating message: %@", buf, 0x48u);

          v25 = v31;
        }

        objc_autoreleasePoolPop(v25);
        objc_msgSend(v6, "workQueue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "retrieveHAPAccessoryForHMDAccessory:linkType:forceRetrieve:queue:completion:", v6, 2, 0, v30, 0);

        v7 = 1;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_360(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addCharacteristicResponses:", v3);
    objc_msgSend(v5, "localTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8 && objc_msgSend(v8, "allResponsesReceived"))
    {
      if (objc_msgSend(v5, "supportsMultiPartResponse")
        && (objc_msgSend(v5, "allResponsesReceived") & 1) == 0)
      {
        objc_msgSend(v5, "completion");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v9)[2](v9, v3);

      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else if (objc_msgSend(v5, "supportsMultiPartResponse"))
    {
      objc_msgSend(v5, "completion");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v10)[2](v10, v3);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for local task completion handler", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicResponses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2);

}

@end
