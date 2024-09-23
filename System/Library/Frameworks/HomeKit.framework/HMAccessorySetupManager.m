@implementation HMAccessorySetupManager

- (HMAccessorySetupManager)init
{
  HMMutableXPCMessageTransportConfiguration *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  _HMContext *v8;
  HMAccessorySetupManager *v9;

  v3 = -[HMXPCMessageTransportConfiguration initWithMachServiceName:]([HMMutableXPCMessageTransportConfiguration alloc], "initWithMachServiceName:", CFSTR("com.apple.homed.xpc.accessory-setup"));
  HMDispatchQueueNameString(self, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v5, v6);
  -[HMXPCMessageTransportConfiguration setQueue:](v3, "setQueue:", v7);

  -[HMXPCMessageTransportConfiguration setRequiresHomeDataAccess:](v3, "setRequiresHomeDataAccess:", 0);
  v8 = -[_HMContext initWithXPCClientConfiguration:]([_HMContext alloc], "initWithXPCClientConfiguration:", v3);
  v9 = -[HMAccessorySetupManager initWithContext:](self, "initWithContext:", v8);

  return v9;
}

- (HMAccessorySetupManager)initWithContext:(id)a3
{
  id v5;
  HMAccessorySetupManager *v6;
  HMAccessorySetupManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessorySetupManager;
  v6 = -[HMAccessorySetupManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)performAccessorySetupUsingRequest:(HMAccessorySetupRequest *)request completionHandler:(void *)completion
{
  HMAccessorySetupRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  HMAccessorySetupManager *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HMAccessorySetupManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  id Property;
  void *v36;
  uint64_t v37;
  void *v38;
  HMAccessorySetupManager *v39;
  NSObject *v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD v46[4];
  void *v47;
  const __CFString *v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  HMAccessorySetupRequest *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = request;
  v7 = completion;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager performAccessorySetupUsingRequest:completionHandler:]", CFSTR("request"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1A1AC1AAC]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
LABEL_20:
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v41;
    v52 = 2112;
    v53 = v37;
    _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_21:
    objc_autoreleasePoolPop(v38);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v37, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager performAccessorySetupUsingRequest:completionHandler:]", CFSTR("completion"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1A1AC1AAC]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    goto LABEL_20;
  }
  -[HMAccessorySetupRequest suggestedAccessoryName](v6, "suggestedAccessoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  if (HMMaxLengthForNaming__hmf_once_t5 != -1)
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
  v11 = HMMaxLengthForNaming__hmf_once_v6;

  if (v10 <= v11)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Performing accessory setup using request"));
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v25;
      v52 = 2114;
      v53 = (uint64_t)v27;
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing accessory setup using request: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    v28 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v28, "initWithTarget:", v29);

    v48 = CFSTR("HMASM.mk.request");
    encodeRootObject(v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASM.m.performAccessorySetup"), v19, v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hm_setXPCTimeoutDisabled:", 1);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_34;
    v43[3] = &unk_1E3AB60C8;
    v43[4] = v23;
    v44 = v21;
    v45 = v8;
    v32 = v8;
    v33 = v21;
    objc_msgSend(v31, "setResponseHandler:", v43);
    if (v23)
      Property = objc_getProperty(v23, v34, 8, 1);
    else
      Property = 0;
    objc_msgSend(Property, "messageDispatcher");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sendMessage:completionHandler:", v31, 0);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Suggested accessory name is longer than the pre-defined max length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v13)
      v17 = objc_getProperty(v13, v16, 8, 1);
    else
      v17 = 0;
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke;
    v46[3] = &unk_1E3AB6078;
    v47 = v8;
    v19 = v8;
    objc_msgSend(v18, "invokeBlock:", v46);

    v20 = v47;
  }

}

- (void)resumeAccessorySetupWithUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessorySetupManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  id Property;
  void *v25;
  uint64_t v26;
  void *v27;
  HMAccessorySetupManager *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  const __CFString *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager resumeAccessorySetupWithUserInfo:completionHandler:]", CFSTR("userInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
LABEL_11:
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    v39 = 2112;
    v40 = v26;
    _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_12:
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v26, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager resumeAccessorySetupWithUserInfo:completionHandler:]", CFSTR("completion"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Resuming accessory setup"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v13;
    v39 = 2114;
    v40 = (uint64_t)v15;
    v41 = 2112;
    v42 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Launching HomeUIService with userInfo: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  +[HMAccessorySetupManager UUID](HMAccessorySetupManager, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  v35 = CFSTR("HMASM.mk.resumeAccessorySetupUserInfo");
  v36 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASM.m.resumeAccessorySetup"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __78__HMAccessorySetupManager_resumeAccessorySetupWithUserInfo_completionHandler___block_invoke;
  v32[3] = &unk_1E3AB60C8;
  v32[4] = v11;
  v33 = v9;
  v34 = v8;
  v21 = v8;
  v22 = v9;
  objc_msgSend(v20, "setResponseHandler:", v32);
  if (v11)
    Property = objc_getProperty(v11, v23, 8, 1);
  else
    Property = 0;
  objc_msgSend(Property, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v20);

}

