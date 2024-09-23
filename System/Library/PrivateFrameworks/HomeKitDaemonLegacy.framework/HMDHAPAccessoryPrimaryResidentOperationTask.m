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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD block[5];
  _QWORD v18[4];
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask setExecutionTime:](self, "setExecutionTime:", v3);

  v4 = dispatch_group_create();
  -[HMDHAPAccessoryTask requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  migrateRequestsPassingTest(v6, v7, &__block_literal_global_364);
  objc_msgSend(v6, "na_map:", &__block_literal_global_366_180550);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "residentMapForAccessories:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "filterAccessoriesByDevicesFromMap:currentDeviceAccessories:otherDeviceAccessories:", v10, v11, v12);
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_3;
  v18[3] = &unk_1E89C1858;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  migrateRequestsPassingTest(v6, v7, v18);
  -[HMDHAPAccessoryPrimaryResidentOperationTask _fanOutRemoteRequests:residentToAccessoriesMap:responseWaitGroup:](self, "_fanOutRemoteRequests:residentToAccessoriesMap:responseWaitGroup:", v6, v10, v4);
  -[HMDHAPAccessoryPrimaryResidentOperationTask _processLocalRequests:responseWaitGroup:](self, "_processLocalRequests:responseWaitGroup:", v7, v4);
  -[HMDHAPAccessoryTask workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_4;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_group_notify(v4, v16, block);

}

- (void)_fanOutRemoteRequests:(id)a3 residentToAccessoriesMap:(id)a4 responseWaitGroup:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *group;
  uint64_t v33;
  id obj;
  _QWORD v35[4];
  NSObject *v36;
  void *v37;
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  v9 = a5;
  v29 = v8;
  if ((objc_msgSend(v8, "hmf_isEmpty") & 1) == 0)
  {
    group = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryTask context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryRequestMapFromRequests(v8, v28, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHAPAccessoryTask addCharacteristicResponses:](self, "addCharacteristicResponses:", v28);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v30;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v33)
    {
      v31 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v17 = v15;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v41 != v19)
                  objc_enumerationMutation(v17);
                objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObjectsFromArray:", v21);

              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v18);
          }

          if ((objc_msgSend(v16, "hmf_isEmpty") & 1) == 0)
          {
            dispatch_group_enter(group);
            objc_initWeak(&location, self);
            v22 = (void *)objc_msgSend(v16, "copy");
            objc_msgSend(v14, "device");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __112__HMDHAPAccessoryPrimaryResidentOperationTask__fanOutRemoteRequests_residentToAccessoriesMap_responseWaitGroup___block_invoke;
            v35[3] = &unk_1E89C1880;
            objc_copyWeak(&v38, &location);
            v36 = group;
            v37 = v14;
            -[HMDHAPAccessoryPrimaryResidentOperationTask _makeRemoteWithFallbackTaskWithRequests:delegateDevice:completion:](self, "_makeRemoteWithFallbackTaskWithRequests:delegateDevice:completion:", v22, v23, v35);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            -[HMDHAPAccessoryPrimaryResidentOperationTask remoteFallbackTasks](self, "remoteFallbackTasks");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v22) = v25 == 0;

            if ((_DWORD)v22)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDHAPAccessoryPrimaryResidentOperationTask setRemoteFallbackTasks:](self, "setRemoteFallbackTasks:", v26);

            }
            -[HMDHAPAccessoryPrimaryResidentOperationTask remoteFallbackTasks](self, "remoteFallbackTasks");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v24);

            objc_msgSend(v24, "execute");
            objc_destroyWeak(&v38);
            objc_destroyWeak(&location);
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v33);
    }

    v9 = group;
  }

}

- (void)_processLocalRequests:(id)a3 responseWaitGroup:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  NSObject *v20;
  id v21;
  id location;
  _QWORD v23[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke;
  v23[3] = &unk_1E89C1400;
  v23[4] = self;
  migrateRequestsPassingTest(v8, v9, v23);
  if ((objc_msgSend(v9, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicResponse responsesWithRequests:error:](HMDCharacteristicResponse, "responsesWithRequests:error:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHAPAccessoryTask completion](self, "completion");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v12);

  }
  if ((objc_msgSend(v8, "hmf_isEmpty") & 1) == 0)
  {
    dispatch_group_enter(v7);
    objc_initWeak(&location, self);
    v16 = v10;
    v17 = 3221225472;
    v18 = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_367;
    v19 = &unk_1E89C18A8;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    -[HMDHAPAccessoryPrimaryResidentOperationTask _makeLocalTaskWithRequests:completion:](self, "_makeLocalTaskWithRequests:completion:", v8, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryPrimaryResidentOperationTask setLocalTask:](self, "setLocalTask:", v14, v16, v17, v18, v19);

    -[HMDHAPAccessoryPrimaryResidentOperationTask localTask](self, "localTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "execute");

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

- (id)_fallbackTaskForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDHAPAccessoryPrimaryResidentOperationTask remoteFallbackTasks](self, "remoteFallbackTasks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        objc_msgSend(v12, "remoteTask");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        objc_msgSend(v15, "delegateDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v5);

        if ((v17 & 1) != 0)
        {
          v7 = v10;

          goto LABEL_18;
        }

      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_18:

  return v7;
}

- (id)_makeRemoteWithFallbackTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
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
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is unavailable"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
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
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
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

  v51 = *MEMORY[0x1E0C80C00];
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

      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
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
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
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
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic request: %@, accessory has a better link quality: %@(%@s) / %@(%@s) to the device originating message: %@", buf, 0x48u);

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

void __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_367(uint64_t a1, void *a2)
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

  v16 = *MEMORY[0x1E0C80C00];
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
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for local task completion handler", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __112__HMDHAPAccessoryPrimaryResidentOperationTask__fanOutRemoteRequests_residentToAccessoriesMap_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addCharacteristicResponses:", v3);
    objc_msgSend(*(id *)(a1 + 40), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fallbackTaskForDevice:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "allResponsesReceived"))
    {
      if (objc_msgSend(v5, "supportsMultiPartResponse")
        && (objc_msgSend(v5, "allResponsesReceived") & 1) == 0)
      {
        objc_msgSend(v5, "completion");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v8)[2](v8, v3);

      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else if (objc_msgSend(v5, "supportsMultiPartResponse"))
    {
      objc_msgSend(v5, "completion");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v3);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for fallback task completion handler", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

uint64_t __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v8) ^ 1;

  }
  return v6;
}

void __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicResponses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2);

}

uint64_t __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

uint64_t __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  unsigned __int8 isKindOfClass;
  uint64_t v6;
  int v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((objc_msgSend(v3, "hasIPLink") & 1) != 0 || (objc_msgSend(v3, "custom1WoBLE") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8 = isKindOfClass & (v4 != 0);
    v6 = objc_msgSend(v3, "isBLELinkConnected");
    if (((v6 | v8) & 1) == 0)
    {
      objc_msgSend(v4, "characteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "hasValidCachedValueForCharacteristic:shouldLog:", v9, 0);

    }
  }

  return v6;
}

+ (void)filterAccessoriesByDevicesFromMap:(id)a3 currentDeviceAccessories:(id)a4 otherDeviceAccessories:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isCurrentDevice"))
          v16 = v8;
        else
          v16 = v9;
        objc_msgSend(v16, "addObjectsFromArray:", v15);

      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

@end
