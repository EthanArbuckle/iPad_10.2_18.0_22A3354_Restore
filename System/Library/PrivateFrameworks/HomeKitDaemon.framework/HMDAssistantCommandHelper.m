@implementation HMDAssistantCommandHelper

- (HMDAssistantCommandHelper)initWithQueue:(id)a3 msgDispatcher:(id)a4
{
  id v7;
  id v8;
  HMDAssistantCommandHelper *v9;
  HMDAssistantCommandHelper *v10;
  uint64_t v11;
  NSUUID *uuid;
  uint64_t v13;
  NSMutableArray *responses;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDAssistantCommandHelper;
  v9 = -[HMDAssistantCommandHelper init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_msgDispatcher, a4);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    responses = v10->_responses;
    v10->_responses = (NSMutableArray *)v13;

    v10->_numErrors = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel_reportOperationStartedForAccessory_, CFSTR("kHMDAccessoryWakeNotificationStarted"), 0);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMDAssistantCommandHelper msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMDAssistantCommandHelper;
  -[HMDAssistantCommandHelper dealloc](&v5, sel_dealloc);
}

- (void)_register
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleAccessoryCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsResponseReceivedNotification"), 0);

}

- (void)timeoutAndReportResults
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAssistantCommandHelper queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDAssistantCommandHelper_timeoutAndReportResults__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_reportResponsesForMediaRequests
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAssistantCommandHelper *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  HMDAssistantCommandHelper *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  -[HMDAssistantCommandHelper mediaResponseHandler](self, "mediaResponseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDAssistantCommandHelper mediaResponseHandler](self, "mediaResponseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommandHelper setMediaResponseHandler:](self, "setMediaResponseHandler:", 0);
    v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[HMDAssistantCommandHelper mediaRequests](self, "mediaRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    -[HMDAssistantCommandHelper mediaResponses](self, "mediaResponses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    -[HMDAssistantCommandHelper mediaRequests](self, "mediaRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[HMDAssistantCommandHelper mediaResponses](self, "mediaResponses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v11)
    {

    }
    else
    {
      v37 = v4;
      v38 = v7;
      objc_msgSend(v7, "addObjectsFromArray:", v12);

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[HMDAssistantCommandHelper mediaRequests](self, "mediaRequests");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v17)
      {
        v18 = v17;
        v40 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v46 != v40)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v20, "mediaProfile");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "uniqueIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "UUIDString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            -[HMDAssistantCommandHelper mediaResponses](self, "mediaResponses");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v42;
LABEL_14:
              v28 = 0;
              while (1)
              {
                if (*(_QWORD *)v42 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v28), "objectForKey:", v23);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                  break;
                if (v26 == ++v28)
                {
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                  if (v26)
                    goto LABEL_14;
                  goto LABEL_20;
                }
              }
            }
            else
            {
LABEL_20:

              v30 = (void *)MEMORY[0x227676638]();
              v31 = self;
              HMFGetOSLogHandle();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v51 = v33;
                v52 = 2112;
                v53 = v23;
                _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@No response for requests for media profile %@ - inserting an in-progress error response", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v30);
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", v20, v34);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              v49 = v24;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDMediaPropertyResponse serializeResponses:](HMDMediaPropertyResponse, "serializeResponses:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v36);

            }
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v18);
      }

      v4 = v37;
      v12 = v38;
    }
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v12);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Media results already reported for Siri command - ignoring the notification/timer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }
}

