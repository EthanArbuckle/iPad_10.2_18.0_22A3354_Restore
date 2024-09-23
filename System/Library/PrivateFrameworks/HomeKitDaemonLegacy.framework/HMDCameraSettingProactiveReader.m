@implementation HMDCameraSettingProactiveReader

- (HMDCameraSettingProactiveReader)initWithWorkQueue:(id)a3 sessionID:(id)a4 accessory:(id)a5 message:(id)a6 streamControlMessageHandlers:(id)a7 streamPreferences:(id)a8 logIdentifier:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDCameraSettingProactiveReader *v24;
  HMDCameraSettingProactiveReader *v25;
  uint64_t v26;
  NSString *logIdentifier;
  HMDCameraSettingProactiveReader *v29;
  SEL v30;
  id v31;
  id obj;
  id v33;
  id v34;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  obj = a6;
  v19 = a6;
  v33 = a7;
  v20 = a7;
  v34 = a8;
  v21 = a8;
  v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v20)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    v29 = (HMDCameraSettingProactiveReader *)_HMFPreconditionFailure();
    return (HMDCameraSettingProactiveReader *)-[HMDCameraSettingProactiveReader hasPendingNegotiateMessageForSessionWithIdentifier:](v29, v30, v31);
  }
  v35.receiver = self;
  v35.super_class = (Class)HMDCameraSettingProactiveReader;
  v24 = -[HMDCameraSettingProactiveReader init](&v35, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_workQueue, a3);
    objc_storeStrong((id *)&v25->_sessionID, a4);
    objc_storeWeak((id *)&v25->_accessory, v18);
    objc_storeStrong((id *)&v25->_pendingMessage, obj);
    objc_storeStrong((id *)&v25->_streamControlMessageHandlers, v33);
    objc_storeStrong((id *)&v25->_streamPreferences, v34);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v23, v17);
    v26 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v25->_logIdentifier;
    v25->_logIdentifier = (NSString *)v26;

  }
  return v25;
}

- (BOOL)hasPendingNegotiateMessageForSessionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL result;
  HMDCameraSettingProactiveReader *v9;
  SEL v10;
  id v11;

  v4 = a3;
  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[HMDCameraSettingProactiveReader pendingMessage](self, "pendingMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForKey:", CFSTR("kCameraSessionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", v4);
    return (char)v6;
  }
  else
  {
    v9 = (HMDCameraSettingProactiveReader *)_HMFPreconditionFailure();
    -[HMDCameraSettingProactiveReader handleMessage:](v9, v10, v11);
  }
  return result;
}

- (void)handleMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraSettingProactiveReader *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDCameraSettingProactiveReader *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraSettingProactiveReader *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSettingProactiveReader pendingMessage](self, "pendingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    _HMFPreconditionFailure();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling message: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8660]))
  {

LABEL_7:
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v8;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSettingProactiveReader sessionID](v16, "sessionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding to pending negotiate message for session with identifier: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCameraSettingProactiveReader pendingMessage](v16, "pendingMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "respondWithPayload:error:", 0, v21);

    -[HMDCameraSettingProactiveReader setPendingMessage:](v16, "setPendingMessage:", 0);
    -[HMDCameraSettingProactiveReader _callDidCompleteReadDelegateCallback](v16, "_callDidCompleteReadDelegateCallback");
    objc_msgSend(v4, "respondWithSuccess");
    goto LABEL_13;
  }
  objc_msgSend(v4, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("kStopRemoteStreamRequestKey"));

  if (v14)
    goto LABEL_7;
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v8;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v25;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Responding to message with error because it cannot be handled", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v26);

LABEL_13:
}

- (void)readSetting
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraSettingProactiveReader *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  HMDCameraSettingProactiveReader *val;
  id obj;
  void *v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  val = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting proactive read of stream status", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDCameraSettingProactiveReader streamControlMessageHandlers](val, "streamControlMessageHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HMDCameraSettingProactiveReader streamControlMessageHandlers](val, "streamControlMessageHandlers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v34;
    v12 = *MEMORY[0x1E0D16008];
    *(_QWORD *)&v10 = 138543618;
    v27 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v14, "streamManagementService", v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "findCharacteristicWithType:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v17);

        }
        else
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = val;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "streamManagementService");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v27;
            v38 = v21;
            v39 = 2112;
            v40 = v22;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the stream status characteristic in the given service %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v9);
  }

  -[HMDCameraSettingProactiveReader accessory](val, "accessory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  objc_initWeak((id *)buf, val);
  -[HMDCameraSettingProactiveReader workQueue](val, "workQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __46__HMDCameraSettingProactiveReader_readSetting__block_invoke;
  v31[3] = &unk_1E89C17B0;
  objc_copyWeak(&v32, (id *)buf);
  objc_msgSend(v25, "readCharacteristicValues:source:queue:completionHandler:", v30, 7, v26, v31);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

- (void)_handleStreamStatusMultireadResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMDCameraSettingProactiveReader *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDCameraSettingProactiveReader *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraSettingProactiveReader *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraSettingProactiveReader *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSettingProactiveReader pendingMessage](self, "pendingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDCameraSettingProactiveReader _availableStreamControlMessageHandlersForReadResponses:](self, "_availableStreamControlMessageHandlersForReadResponses:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSettingProactiveReader _inUseStreamControlMessageHandlersForReadResponses:](self, "_inUseStreamControlMessageHandlersForReadResponses:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEntitledForSPIAccess"))
      goto LABEL_10;
    -[HMDCameraSettingProactiveReader streamPreferences](self, "streamPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "minimumRequiredAvailableOrInUseStreams");

    if (v10 < 1)
      goto LABEL_10;
    v11 = objc_msgSend(v7, "count");
    v12 = objc_msgSend(v8, "count") + v11;
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = v13;
      v16 = (void *)v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSettingProactiveReader streamPreferences](v14, "streamPreferences");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v17;
      v41 = 2048;
      v42 = v16;
      v43 = 2048;
      v44 = objc_msgSend(v18, "minimumRequiredAvailableOrInUseStreams");
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Comparing availableOrInUseStreamsCount: %ld, against minimumRequiredAvailableOrInUseStreams: %ld", buf, 0x20u);

      v12 = (uint64_t)v16;
      v13 = v38;
    }

    objc_autoreleasePoolPop(v13);
    -[HMDCameraSettingProactiveReader streamPreferences](v14, "streamPreferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "minimumRequiredAvailableOrInUseStreams");

    if (v12 < v20)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v14;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@availableOrInUseStreamsCount is less than minimumRequiredAvailableOrInUseStreams, so not starting stream", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v25);

      -[HMDCameraSettingProactiveReader _callDidCompleteReadDelegateCallback](v22, "_callDidCompleteReadDelegateCallback");
    }
    else
    {
LABEL_10:
      objc_msgSend(v7, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "handleMessage:", v6);
      }
      else
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v36;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@No camera streaming service is available", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v33);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1019);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "respondWithError:", v37);

      }
      -[HMDCameraSettingProactiveReader _callDidCompleteReadDelegateCallback](self, "_callDidCompleteReadDelegateCallback");

    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSettingProactiveReader sessionID](v29, "sessionID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      v41 = 2112;
      v42 = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Pending negotiate message for session with identifier: %@ has already been handled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
  }

}

