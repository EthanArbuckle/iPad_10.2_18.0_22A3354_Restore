@implementation HMDAccessoryDiagnosticsSession

- (HMDAccessoryDiagnosticsSession)initWithAccessory:(id)a3 settings:(id)a4
{
  id v7;
  HMDAccessoryDiagnosticsSession *v8;
  HMDAccessoryDiagnosticsSession *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryDiagnosticsSession;
  v8 = -[HMDAccessoryDiagnosticsSessionInternal initWithAccessory:](&v11, sel_initWithAccessory_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_settings, a4);

  return v9;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryDiagnosticsSession;
  -[HMDAccessoryDiagnosticsSessionInternal attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryDiagnosticsSession readyForDataTransfer](self, "readyForDataTransfer");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("readyForDataTransfer"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryDiagnosticsSession urlParameters](self, "urlParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("urlParameters"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)shutDown
{
  NSObject *v3;
  void *v4;
  HMDAccessoryDiagnosticsSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  HMDAccessoryDiagnosticsSession *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryDiagnosticsSession dataStream](v5, "dataStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shutDown");

  -[HMDAccessoryDiagnosticsSession setDataStream:](v5, "setDataStream:", 0);
  -[HMDAccessoryDiagnosticsSession pendingCompletionHandler](v5, "pendingCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsSession _callCompletionHandlerWithError:](v5, "_callCompletionHandlerWithError:", v10);

  }
  -[HMDAccessoryDiagnosticsSessionInternal setFilePath:](v5, "setFilePath:", 0);
  -[HMDAccessoryDiagnosticsSession fileHandle](v5, "fileHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v11, "closeAndReturnError:", &v19);
  v12 = v19;

  v13 = -[HMDAccessoryDiagnosticsSession setFileHandle:](v5, "setFileHandle:", 0);
  if (v12)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0](v13);
    v15 = v5;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsSessionInternal accessory](v15, "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to close file for accessory:%@ with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)hapAccessory
{
  void *v2;
  void *v3;
  id v4;

  -[HMDAccessoryDiagnosticsSessionInternal accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)dealloc
{
  void *v3;
  HMDAccessoryDiagnosticsSession *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDAccessoryDiagnosticsSession;
  -[HMDAccessoryDiagnosticsSession dealloc](&v7, sel_dealloc);
}

- (id)fileExtension
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[HMDAccessoryDiagnosticsSession settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "value");

  if (!v6)
    return CFSTR("zip");
  -[HMDAccessoryDiagnosticsSession settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "value");

  if (v10 == 1)
    return CFSTR("txt");
  else
    return 0;
}

- (void)setUpWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAccessoryDiagnosticsSession *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessoryDiagnosticsSession hapAccessory](self, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Establishing local HAP session with accessory if needed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAccessoryDiagnosticsSessionInternal workQueue](v11, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__HMDAccessoryDiagnosticsSession_setUpWithOptions_completion___block_invoke;
    v18[3] = &unk_1E89C1558;
    v18[4] = v11;
    v20 = v7;
    v19 = v6;
    objc_msgSend(v9, "establishLocalHAPConnectionWithQueue:completion:", v15, v18);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot set up diagnostics transfer session because accessory is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v17, 0);

  }
}

- (void)_setUpWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryDataStreamAdapter *v12;
  void *v13;
  void *v14;
  HMDAccessoryDataStreamAdapter *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryDiagnosticsSession *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _BYTE location[12];
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessoryDiagnosticsSession hapAccessory](self, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "canAcceptBulkSendListenersSync") & 1) != 0
    || (objc_msgSend(v9, "bulkSendListenersRequireCharacteristicReadsSync") & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "logSize");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v6, "logSize");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsSessionInternal setMaxBytes:](self, "setMaxBytes:", objc_msgSend(v11, "integerValue"));

      }
    }
    v12 = [HMDAccessoryDataStreamAdapter alloc];
    -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payloadMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDAccessoryDataStreamAdapter initWithAccessory:workQueue:fileType:metadata:reason:](v12, "initWithAccessory:workQueue:fileType:metadata:reason:", v9, v13, CFSTR("diagnostics.snapshot"), v14, CFSTR("DiagnosticsData"));
    -[HMDAccessoryDiagnosticsSession setDataStream:](self, "setDataStream:", v15);

    -[HMDAccessoryDiagnosticsSession dataStream](self, "dataStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

    objc_initWeak((id *)location, self);
    -[HMDAccessoryDiagnosticsSession dataStream](self, "dataStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __63__HMDAccessoryDiagnosticsSession__setUpWithOptions_completion___block_invoke;
    v23[3] = &unk_1E89AC680;
    objc_copyWeak(&v25, (id *)location);
    v24 = v7;
    objc_msgSend(v17, "setUpWithCallback:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v22;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Accessory:%@ does not support data stream, error: %@", location, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v18, 0);

  }
}