- (void)_reportResponses
{
  HMDAssistantCommandHelper *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDAssistantCommandHelper *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  HMDAssistantCommandHelper *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  HMDAssistantCommandHelper *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  HMDAssistantCommandHelper *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  HMDAssistantCommandHelper *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v2 = self;
  v86 = *MEMORY[0x24BDAC8D0];
  -[HMDAssistantCommandHelper responseHandler](self, "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDAssistantCommandHelper responseHandler](v2, "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommandHelper setResponseHandler:](v2, "setResponseHandler:", 0);
    v5 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDAssistantCommandHelper requests](v2, "requests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HMDAssistantCommandHelper executingActionSet](v2, "executingActionSet"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDAssistantCommandHelper requests](v2, "requests");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      -[HMDAssistantCommandHelper responses](v2, "responses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      -[HMDAssistantCommandHelper responses](v2, "responses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v17)
      {

        v60 = v18;
      }
      else
      {
        v59 = v4;
        objc_msgSend(v60, "addObjectsFromArray:", v18);

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        -[HMDAssistantCommandHelper requests](v2, "requests");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
        if (v63)
        {
          v62 = *(_QWORD *)v74;
          v64 = v2;
          do
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v74 != v62)
                objc_enumerationMutation(obj);
              v65 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              objc_msgSend(v65, "characteristic");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "accessory");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v68 = v20;
              objc_msgSend(v20, "instanceID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              -[HMDAssistantCommandHelper responses](v2, "responses");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v70;
                while (2)
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v70 != v27)
                      objc_enumerationMutation(v24);
                    objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "request");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "characteristic");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v30, "accessory");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "uuid");
                    v32 = (id)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v30, "instanceID");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    if (HMFEqualObjects() && (HMFEqualObjects() & 1) != 0)
                    {
                      v2 = v64;
                      goto LABEL_36;
                    }

                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
                  if (v26)
                    continue;
                  break;
                }
              }

              objc_msgSend(v65, "characteristic");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "accessory");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              v35 = v65;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v36 = v35;
              else
                v36 = 0;
              v32 = v36;

              if (objc_msgSend(v24, "isSuspendCapable")
                && (v83 = v32,
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1),
                    v37 = (void *)objc_claimAutoreleasedReturnValue(),
                    v38 = objc_msgSend(v24, "canWakeBasedOnCharacteristicRequests:", v37),
                    v37,
                    v38))
              {
                v39 = (void *)MEMORY[0x227676638]();
                v2 = v64;
                v40 = v64;
                HMFGetOSLogHandle();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v66 = v39;
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "UUIDString");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v78 = v42;
                  v79 = 2112;
                  v80 = v43;
                  v81 = 2112;
                  v82 = v23;
                  _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@No response for wakeable write requests with characteristic %@/%@ - for suspeded accessory inserting operation started error response", buf, 0x20u);

                  v2 = v64;
                  v39 = v66;
                }

                objc_autoreleasePoolPop(v39);
                objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2404);
                v44 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v45 = (void *)MEMORY[0x227676638]();
                v2 = v64;
                v46 = v64;
                HMFGetOSLogHandle();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "UUIDString");
                  v67 = v45;
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v78 = v48;
                  v79 = 2112;
                  v80 = v49;
                  v81 = 2112;
                  v82 = v23;
                  _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@No response for requests with characteristic %@/%@ - inserting an in-progress error response", buf, 0x20u);

                  v45 = v67;
                  v2 = v64;
                }

                objc_autoreleasePoolPop(v45);
                objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
                v44 = objc_claimAutoreleasedReturnValue();
              }
              v30 = (void *)v44;
              +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v35, v44);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommandHelper setNumErrors:](v2, "setNumErrors:", -[HMDAssistantCommandHelper numErrors](v2, "numErrors") + 1);
              objc_msgSend(v60, "addObject:", v33);
LABEL_36:

            }
            v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
          }
          while (v63);
        }

        v4 = v59;
      }
      if (!-[HMDAssistantCommandHelper numErrors](v2, "numErrors"))
      {
        v52 = 0;
LABEL_46:
        v53 = (void *)MEMORY[0x227676638]();
        v54 = v2;
        HMFGetOSLogHandle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAssistantCommandHelper messageId](v54, "messageId");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "UUIDString");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v56;
          v79 = 2112;
          v80 = v58;
          _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Calling response handler for the id %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v53);
        ((void (**)(_QWORD, void *, void *))v4)[2](v4, v52, v60);

        return;
      }
      v50 = -[HMDAssistantCommandHelper numErrors](v2, "numErrors");
      if (v50 >= objc_msgSend(v60, "count"))
        v51 = 74;
      else
        v51 = 73;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], v51, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v52 = (void *)v7;
    goto LABEL_46;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = v2;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommandHelper messageId](v9, "messageId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v11;
    v79 = 2112;
    v80 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Results already reported for Siri command %@ - ignoring the notification/timer", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
}