- (void)finishAccessorySetupWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessorySetupManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMAccessorySetupManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager finishAccessorySetupWithCompletionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Finishing accessory setup"));
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2114;
    v22 = (uint64_t)v12;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Finishing accessory setup", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:completionHandler:activity:](v8, 0, v5, v6);

}

- (void)finishAccessorySetupWithSetupCompletedInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessorySetupManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMAccessorySetupManager *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager finishAccessorySetupWithSetupCompletedInfo:completionHandler:]", CFSTR("setupCompletedInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
LABEL_9:
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v20;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_10:
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager finishAccessorySetupWithSetupCompletedInfo:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Finishing accessory setup with completed info"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v13;
    v24 = 2114;
    v25 = (uint64_t)v15;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Finishing accessory setup with setup completed info: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:completionHandler:activity:](v11, v6, v8, v9);

}

- (void)failAccessorySetupWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessorySetupManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  id Property;
  void *v25;
  uint64_t v26;
  void *v27;
  HMAccessorySetupManager *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  const __CFString *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager failAccessorySetupWithError:completionHandler:]", CFSTR("error"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
LABEL_11:
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    v39 = 2112;
    v40 = v26;
    _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_12:
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v26, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager failAccessorySetupWithError:completionHandler:]", CFSTR("completion"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Failing accessory setup"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v13;
    v39 = 2114;
    v40 = (uint64_t)v15;
    v41 = 2112;
    v42 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Failing accessory setup with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v35 = CFSTR("HMASM.mk.error");
  v36 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  +[HMAccessorySetupManager UUID](HMAccessorySetupManager, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASM.m.failAccessorySetup"), v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __73__HMAccessorySetupManager_failAccessorySetupWithError_completionHandler___block_invoke;
  v32[3] = &unk_1E3AB60C8;
  v32[4] = v11;
  v33 = v9;
  v34 = v8;
  v21 = v8;
  v22 = v9;
  objc_msgSend(v20, "setResponseHandler:", v32);
  if (v11)
    Property = objc_getProperty(v11, v23, 8, 1);
  else
    Property = 0;
  objc_msgSend(Property, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __73__HMAccessorySetupManager_failAccessorySetupWithError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  const char *v18;
  id Property;
  void *v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to fail accessory setup: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully failed accessory setup";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v15, v16, v14, v21, v17);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v18, 8, 1);
  objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

- (void)_finishAccessorySetupWithSetupCompletedInfo:(void *)a3 completionHandler:(void *)a4 activity:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:completionHandler:activity:]", CFSTR("activity"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v24);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      encodeRootObject(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("HMASM.mk.accessorySetupCompletedInfo"));

    }
    v13 = objc_alloc(MEMORY[0x1E0D285D8]);
    +[HMAccessorySetupManager UUID](HMAccessorySetupManager, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASM.m.finishAccessorySetup"), v15, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __98__HMAccessorySetupManager__finishAccessorySetupWithSetupCompletedInfo_completionHandler_activity___block_invoke;
    v25[3] = &unk_1E3AB60C8;
    v25[4] = a1;
    v26 = v10;
    v27 = v8;
    objc_msgSend(v16, "setResponseHandler:", v25);
    objc_msgSend(objc_getProperty(a1, v17, 8, 1), "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendMessage:", v16);

  }
}

void __98__HMAccessorySetupManager__finishAccessorySetupWithSetupCompletedInfo_completionHandler_activity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  const char *v18;
  id Property;
  void *v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to finish accessory setup: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully finished accessory setup";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v15, v16, v14, v21, v17);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v18, 8, 1);
  objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __78__HMAccessorySetupManager_resumeAccessorySetupWithUserInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  const char *v18;
  id Property;
  void *v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to resume accessory setup: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully resumed accessory setup";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v15, v16, v14, v21, v17);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v18, 8, 1);
  objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 46);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_34(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  id Property;
  void *v18;
  id *v19;
  id *v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v42[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMASM.mk.result"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v13;
      v38 = 2114;
      v39 = v15;
      v40 = 2112;
      v41 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully performed accessory setup using request with result: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    Property = a1[4];
    if (Property)
      Property = objc_getProperty(Property, v16, 8, 1);
    objc_msgSend(Property, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_38;
    v30 = &unk_1E3AB60A0;
    v19 = &v32;
    v32 = a1[6];
    v20 = &v31;
    v31 = v8;
    v21 = &v27;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v22;
      v38 = 2114;
      v39 = v24;
      v40 = 2112;
      v41 = v5;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to perform accessory setup using request: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v26 = a1[4];
    if (v26)
      v26 = objc_getProperty(v26, v25, 8, 1);
    objc_msgSend(v26, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_37;
    v33[3] = &unk_1E3AB60A0;
    v19 = &v35;
    v35 = a1[6];
    v20 = &v34;
    v34 = v5;
    v21 = v33;
  }
  objc_msgSend(v18, "invokeBlock:", v21, v27, v28, v29, v30, v31);

}

uint64_t __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (NSUUID)UUID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9FB82AF6-B949-4E55-B8B0-BEF7E1544816"));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_56528 != -1)
    dispatch_once(&logCategory__hmf_once_t25_56528, &__block_literal_global_56529);
  return (id)logCategory__hmf_once_v26_56530;
}

void __38__HMAccessorySetupManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26_56530;
  logCategory__hmf_once_v26_56530 = v0;

}

@end
