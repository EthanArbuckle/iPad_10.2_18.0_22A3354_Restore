@implementation HMClientConnection

+ (BOOL)areAnyHomePodsConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMHomePodsConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (BOOL)areAnyHomePodMiniConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMSmallHomePodsConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (BOOL)areAnyLargeHomePodConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMHomePod_6_1_ConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

- (HMClientConnection)init
{
  return -[HMClientConnection initWithAreHomesConfigured:](self, "initWithAreHomesConfigured:", objc_msgSend((id)objc_opt_class(), "areHomesConfigured"));
}

- (HMClientConnection)initWithNoValidation
{
  return -[HMClientConnection initWithAreHomesConfigured:](self, "initWithAreHomesConfigured:", 1);
}

- (HMClientConnection)initWithAreHomesConfigured:(BOOL)a3
{
  _BOOL8 v3;
  _HMContext *v5;
  HMClientConnection *v6;

  v3 = a3;
  v5 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HMClientConnection"));
  v6 = -[HMClientConnection initWithContext:areHomesConfigured:](self, "initWithContext:areHomesConfigured:", v5, v3);

  return v6;
}

- (HMClientConnection)initWithContext:(id)a3 areHomesConfigured:(BOOL)a4
{
  id v7;
  HMClientConnection *v8;
  HMClientConnection *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMClientConnection;
  v8 = -[HMClientConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a3);
    v9->_homesConfigured = a4;
  }

  return v9;
}

- (void)sendSiriCommand:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMClientConnection *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMClientConnection *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[HMClientConnection areHomesConfigured](self, "areHomesConfigured"))
  {
    v9 = objc_alloc(MEMORY[0x1E0D28540]);
    v10 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1A1AC1500](self, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@, %s:%ld"), v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMClientConnection.m", 237);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend(v9, "initWithName:", v12);

    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionRequests");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v16;
      v45 = 2114;
      v46 = v18;
      v47 = 2048;
      v48 = objc_msgSend(v19, "count");
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending Siri command with %lu action requests", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v20 = objc_alloc(MEMORY[0x1E0D285F8]);
    v21 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithTarget:", v22);
    v41 = CFSTR("kSiriCommandKey");
    encodeRootObject(v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v20, "initWithName:destination:payload:", CFSTR("HMCC.m.siriCommand"), v23, v25);

    objc_msgSend(v26, "setActivity:", v40);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __56__HMClientConnection_sendSiriCommand_completionHandler___block_invoke;
    v37[3] = &unk_1E3AB60C8;
    v37[4] = v14;
    v38 = v40;
    v39 = v8;
    objc_msgSend(v26, "setResponseHandler:", v37);
    -[HMClientConnection context](v14, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "messageDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendMessage:", v26);

    __HMFActivityScopeLeave();
  }
  else
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v32;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Reporting send Siri command failure since no homes are configured", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    v33 = objc_alloc_init(MEMORY[0x1E0D880C0]);
    objc_msgSend(v33, "setCommandOutcome:", *MEMORY[0x1E0D88908]);
    v34 = objc_alloc_init(MEMORY[0x1E0D880B0]);
    objc_msgSend(v34, "setOutcome:", *MEMORY[0x1E0D88748]);
    v49[0] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActionResults:", v35);

    objc_msgSend(v33, "dictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v36);

  }
}

- (void)sendIntentRequestCommand:(id)a3 withPayload:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMClientConnection *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMClientConnection *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (-[HMClientConnection areHomesConfigured](self, "areHomesConfigured"))
  {
    v12 = objc_alloc(MEMORY[0x1E0D28540]);
    v13 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1A1AC1500](self, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMClientConnection.m", 271);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v12, "initWithName:", v15);

    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v19;
      v40 = 2114;
      v41 = v21;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending control home intent: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    v22 = objc_alloc(MEMORY[0x1E0D285F8]);
    v23 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithTarget:", v24);
    v26 = (void *)objc_msgSend(v22, "initWithName:destination:payload:", CFSTR("kSiriIntentRequestKey"), v25, v10);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __77__HMClientConnection_sendIntentRequestCommand_withPayload_completionHandler___block_invoke;
    v34[3] = &unk_1E3AB60C8;
    v34[4] = v17;
    v35 = v37;
    v36 = v11;
    objc_msgSend(v26, "setResponseHandler:", v34);
    -[HMClientConnection context](v17, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "messageDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendMessage:", v26);

    __HMFActivityScopeLeave();
  }
  else
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v32;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Reporting send intent request failure since there are no homes configured", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v33, 0);

  }
}