- (void)reportOperationStartedForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAssistantCommandHelper queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAssistantCommandHelper_reportOperationStartedForAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_reportOperationStartedForAccessory:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDAssistantCommandHelper *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAssistantCommandHelper *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  HMDAssistantCommandHelper *v42;
  id v43;
  uint64_t v44;
  id obj;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  objc_msgSend(v40, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v10;
    v58 = 2112;
    v59 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Reporting operation started for accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[HMDAssistantCommandHelper requests](v8, "requests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    v42 = v8;
    v43 = v6;
    v41 = *(_QWORD *)v53;
    do
    {
      v14 = 0;
      v44 = v12;
      do
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(obj);
        v47 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
        objc_msgSend(v47, "characteristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "accessory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "instanceID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "hmf_isEqualToUUID:", v19);

        if (v20)
        {
          v46 = v15;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          -[HMDAssistantCommandHelper responses](v8, "responses");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v49;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v49 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "request");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "characteristic");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "accessory");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "uuid");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "instanceID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (HMFEqualObjects() && HMFEqualObjects())
                {

                  v8 = v42;
                  goto LABEL_25;
                }

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
              if (v23)
                continue;
              break;
            }
          }

          v31 = (void *)MEMORY[0x227676638]();
          v8 = v42;
          v32 = v42;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "UUIDString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v34;
            v58 = 2112;
            v59 = v35;
            v60 = 2112;
            v61 = v18;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@No response for requests with characteristic %@/%@ - inserting operation started error response", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v31);
          objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2404);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v47, v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAssistantCommandHelper setNumErrors:](v32, "setNumErrors:", -[HMDAssistantCommandHelper numErrors](v32, "numErrors") + 1);
          -[HMDAssistantCommandHelper responses](v32, "responses");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v27);
LABEL_25:
          v13 = v41;

          v6 = v43;
          v12 = v44;
          v15 = v46;
        }

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v12);
  }

  -[HMDAssistantCommandHelper requests](v8, "requests");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");
  -[HMDAssistantCommandHelper responses](v8, "responses");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v37 == v39)
    -[HMDAssistantCommandHelper _reportResponses](v8, "_reportResponses");

}