- (void)readDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryDiagnosticsSession *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDiagnosticsSession dataStream](self, "dataStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      v12 = "%{public}@Data stream not present";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], -1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v4 + 2))(v4, v7, 0, 0);
    goto LABEL_10;
  }
  if (!-[HMDAccessoryDiagnosticsSession readyForDataTransfer](self, "readyForDataTransfer"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      v12 = "%{public}@Session not ready for data read";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[HMDAccessoryDiagnosticsSession setPendingCompletionHandler:](self, "setPendingCompletionHandler:", v4);
  -[HMDAccessoryDiagnosticsSession dataStream](self, "dataStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readData");
LABEL_10:

}

- (BOOL)dataStreamAdapter:(id)a3 didReceiveData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDAccessoryDiagnosticsSession *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDAccessoryDiagnosticsSession *v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  void *v32;
  HMDAccessoryDiagnosticsSession *v33;
  NSObject *v34;
  void *v35;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      -[HMDAccessoryDiagnosticsSession fileHandle](self, "fileHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("urlParameters"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        -[HMDAccessoryDiagnosticsSession setUrlParameters:](self, "setUrlParameters:", v18);
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryDiagnosticsSession urlParameters](v20, "urlParameters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v22;
          v39 = 2112;
          v40 = v23;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@URL parameters: %@ received in packet metadata", (uint8_t *)&v37, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dataSequenceNumber"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v26 = v25;

      if (v26)
        -[HMDAccessoryDiagnosticsSession _validDataSequenceNumber:](self, "_validDataSequenceNumber:", v26);

    }
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Data frame received", (uint8_t *)&v37, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v31 = -[HMDAccessoryDiagnosticsSession _handleReceivedData:](v28, "_handleReceivedData:", v11);

  }
  else
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v35;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@No data present in frame", (uint8_t *)&v37, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    v31 = 0;
  }

  return v31;
}

- (void)dataStreamAdapterDidCompleteDataRead:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryDiagnosticsSession *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryDiagnosticsSession *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDiagnosticsSession pendingCompletionHandler](self, "pendingCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAccessoryDiagnosticsSession fileHandle](self, "fileHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsSessionInternal accessory](v9, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Data read completed for accessory:%@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDAccessoryDiagnosticsSession pendingCompletionHandler](v9, "pendingCompletionHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsSession setPendingCompletionHandler:](v9, "setPendingCompletionHandler:", 0);
      -[HMDAccessoryDiagnosticsSessionInternal filePath](v9, "filePath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsSession urlParameters](v9, "urlParameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, void *))v14)[2](v14, 0, v15, v16);

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsSessionInternal accessory](v9, "accessory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v22;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Data read completed for accessory:%@ but file path not present", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsSession _callCompletionHandlerWithError:](v9, "_callCompletionHandlerWithError:", v14);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Data read completed but no completion handler", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)dataStreamAdapterDidFailDataRead:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryDiagnosticsSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsSessionInternal accessory](v7, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to read data for accessory:%@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryDiagnosticsSession pendingCompletionHandler](v7, "pendingCompletionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsSession _callCompletionHandlerWithError:](v7, "_callCompletionHandlerWithError:", v12);

  }
}

- (BOOL)_handleReceivedData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  HMDAccessoryDiagnosticsSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  HMDAccessoryDiagnosticsSession *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDiagnosticsSession fileHandle](self, "fileHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HMDAccessoryDiagnosticsSession _createLogFile](self, "_createLogFile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsSession setFileHandle:](self, "setFileHandle:", v7);

    -[HMDAccessoryDiagnosticsSession fileHandle](self, "fileHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsSessionInternal accessory](v12, "accessory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsSessionInternal filePath](v12, "filePath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v14;
        v29 = 2112;
        v30 = (uint64_t)v23;
        v31 = 2112;
        v32 = (uint64_t)v24;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create log file for accessory:%@ file path:%@", buf, 0x20u);

        goto LABEL_14;
      }
