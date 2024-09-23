@implementation HMDHouseholdMetricsServer

- (HMDHouseholdMetricsServer)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 householdMetricsProvider:(id)a5 remoteMessageDispatcher:(id)a6 logEventFactories:(id)a7 workQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDHouseholdMetricsServer *v20;
  HMDHouseholdMetricsServer *v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDHouseholdMetricsServer;
  v20 = -[HMDHouseholdMetricsServer init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_dataSource, v14);
    objc_storeWeak((id *)&v21->_logEventSubmitter, v15);
    objc_storeWeak((id *)&v21->_householdMetricsProvider, v16);
    objc_storeWeak((id *)&v21->_remoteMessageDispatcher, v17);
    objc_storeStrong((id *)&v21->_logEventFactories, a7);
    objc_storeStrong((id *)&v21->_workQueue, a8);
  }

  return v21;
}

- (BOOL)evaluateHouseholdActivityLogEventForSubmission:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "requestCount") < 2;
}

- (BOOL)evaluateMetricResponsesForSubmission:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("householdData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          if (!v13)
          {
            v11 = 0;
LABEL_18:

            v14 = 0;
            goto LABEL_19;
          }
          if (!-[HMDHouseholdMetricsServer evaluateHouseholdActivityLogEventForSubmission:](self, "evaluateHouseholdActivityLogEventForSubmission:", v13, (_QWORD)v16))goto LABEL_18;

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v14 = 1;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v14 = 1;
    }
LABEL_19:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)sendHouseholdMetricsCollectionRequestToDevices:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHouseholdMetricsServer *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDHouseholdMetricsServer *v37;
  NSObject *group;
  id obj;
  uint64_t v40;
  _QWORD block[5];
  id v42;
  id v43;
  _QWORD v44[6];
  id v45;
  NSObject *v46;
  _QWORD v47[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDHouseholdMetricsServer householdMetricsProvider](self, "householdMetricsProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdMetricsServer remoteMessageDispatcher](self, "remoteMessageDispatcher");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 && v15)
  {
    v32 = v13;
    group = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v33 = v10;
    obj = v10;
    v34 = v16;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v40)
    {
      v18 = *(_QWORD *)v50;
      v36 = v17;
      v37 = self;
      v35 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (objc_msgSend(v20, "isCurrentDevice", v32))
          {
            objc_msgSend(v14, "householdMetricsForHomeWithUUID:associatedWithDate:", v11, v12);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke;
            v47[3] = &unk_1E89BFBA8;
            v47[4] = self;
            v48 = v17;
            objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v47);

          }
          else
          {
            v59[0] = CFSTR("homeUUID");
            objc_msgSend(v11, "UUIDString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v59[1] = CFSTR("date");
            v60[0] = v22;
            v60[1] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = (void *)MEMORY[0x1D17BA0A0]();
            v24 = self;
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v26 = v14;
              v27 = v12;
              v28 = v11;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v54 = v29;
              v55 = 2112;
              v56 = v20;
              v57 = 2112;
              v58 = v21;
              _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Sending household metrics request to device=%@, payload=%@", buf, 0x20u);

              v11 = v28;
              v12 = v27;
              v14 = v26;
              v16 = v34;
            }

            objc_autoreleasePoolPop(v23);
            dispatch_group_enter(group);
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_3;
            v44[3] = &unk_1E89B5A00;
            v44[4] = v24;
            v44[5] = v20;
            v17 = v36;
            v45 = v36;
            v46 = group;
            objc_msgSend(v16, "sendMessage:toDevice:withPayload:responseHandler:", CFSTR("HMDHouseholdMetricsHomeDataLogEventRequest"), v20, v21, v44);

            self = v37;
            v18 = v35;
          }

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v40);
    }

    -[HMDHouseholdMetricsServer workQueue](self, "workQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_2;
    block[3] = &unk_1E89C1B48;
    block[4] = self;
    v42 = v17;
    v13 = v32;
    v43 = v32;
    v31 = v17;
    dispatch_group_notify(group, v30, block);

    v16 = v34;
    v10 = v33;
  }

}