- (void)__handleAccessoryCharacteristicsChanged:(id)a3
{
  id v4;
  void *v5;
  HMDAssistantCommandHelper *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  HMDAssistantCommandHelper *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  HMDAssistantCommandHelper *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id obj;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  HMDAssistantCommandHelper *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v116 = v8;
    v117 = 2112;
    v118 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing characteristic reponses for Siri: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v66 = v4;
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("kModifiedCharacteristicsMessageIdentifierKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommandHelper messageId](v6, "messageId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v9;
  LODWORD(v9) = objc_msgSend(v9, "isEqual:", v10);

  if ((_DWORD)v9)
  {
    -[HMDAssistantCommandHelper responseHandler](v6, "responseHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v75, "setNumberStyle:", 1);
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      obj = v12;
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      if (v68)
      {
        v67 = *(_QWORD *)v107;
        v81 = v6;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v107 != v67)
              objc_enumerationMutation(obj);
            v70 = v13;
            v14 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v13);
            objc_msgSend(obj, "hmf_dictionaryForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAssistantCommandHelper home](v6, "home");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v14;
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
            objc_msgSend(v16, "accessoryWithUUID:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
            v76 = v19;

            v104 = 0u;
            v105 = 0u;
            v102 = 0u;
            v103 = 0u;
            v73 = v15;
            v72 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
            if (v72)
            {
              v71 = *(_QWORD *)v103;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v103 != v71)
                    objc_enumerationMutation(v73);
                  v74 = v20;
                  v78 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v20);
                  objc_msgSend(v73, "hmf_dictionaryForKey:");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = 0u;
                  v99 = 0u;
                  v100 = 0u;
                  v101 = 0u;
                  v80 = v21;
                  v79 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                  if (v79)
                  {
                    v77 = *(_QWORD *)v99;
                    do
                    {
                      for (i = 0; i != v79; i = v53 + 1)
                      {
                        if (*(_QWORD *)v99 != v77)
                          objc_enumerationMutation(v80);
                        v84 = i;
                        v23 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
                        objc_msgSend(v75, "numberFromString:", v23);
                        v24 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v75, "numberFromString:", v78);
                        v88 = (void *)v24;
                        v83 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v76, "findCharacteristic:forService:", v24);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v80, "hmf_dictionaryForKey:", v23);
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v82, "errorFromDataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v86)
                          -[HMDAssistantCommandHelper setNumErrors:](v6, "setNumErrors:", -[HMDAssistantCommandHelper numErrors](v6, "numErrors") + 1);
                        v96 = 0u;
                        v97 = 0u;
                        v94 = 0u;
                        v95 = 0u;
                        -[HMDAssistantCommandHelper requests](v6, "requests");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                        if (v26)
                        {
                          v27 = v26;
                          v28 = *(_QWORD *)v95;
LABEL_27:
                          v29 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v95 != v28)
                              objc_enumerationMutation(v25);
                            v30 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v29);
                            objc_msgSend(v30, "characteristic");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v31, "accessory");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v32, "uuid");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v31, "instanceID");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v33, "UUIDString");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v89, "isEqual:", v35))
                            {
                              v36 = objc_msgSend(v88, "isEqual:", v34);

                              if ((v36 & 1) != 0)
                              {
                                +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v30, v86);
                                v37 = (void *)objc_claimAutoreleasedReturnValue();

                                v6 = v81;
                                if (v37)
                                  goto LABEL_41;
                                goto LABEL_38;
                              }
                            }
                            else
                            {

                            }
                            if (v27 == ++v29)
                            {
                              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                              if (v27)
                                goto LABEL_27;
                              break;
                            }
                          }
                        }

                        v6 = v81;
LABEL_38:
                        v38 = (void *)MEMORY[0x227676638]();
                        v39 = v6;
                        HMFGetOSLogHandle();
                        v40 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                        {
                          HMFGetLogIdentifier();
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          v116 = v41;
                          v117 = 2112;
                          v118 = v89;
                          v119 = 2112;
                          v120 = v88;
                          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find a request corresponding to %@/%@ - creating a dummy request", buf, 0x20u);

                        }
                        objc_autoreleasePoolPop(v38);
                        +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v85, &unk_24E96AC88, 0, 0);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v42, v86);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
                        v92 = 0u;
                        v93 = 0u;
                        v90 = 0u;
                        v91 = 0u;
                        -[HMDAssistantCommandHelper responses](v6, "responses");
                        v87 = (id)objc_claimAutoreleasedReturnValue();
                        v43 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                        if (v43)
                        {
                          v44 = v43;
                          v45 = *(_QWORD *)v91;
LABEL_43:
                          v46 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v91 != v45)
                              objc_enumerationMutation(v87);
                            v47 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v46);
                            objc_msgSend(v47, "request");
                            v48 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v48, "characteristic");
                            v49 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v37, "request");
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v50, "characteristic");
                            v51 = (void *)objc_claimAutoreleasedReturnValue();
                            v52 = objc_msgSend(v49, "isEqual:", v51);

                            if ((v52 & 1) != 0)
                              break;
                            if (v44 == ++v46)
                            {
                              v44 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                              if (v44)
                                goto LABEL_43;
                              v6 = v81;
                              goto LABEL_50;
                            }
                          }
                          v56 = v47;

                          v6 = v81;
                          v55 = v82;
                          v54 = (void *)v83;
                          v53 = v84;
                          if (!v56)
                            goto LABEL_54;
                          -[HMDAssistantCommandHelper responses](v81, "responses");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v57, "removeObject:", v56);

                        }
                        else
                        {
LABEL_50:
                          v54 = (void *)v83;
                          v53 = v84;
                          v55 = v82;
                          v56 = v87;
                        }