- (void)requestSiriSyncDataWithValidity:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMClientConnection *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMClientConnection *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[HMClientConnection areHomesConfigured](self, "areHomesConfigured"))
  {
    v9 = objc_alloc(MEMORY[0x1E0D28540]);
    v10 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1A1AC1500](self, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@, %s:%ld"), v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMClientConnection.m", 307);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v9, "initWithName:", v12);

    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v16;
      v40 = 2114;
      v41 = v18;
      v42 = 2112;
      v43 = v7;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Requesting Siri sync data with validity: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, CFSTR("kSiriSyncDataValidityKey"));
    v20 = objc_alloc(MEMORY[0x1E0D285F8]);
    v21 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithTarget:", v22);
    v24 = (void *)objc_msgSend(v20, "initWithName:destination:payload:", CFSTR("HMCC.m.siriSyncData"), v23, v19);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __65__HMClientConnection_requestSiriSyncDataWithValidity_completion___block_invoke;
    v34[3] = &unk_1E3AB60C8;
    v34[4] = v14;
    v35 = v37;
    v36 = v8;
    objc_msgSend(v24, "setResponseHandler:", v34);
    -[HMClientConnection context](v14, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:", v24);

    __HMFActivityScopeLeave();
  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Reporting send Siri sync data failure since there are no homes configured", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v31 = objc_alloc_init(MEMORY[0x1E0D880C0]);
    objc_msgSend(v31, "setCommandOutcome:", *MEMORY[0x1E0D88918]);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActionResults:", v32);

    objc_msgSend(v31, "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v33);

  }
}

- (void)notifyAccountStatusUpdate:(unint64_t)a3 accountIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  __CFString *v8;
  void (**v9)(id, void *);
  BOOL v10;
  void *v11;
  HMClientConnection *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  HMClientConnection *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  v9 = (void (**)(id, void *))a5;
  v10 = -[HMClientConnection areHomesConfigured](self, "areHomesConfigured");
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (a3 - 1 > 2)
        v17 = CFSTR("HMAccountStatus_PrimaryAccountAdded");
      else
        v17 = off_1E3AB37E8[a3 - 1];
      v25 = 138543874;
      v26 = v15;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Primary account with identifier %@ updated status: %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    switch(a3)
    {
      case 0uLL:
        v21 = v12;
        v22 = v8;
        v23 = 0;
        goto LABEL_17;
      case 1uLL:
        -[HMClientConnection _primaryAccountWasDeletedWithCompletionHandler:](v12, "_primaryAccountWasDeletedWithCompletionHandler:", v9);
        break;
      case 2uLL:
        v21 = v12;
        v22 = v8;
        v23 = 1;
LABEL_17:
        -[HMClientConnection _primaryAccountDidChange:modified:completionHandler:](v21, "_primaryAccountDidChange:modified:completionHandler:", v22, v23, v9);
        break;
      case 3uLL:
        -[HMClientConnection _IDMSAccountUsernameModifiedWithCompletionHandler:](v12, "_IDMSAccountUsernameModifiedWithCompletionHandler:", v9);
        break;
      default:
        break;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (a3 - 1 > 2)
        v20 = CFSTR("HMAccountStatus_PrimaryAccountAdded");
      else
        v20 = off_1E3AB37E8[a3 - 1];
      v25 = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@No homes are configured so unable to notify homed about account status: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v24);

  }
}

- (void)_primaryAccountDidChange:(id)a3 modified:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v5 = a4;
  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a3)
  {
    v9 = a3;
    -[HMClientConnection setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:](self, "setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:", 0);
    v10 = objc_alloc(MEMORY[0x1E0D285F8]);
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
    v24[0] = CFSTR("kPrimaryAccountIdentifierKey");
    v24[1] = CFSTR("kPrimaryAccountWasModifiedRequestKey");
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v10, "initWithName:destination:payload:", CFSTR("kPrimaryAccountWasModifiedRequestKey"), v13, v15);

    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __74__HMClientConnection__primaryAccountDidChange_modified_completionHandler___block_invoke;
    v22 = &unk_1E3AB3A50;
    v23 = v8;
    objc_msgSend(v16, "setResponseHandler:", &v19);
    -[HMClientConnection context](self, "context", v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendMessage:", v16);

  }
}

- (void)_IDMSAccountUsernameModifiedWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[HMClientConnection setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:](self, "setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:", 0);
  v5 = objc_alloc(MEMORY[0x1E0D285F8]);
  v6 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);
  v9 = (void *)objc_msgSend(v5, "initWithName:destination:payload:", CFSTR("HMHM.idmsun"), v8, 0);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__HMClientConnection__IDMSAccountUsernameModifiedWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E3AB3A50;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "setResponseHandler:", v13);
  -[HMClientConnection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v9);

}

- (void)_primaryAccountWasDeletedWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  HMClientConnection *v17;
  id v18;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285F8]);
  v6 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);
  v9 = (void *)objc_msgSend(v5, "initWithName:destination:payload:", CFSTR("kPrimaryAccountWasDeletedRequestKey"), v8, 0);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __69__HMClientConnection__primaryAccountWasDeletedWithCompletionHandler___block_invoke;
  v16 = &unk_1E3AB59B8;
  v17 = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend(v9, "setResponseHandler:", &v13);
  -[HMClientConnection context](self, "context", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v9);

}