LABEL_15:

      objc_autoreleasePoolPop(v11);
      v17 = 0;
      goto LABEL_16;
    }
  }
  v9 = -[HMDAccessoryDiagnosticsSessionInternal bytesWritten](self, "bytesWritten");
  v10 = objc_msgSend(v4, "length") + v9;
  if (v10 > -[HMDAccessoryDiagnosticsSessionInternal maxBytes](self, "maxBytes"))
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v14;
      v29 = 2048;
      v30 = -[HMDAccessoryDiagnosticsSessionInternal bytesWritten](v12, "bytesWritten");
      v31 = 2048;
      v32 = objc_msgSend(v4, "length");
      v33 = 2048;
      v34 = -[HMDAccessoryDiagnosticsSessionInternal maxBytes](v12, "maxBytes");
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics exceeded max size (written: %llu, new data: %lu, max: %llu)", buf, 0x2Au);
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  -[HMDAccessoryDiagnosticsSession fileHandle](self, "fileHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v15, "writeData:error:", v4, &v26);
  v16 = v26;

  v17 = v16 == 0;
  if (v16)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsSessionInternal filePath](v19, "filePath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      v29 = 2112;
      v30 = (uint64_t)v22;
      v31 = 2112;
      v32 = (uint64_t)v16;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to write data to file: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    -[HMDAccessoryDiagnosticsSessionInternal setBytesWritten:](self, "setBytesWritten:", -[HMDAccessoryDiagnosticsSessionInternal bytesWritten](self, "bytesWritten") + objc_msgSend(v4, "length"));
  }

LABEL_16:
  return v17;
}

- (id)_createLogFile
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessoryDiagnosticsSession *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAccessoryDiagnosticsSession *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDAccessoryDiagnosticsSession *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  HMDCreateHomeKitDaemonCacheDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/ManufacturerDiagnostics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v40);
  v8 = v40;

  if ((v7 & 1) != 0)
  {
    -[HMDAccessoryDiagnosticsSession fileExtension](self, "fileExtension");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v37 = (void *)v9;
      v39 = v8;
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v12, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsSession fileExtension](self, "fileExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "stringByAppendingPathExtension:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v17;
      objc_msgSend(v5, "stringByAppendingPathComponent:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "copy");
      -[HMDAccessoryDiagnosticsSessionInternal setFilePath:](self, "setFilePath:", v19);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v20, "createFileAtPath:contents:attributes:", v18, 0, 0);

      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v25;
          v43 = 2112;
          v44 = v18;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Created log file path:%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v39;
      }
      else
      {
        v8 = v39;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v35;
          v43 = 2112;
          v44 = v18;
          v45 = 2112;
          v46 = v39;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create file at path: %@ error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        v26 = 0;
      }
      v10 = v37;

    }
    else
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        v43 = 2112;
        v44 = 0;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@FileType:%@ not supported ", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v26 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      v43 = 2112;
      v44 = v5;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at path: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
  }

  return v26;
}

- (BOOL)_validDataSequenceNumber:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryDiagnosticsSession *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDiagnosticsSession expectedDataSequenceNumber](self, "expectedDataSequenceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", v4);

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryDiagnosticsSession expectedDataSequenceNumber](self, "expectedDataSequenceNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "longLongValue") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsSession setExpectedDataSequenceNumber:](self, "setExpectedDataSequenceNumber:", v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v4, "longLongValue");
      -[HMDAccessoryDiagnosticsSession expectedDataSequenceNumber](v12, "expectedDataSequenceNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v14;
      v20 = 2048;
      v21 = v15;
      v22 = 2048;
      v23 = objc_msgSend(v16, "longLongValue");
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid data sequence number received:%lld expected:%lld", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

  return v7;
}

- (void)_callCompletionHandlerWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryDiagnosticsSession *v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryDiagnosticsSessionInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Calling completion handler with error:%@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryDiagnosticsSession pendingCompletionHandler](v7, "pendingCompletionHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDiagnosticsSession setPendingCompletionHandler:](v7, "setPendingCompletionHandler:", 0);
  ((void (**)(_QWORD, id, _QWORD, _QWORD))v10)[2](v10, v4, 0, 0);

}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAccessoryDiagnosticsSettings)settings
{
  return (HMDAccessoryDiagnosticsSettings *)objc_getProperty(self, a2, 64, 1);
}

- (HMDAccessoryDataStreamAdapter)dataStream
{
  return (HMDAccessoryDataStreamAdapter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDataStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (id)pendingCompletionHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setPendingCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSDictionary)urlParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUrlParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSNumber)expectedDataSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExpectedDataSequenceNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)readyForDataTransfer
{
  return self->_readyForDataTransfer;
}

- (void)setReadyForDataTransfer:(BOOL)a3
{
  self->_readyForDataTransfer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_expectedDataSequenceNumber, 0);
  objc_storeStrong((id *)&self->_urlParameters, 0);
  objc_storeStrong(&self->_pendingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dataStream, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

void __63__HMDAccessoryDiagnosticsSession__setUpWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void (*v15)(void);
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v8;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup data stream with error: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Diagnostics data stream was setup successfully", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "setReadyForDataTransfer:", 1);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", 1);
      objc_msgSend(v11, "setExpectedDataSequenceNumber:", v21);

      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v15();
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Setting up data stream failed, diagnostics session is nil", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __62__HMDAccessoryDiagnosticsSession_setUpWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HAP session with accessory: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUpWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

@end