LABEL_54:
                        -[HMDAssistantCommandHelper responses](v6, "responses");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "addObject:", v37);

                      }
                      v79 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                    }
                    while (v79);
                  }

                  v20 = v74 + 1;
                }
                while (v74 + 1 != v72);
                v72 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
              }
              while (v72);
            }

            v13 = v70 + 1;
          }
          while (v70 + 1 != v68);
          v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
        }
        while (v68);
      }

      if ((objc_msgSend(v66, "hmf_BOOLForKey:", CFSTR("kMultiPartResponseKey")) & 1) == 0)
        -[HMDAssistantCommandHelper _reportResponses](v6, "_reportResponses");

    }
    else
    {
      v59 = (void *)MEMORY[0x227676638]();
      v60 = v6;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "shortDescription");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "UUIDString");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v116 = v62;
        v117 = 2112;
        v118 = v63;
        v119 = 2112;
        v120 = v64;
        _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@Characteristic change notification '%@' too late for request %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v59);
    }
  }

}

- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAssistantCommandHelper queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__HMDAssistantCommandHelper_handleAccessoryCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)addMediaWriteRequests:(id)a3 withRequestProperty:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  HMDAssistantCommandHelper *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAssistantCommandHelper *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  HMDAssistantCommandHelper *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  id v37;
  uint64_t v38;
  id obj;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  __int128 *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id location;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  uint8_t v55[128];
  __int128 v56;
  uint64_t v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v37 = a4;
  v9 = a5;
  v36 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  v33 = v8;
  if (objc_msgSend(v8, "count"))
  {
    -[HMDAssistantCommandHelper setMediaResponseHandler:](self, "setMediaResponseHandler:", v9);
    -[HMDAssistantCommandHelper setMediaRequests:](self, "setMediaRequests:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    -[HMDAssistantCommandHelper setMediaResponses:](self, "setMediaResponses:", v10);

    v35 = self;
    objc_initWeak(&location, self);
    *(_QWORD *)&v56 = 0;
    *((_QWORD *)&v56 + 1) = &v56;
    v57 = 0x2020000000;
    v58 = 0;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v11)
    {
      v38 = *(_QWORD *)v47;
      v34 = *MEMORY[0x24BDD5BD8];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v47 != v38)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v13, "mediaProfile");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accessory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if (v17)
          {
            objc_msgSend(v17, "mediaProfile");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke;
            v40[3] = &unk_24E79BFB8;
            objc_copyWeak(&v45, &location);
            v44 = &v56;
            v20 = v37;
            v41 = v20;
            v42 = v17;
            v43 = obj;
            objc_msgSend(v18, "handleSetValue:withRequestProperty:withCompletionHandler:", v19, v20, v40);

            objc_destroyWeak(&v45);
          }
          else
          {
            v21 = (void *)MEMORY[0x227676638]();
            v22 = v35;
            HMFGetOSLogHandle();
            v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "mediaProfile");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "uniqueIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v52 = v24;
              v53 = 2112;
              v54 = v26;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Media Profile (%@) does not contain HMDAppleMediaAccessory type accessory, something went wrong.", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v21);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v34, 22, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v36)[2](v36, v27, 0);

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v11);
    }

    _Block_object_dispose(&v56, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = 138543362;
      *(_QWORD *)((char *)&v56 + 4) = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Received write request with no apple media accessory, reporting invalid parameters error", (uint8_t *)&v56, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 3, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v36)[2](v36, v32, 0);

  }
}