- (void)_retrySendingSignOutWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = dispatch_time(0, 1000000000);
  -[HMClientConnection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HMClientConnection__retrySendingSignOutWithCompletion___block_invoke;
  v9[3] = &unk_1E3AB60A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_after(v5, v7, v9);

}

- (BOOL)shouldRetrySendingSignOutMessageDueToError:(id)a3
{
  id v4;
  void *v5;
  HMClientConnection *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_14;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about signout : %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if ((v10 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v4, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("HMErrorDomain")))
  {
    v13 = objc_msgSend(v4, "code");

    if (v13 == 2)
      goto LABEL_5;
  }
  else
  {

  }
  objc_msgSend(v4, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D27FC8]))
  {

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v15 = objc_msgSend(v4, "code");

  if (v15 != 2)
    goto LABEL_14;
LABEL_5:
  v11 = 1;
LABEL_15:

  return v11;
}

- (BOOL)areHomesConfigured
{
  return self->_homesConfigured;
}

- (BOOL)shouldWeRetrySendingSignOutMessageToHomeKitDaemon
{
  return self->_shouldWeRetrySendingSignOutMessageToHomeKitDaemon;
}

- (void)setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:(BOOL)a3
{
  self->_shouldWeRetrySendingSignOutMessageToHomeKitDaemon = a3;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __57__HMClientConnection__retrySendingSignOutWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldWeRetrySendingSignOutMessageToHomeKitDaemon") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_primaryAccountWasDeletedWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Backing off from retrying to send the sign out message to homed.", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
}

void __69__HMClientConnection__primaryAccountWasDeletedWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "shouldRetrySendingSignOutMessageDueToError:", v5);
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not deliver sign out message to homed. Going to retry it.: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_retrySendingSignOutWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully delivered sign out message to homed.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __72__HMClientConnection__IDMSAccountUsernameModifiedWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__HMClientConnection__primaryAccountDidChange_modified_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__HMClientConnection_requestSiriSyncDataWithValidity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      v14 = "%{public}@[%{public}@] Siri sync data request failed: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v19, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    v14 = "%{public}@[%{public}@] Siri sync data request succeeded";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v18);

}

void __77__HMClientConnection_sendIntentRequestCommand_withPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      v14 = "%{public}@[%{public}@] Control home intent failed: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v19, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    v14 = "%{public}@[%{public}@] Control home intent succeeded";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v18);

}

void __56__HMClientConnection_sendSiriCommand_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      v14 = "%{public}@[%{public}@] Siri command failed: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v19, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    v14 = "%{public}@[%{public}@] Siri command succeeded";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v18);

}

+ (NSUUID)UUID
{
  if (UUID_onceToken != -1)
    dispatch_once(&UUID_onceToken, &__block_literal_global_36740);
  return (NSUUID *)(id)UUID_UUID;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_36738 != -1)
    dispatch_once(&sharedInstance_onceToken_36738, &__block_literal_global_42_36739);
  return (id)sharedInstance_singletonClientConnection;
}

+ (BOOL)areHomesConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kHomesConfigured"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (id)siriCurrentHome
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("kAssistantCurrentHomeIdentifierKey"), CFSTR("com.apple.homed.notbackedup"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("kAssistantCurrentHomeNameKey"), CFSTR("com.apple.homed.notbackedup"));
  v4 = objc_alloc_init(MEMORY[0x1E0D880C8]);
  objc_msgSend(v4, "setCurrentHomeName:", v3);
  objc_msgSend(v4, "setCurrentHomeIdentifier:", v2);

  return v4;
}

+ (id)siriHomeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  +[HMClientConnection siriCurrentHome](HMClientConnection, "siriCurrentHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHomeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)areAnyAccessoriesConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kAccessoriesConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (BOOL)areAnySpeakersConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kSpeakersConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (BOOL)areAnyTelevisionAccessoriesConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMTelevisionAccessoriesConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (BOOL)areAnyAppleTVAccessoriesConfigured
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMAppleTVAccessoriesConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_36730 != -1)
    dispatch_once(&logCategory__hmf_once_t18_36730, &__block_literal_global_69_36731);
  return (id)logCategory__hmf_once_v19_36732;
}

void __33__HMClientConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_36732;
  logCategory__hmf_once_v19_36732 = v0;

}

void __36__HMClientConnection_sharedInstance__block_invoke()
{
  HMClientConnection *v0;
  void *v1;

  v0 = -[HMClientConnection initWithNoValidation]([HMClientConnection alloc], "initWithNoValidation");
  v1 = (void *)sharedInstance_singletonClientConnection;
  sharedInstance_singletonClientConnection = (uint64_t)v0;

}

void __26__HMClientConnection_UUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("0BE06C66-413E-4DCC-8506-8DCE342DEFE4"));
  v1 = (void *)UUID_UUID;
  UUID_UUID = v0;

}

@end