- (void)runHouseholdMetricsDataCollectionAssociatedToDate:(id)a3 forceSubmit:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HMDHouseholdMetricsServer *v32;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id obj;
  void *v40;
  _QWORD v41[6];
  id v42;
  BOOL v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  -[HMDHouseholdMetricsServer householdMetricsProvider](self, "householdMetricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdMetricsServer dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self;
  -[HMDHouseholdMetricsServer logEventSubmitter](self, "logEventSubmitter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v6 && v35)
  {
    v31 = v5;
    objc_msgSend(v6, "homeDataSources");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (!v7)
      goto LABEL_29;
    v8 = v7;
    v9 = *(_QWORD *)v45;
    v36 = *(_QWORD *)v45;
    v37 = v6;
    while (1)
    {
      v10 = 0;
      v38 = v8;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isCurrentDevicePrimaryResident"))
        {
          v40 = v11;
          objc_msgSend(v6, "devicesOnCurrentAccount");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (!v15)
            goto LABEL_21;
          v16 = v15;
          v17 = *(_QWORD *)v49;
          while (1)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v49 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v19, "productInfo");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "productPlatform") == 4)
              {

              }
              else
              {
                objc_msgSend(v19, "productInfo");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "productPlatform");

                if (v22 != 2)
                  continue;
              }
              objc_msgSend(v13, "addObject:", v19);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            if (!v16)
            {
LABEL_21:

              v23 = (void *)objc_msgSend(v13, "copy");
              v9 = v36;
              v6 = v37;
              v8 = v38;
              v11 = v40;
              if (v23)
                goto LABEL_22;
              goto LABEL_27;
            }
          }
        }
        objc_msgSend(v11, "enabledResidents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (!v26)
        {
          if (objc_msgSend(v11, "isOwnerUser"))
          {
            objc_msgSend(v6, "currentDevice");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "productInfo");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "productClass");

            if (v29 == 1)
            {
              objc_msgSend(v6, "currentDevice");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v30;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
LABEL_22:
                objc_msgSend(v11, "uuid");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v41[0] = MEMORY[0x1E0C809B0];
                v41[1] = 3221225472;
                v41[2] = __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke;
                v41[3] = &unk_1E89AED20;
                v43 = a4;
                v41[4] = v32;
                v41[5] = v11;
                v42 = v35;
                -[HMDHouseholdMetricsServer sendHouseholdMetricsCollectionRequestToDevices:forHomeWithUUID:associatedToDate:completion:](v32, "sendHouseholdMetricsCollectionRequestToDevices:forHomeWithUUID:associatedToDate:completion:", v23, v24, v34, v41);

              }
            }
          }
        }
LABEL_27:
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (!v8)
      {
LABEL_29:

        v5 = v31;
        break;
      }
    }
  }

}

- (HMDHouseholdMetricsDataSource)dataSource
{
  return (HMDHouseholdMetricsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
}

- (HMDHouseholdMetricsLogEventProviding)householdMetricsProvider
{
  return (HMDHouseholdMetricsLogEventProviding *)objc_loadWeakRetained((id *)&self->_householdMetricsProvider);
}

- (HMDHouseholdMetricsMessaging)remoteMessageDispatcher
{
  return (HMDHouseholdMetricsMessaging *)objc_loadWeakRetained((id *)&self->_remoteMessageDispatcher);
}

- (HMDHouseholdMetricsRequestContributor)requestContributor
{
  return self->_requestContributor;
}

- (NSDictionary)logEventFactories
{
  return self->_logEventFactories;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logEventFactories, 0);
  objc_storeStrong((id *)&self->_requestContributor, 0);
  objc_destroyWeak((id *)&self->_remoteMessageDispatcher);
  objc_destroyWeak((id *)&self->_householdMetricsProvider);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  __int128 v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56) || objc_msgSend(*(id *)(a1 + 32), "evaluateMetricResponsesForSubmission:", v3))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke_2;
    v8[3] = &unk_1E89B2E88;
    v9 = *(_OWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Duplicate event detected, not submitting ...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "logEventFactories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1[5], "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "coalescedLogEventsFromLogEvents:homeUUID:", v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(a1[6], "submitLogEvent:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v13);
      }

    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v6;
      v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v25;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(v11);
            objc_msgSend(a1[6], "submitLogEvent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++), (_QWORD)v24);
          }
          while (v21 != v23);
          v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        }
        while (v21);
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = a1[4];
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      v34 = 2112;
      v35 = v5;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@No factory found for the log event %@, which is impossible", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  addLogEventsToResponse(v7, v5, *(void **)(a1 + 40));
  os_unfair_lock_unlock(v6);

}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received response for household metrics from device=%@, error=, payload=%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_4;
  v12[3] = &unk_1E89AECD0;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@All responses received (or timed-out)", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_9;
  v12[3] = &unk_1E89AECF8;
  v9 = v6;
  v13 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  os_unfair_lock_unlock(v7);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = (void *)objc_msgSend(v9, "copy");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  os_unfair_lock_s *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "logEventFactories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      objc_msgSend(v7, "logEventsFromDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
        os_unfair_lock_lock_with_options();
        addLogEventsToResponse(v13, v11, *(void **)(a1 + 40));
        os_unfair_lock_unlock(v12);
      }

    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_74933 != -1)
    dispatch_once(&logCategory__hmf_once_t10_74933, &__block_literal_global_74934);
  return (id)logCategory__hmf_once_v11_74935;
}

void __40__HMDHouseholdMetricsServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_74935;
  logCategory__hmf_once_v11_74935 = v0;

}

@end