- (void)addReadRequests:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  HMDAssistantCommandHelper *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAssistantCommandHelper *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommandHelper setMessageId:](self, "setMessageId:", v11);

    -[HMDAssistantCommandHelper setHome:](self, "setHome:", v9);
    -[HMDAssistantCommandHelper setResponseHandler:](self, "setResponseHandler:", v10);
    v12 = (void *)MEMORY[0x227676638](-[HMDAssistantCommandHelper _register](self, "_register"));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantCommandHelper messageId](v13, "messageId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v15;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Sending read request with id %@ to home %@ with characteristics: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDAssistantCommandHelper setRequests:](v13, "setRequests:", v8);
    objc_initWeak((id *)buf, v13);
    -[HMDAssistantCommandHelper messageId](v13, "messageId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke;
    v24[3] = &unk_24E798E20;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v9, "readCharacteristicValues:identifier:source:qualityOfService:withCompletionHandler:", v8, v18, 1, 25, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Received read request to home %@ with no characteristics, reporting invalid parameters error", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 3, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23, 0);

  }
}

- (void)addWriteRequests:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  HMDAssistantCommandHelper *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAssistantCommandHelper *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommandHelper setMessageId:](self, "setMessageId:", v11);

    -[HMDAssistantCommandHelper setHome:](self, "setHome:", v9);
    -[HMDAssistantCommandHelper setResponseHandler:](self, "setResponseHandler:", v10);
    v12 = (void *)MEMORY[0x227676638](-[HMDAssistantCommandHelper _register](self, "_register"));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantCommandHelper messageId](v13, "messageId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v15;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Sending write request with id %@ to home %@ with write request tupes: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDAssistantCommandHelper setRequests:](v13, "setRequests:", v8);
    objc_initWeak((id *)buf, v13);
    -[HMDAssistantCommandHelper messageId](v13, "messageId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke;
    v24[3] = &unk_24E798D90;
    objc_copyWeak(&v25, (id *)buf);
    v24[4] = v13;
    objc_msgSend(v9, "writeCharacteristicValues:source:identifier:qualityOfService:withCompletionHandler:", v8, 1, v18, 25, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Received write request to home %@ with no request tuples, reporting invalid parameters error", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 3, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23, 0);

  }
}

- (void)addActionSetRequest:(id)a3 actionSet:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAssistantCommandHelper *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD aBlock[4];
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  v13 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Assistant/HMDAssistantCommandHelper.m", 518);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v12, "initWithName:", v15);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantCommandHelper setMessageId:](self, "setMessageId:", v16);

  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantCommandHelper messageId](v18, "messageId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v43 = v20;
    v44 = 2112;
    v45 = v22;
    v46 = 2112;
    v47 = v23;
    v48 = 2112;
    v49 = v9;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending execute action set %@ with id %@ to home %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  v41[0] = &unk_24E96ACA0;
  v40[0] = CFSTR("sourceType");
  v40[1] = CFSTR("kActionSetUUID");
  objc_msgSend(v10, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v25;
  v40[2] = CFSTR("kApplyDeviceUnlockKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !isPasscodeEnabledOnThisDevice());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke;
  aBlock[3] = &unk_24E77C968;
  v29 = v11;
  v39 = v29;
  v30 = _Block_copy(aBlock);
  -[HMDAssistantCommandHelper setResponseHandler:](v18, "setResponseHandler:", v30);
  -[HMDAssistantCommandHelper setExecutingActionSet:](v18, "setExecutingActionSet:", 1);
  objc_initWeak((id *)buf, v18);
  v31 = (void *)MEMORY[0x24BE3F1B0];
  v35[0] = v28;
  v35[1] = 3221225472;
  v35[2] = __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_2;
  v35[3] = &unk_24E798D90;
  objc_copyWeak(&v37, (id *)buf);
  v32 = v34;
  v36 = v32;
  objc_msgSend(v31, "internalMessageWithName:messagePayload:responseHandler:", CFSTR("kExecuteActionSetRequestKey"), v27, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeActionSet:", v33);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);

}

- (void)removeResponses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAssistantCommandHelper responses](self, "responses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v4);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)mediaResponseHandler
{
  return self->_mediaResponseHandler;
}

- (void)setMediaResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSMutableArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_storeStrong((id *)&self->_responses, a3);
}

- (unint64_t)numErrors
{
  return self->_numErrors;
}

- (void)setNumErrors:(unint64_t)a3
{
  self->_numErrors = a3;
}

- (BOOL)executingActionSet
{
  return self->_executingActionSet;
}

- (void)setExecutingActionSet:(BOOL)a3
{
  self->_executingActionSet = a3;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSArray)mediaRequests
{
  return self->_mediaRequests;
}

- (void)setMediaRequests:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRequests, a3);
}