- (id)_availableStreamControlMessageHandlersForReadResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMDCameraSettingProactiveReader *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  HMDCameraSettingProactiveReader *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSettingProactiveReader streamControlMessageHandlers](self, "streamControlMessageHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke;
  v18[3] = &unk_1E89B0720;
  v7 = v4;
  v19 = v7;
  v20 = self;
  objc_msgSend(v6, "na_filter:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0](v9, v10, v11, v12);
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Found availableStreamControlMessageHandlers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);

  return v8;
}

- (id)_inUseStreamControlMessageHandlersForReadResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMDCameraSettingProactiveReader *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  HMDCameraSettingProactiveReader *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSettingProactiveReader streamControlMessageHandlers](self, "streamControlMessageHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke;
  v18[3] = &unk_1E89B0720;
  v7 = v4;
  v19 = v7;
  v20 = self;
  objc_msgSend(v6, "na_filter:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0](v9, v10, v11, v12);
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Found inUseStreamControlMessageHandlers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);

  return v8;
}

- (void)_callDidCompleteReadDelegateCallback
{
  NSObject *v3;
  id v4;

  -[HMDCameraSettingProactiveReader workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraSettingProactiveReader delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "cameraSettingProactiveReaderDidCompleteRead:", self);

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraSettingProactiveReaderDelegate)delegate
{
  return (HMDCameraSettingProactiveReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (NSSet)streamControlMessageHandlers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (HMCameraStreamPreferences)streamPreferences
{
  return (HMCameraStreamPreferences *)objc_getProperty(self, a2, 56, 1);
}

- (HMFMessage)pendingMessage
{
  return (HMFMessage *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessage, 0);
  objc_storeStrong((id *)&self->_streamPreferences, 0);
  objc_storeStrong((id *)&self->_streamControlMessageHandlers, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

BOOL __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke_2;
  v10[3] = &unk_1E89B06F8;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_streamingStatusForResponse:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isStreamingSessionInProgress") & 1) != 0)
  {
    v8 = 1;
  }
  else if (v7)
  {
    v8 = objc_msgSend(v7, "streamingStatus") == 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamManagementService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 == v6;

  return v7;
}

BOOL __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke_2;
  v10[3] = &unk_1E89B06F8;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_streamingStatusForResponse:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isStreamingSessionInProgress") & 1) != 0)
  {
    v8 = 0;
  }
  else if (v7)
  {
    v8 = objc_msgSend(v7, "streamingStatus") == 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

BOOL __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamManagementService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 == v6;

  return v7;
}

void __46__HMDCameraSettingProactiveReader_readSetting__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response for proactive read of stream status", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "_handleStreamStatusMultireadResponse:", v3);
  }

}

+ (id)_streamingStatusForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HMDStreamingStatus *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = -[HAPTLVBase initWithTLVData:]([HMDStreamingStatus alloc], "initWithTLVData:", v7);
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMDStreamingStatusTypeAsString(-[HMDStreamingStatus streamingStatus](v8, "streamingStatus"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "characteristic");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "service");
      v25 = a1;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      v28 = 2114;
      v29 = v13;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Found streaming status: %{public}@ for streaming service: %@", buf, 0x20u);

      v9 = v16;
      a1 = v25;

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "characteristic");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received invalid value type: %@ for streaming service: %@ HAPCharacteristicUUID_StreamingStatus characteristic", buf, 0x20u);

    }
    v8 = 0;
  }

  objc_autoreleasePoolPop(v9);
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_86323 != -1)
    dispatch_once(&logCategory__hmf_once_t16_86323, &__block_literal_global_86324);
  return (id)logCategory__hmf_once_v17_86325;
}

void __46__HMDCameraSettingProactiveReader_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_86325;
  logCategory__hmf_once_v17_86325 = v0;

}

@end