- (NSMutableArray)mediaResponses
{
  return self->_mediaResponses;
}

- (void)setMediaResponses:(id)a3
{
  objc_storeStrong((id *)&self->_mediaResponses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaResponses, 0);
  objc_storeStrong((id *)&self->_mediaRequests, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong(&self->_mediaResponseHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

void __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_3;
    v10[3] = &unk_24E79A910;
    v11 = *(id *)(a1 + 32);
    v12 = v8;
    v13 = v6;
    v14 = v5;
    dispatch_async(v9, v10);

  }
}

void __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setResponseHandler:", 0);
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (v4)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", *(_QWORD *)(a1 + 48), 0);
      v2 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
    }
    else
    {
      v3 = 0;
    }
    ((void (**)(id, _QWORD, void *))v2)[2](v4, *(_QWORD *)(a1 + 56), v3);

    v2 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  }

}

void __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messageId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Write request with id %@ to home failed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke_23;
    v16[3] = &unk_24E79C268;
    v17 = v8;
    v18 = v5;
    dispatch_async(v15, v16);

  }
}

void __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke_23(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResponseHandler:", 0);
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), 0);
    v2 = v3;
  }

}

void __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Read request with id %@ failed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v10, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke_22;
    v16[3] = &unk_24E79C268;
    v17 = v10;
    v18 = v5;
    dispatch_async(v15, v16);

  }
}

void __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke_22(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResponseHandler:", 0);
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), 0);
    v2 = v3;
  }

}

void __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke_2;
    block[3] = &unk_24E794C60;
    v17 = *(_QWORD *)(a1 + 56);
    v11 = v5;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = v8;
    v15 = v6;
    v16 = *(id *)(a1 + 48);
    dispatch_async(v9, block);

  }
}

void __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "mediaProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", v4, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "mediaResponses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyResponse serializeResponses:](HMDMediaPropertyResponse, "serializeResponses:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  else
  {
    if (!*(_QWORD *)(a1 + 64))
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 56), "mediaResponses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 64));
  }

LABEL_6:
  v9 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (objc_msgSend(*(id *)(a1 + 72), "count") == v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "mediaResponseHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setMediaResponseHandler:", 0);
    objc_msgSend(*(id *)(a1 + 56), "mediaResponses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setMediaResponses:", 0);
    if (v10)
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v11);

  }
}

void __79__HMDAssistantCommandHelper_handleAccessoryCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__handleAccessoryCharacteristicsChanged:", v2);

}

uint64_t __64__HMDAssistantCommandHelper_reportOperationStartedForAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportOperationStartedForAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__HMDAssistantCommandHelper_timeoutAndReportResults__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Timeout current requests execution - reporting results", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "mediaRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = *(void **)(a1 + 32);
  if (v7)
    return objc_msgSend(v8, "_reportResponsesForMediaRequests");
  else
    return objc_msgSend(v8, "_reportResponses");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_50846 != -1)
    dispatch_once(&logCategory__hmf_once_t0_50846, &__block_literal_global_50847);
  return (id)logCategory__hmf_once_v1_50848;
}

void __40__HMDAssistantCommandHelper_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_50848;
  logCategory__hmf_once_v1_50848 = v0;

}

@end
