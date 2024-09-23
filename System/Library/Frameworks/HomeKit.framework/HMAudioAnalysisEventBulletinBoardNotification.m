@implementation HMAudioAnalysisEventBulletinBoardNotification

- (HMAudioAnalysisEventBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 accessoryIdentifier:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  HMAudioAnalysisEventBulletinBoardNotification *v12;
  uint64_t v13;
  NSUUID *accessoryIdentifier;
  objc_super v16;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HMAudioAnalysisEventBulletinBoardNotification;
  v12 = -[HMBulletinBoardNotification initWithEnabled:condition:service:messageTargetUUID:](&v16, sel_initWithEnabled_condition_service_messageTargetUUID_, v6, v10, 0, v11);

  v13 = objc_msgSend(v9, "copy");
  accessoryIdentifier = v12->_accessoryIdentifier;
  v12->_accessoryIdentifier = (NSUUID *)v13;

  return v12;
}

- (unint64_t)options
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;

  -[HMBulletinBoardNotification condition](self, "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  +[HMPredicateUtilities audioAnalysisNotificationOptionsInPredicate:](HMPredicateUtilities, "audioAnalysisNotificationOptionsInPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

- (void)commitWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMAudioAnalysisEventBulletinBoardNotification *v16;
  NSObject *v17;
  id v18;
  char *v19;
  void *v20;
  HMAudioAnalysisEventBulletinBoardNotification *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMAudioAnalysisEventBulletinBoardNotification *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMAudioAnalysisEventBulletinBoardNotification *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *context;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  HMAudioAnalysisEventBulletinBoardNotification *v46;
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBulletinBoardNotification context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAudioAnalysisEventBulletinBoardNotification commitWithCompletionHandler:]", CFSTR("completion"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v32;
      v43 = 2112;
      v44 = (const char *)v28;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v6 = (void *)v5;
  if (v5)
  {
    -[HMBulletinBoardNotification condition](self, "condition");
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMBulletinBoardNotification isEnabled](self, "isEnabled");
    if (+[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", v7))
    {
      +[HMPredicateUtilities rewritePredicateForDaemon:characteristicIsInvalid:](HMPredicateUtilities, "rewritePredicateForDaemon:characteristicIsInvalid:", v7, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = CFSTR("HM.BulletinBoardNotificationEnabled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = CFSTR("HM.BulletinBoardNotificationCondition");
      v48[0] = v9;
      encodeRootObject(v36);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "messageDispatcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAudioAnalysisEventBulletinBoardNotification accessoryIdentifier](self, "accessoryIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("kBulletinBoardNotificationCommitRequestKey"), v35, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke;
      v37[3] = &unk_1E3AB4AE0;
      objc_copyWeak(&v39, &location);
      v38 = v4;
      context = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v15, "setResponseHandler:", v37));
      v16 = self;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v18;
        v43 = 2112;
        v44 = v19;
        v45 = 2112;
        v46 = v16;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Committing audio analysis event bulletin board notification using message %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(v12, "sendMessage:", v15);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);

    }
    else
    {
      v24 = (void *)MEMORY[0x1A1AC1AAC]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v27;
        v43 = 2112;
        v44 = v7;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid predicate: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      -[HMBulletinBoardNotification context](v25, "context");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "callCompletion:error:", v4, v12);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v23;
      v43 = 2080;
      v44 = "-[HMAudioAnalysisEventBulletinBoardNotification commitWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, char *))v4 + 2))(v4, v7);
  }

}

- (void)__configureWithContext:(id)a3
{
  id v4;
  void *v5;
  HMAudioAnalysisEventBulletinBoardNotification *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring HMAudioAnalysisEventBulletinBoardNotification with context %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBulletinBoardNotification setContext:](v6, "setContext:", v4);

}

- (id)uniqueIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3A28];
  -[HMAudioAnalysisEventBulletinBoardNotification accessoryIdentifier](self, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hm_deriveUUIDFromBaseUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMAudioAnalysisEventBulletinBoardNotification *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMAudioAnalysisEventBulletinBoardNotification *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMBulletinBoardNotification condition](self, "condition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "condition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBulletinBoardNotification condition](v11, "condition");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "condition");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v13;
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Merging due to condition value change from %@ to %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v6, "condition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBulletinBoardNotification setCondition:](v11, "setCondition:", v16);

    }
    v17 = -[HMBulletinBoardNotification isEnabled](self, "isEnabled");
    if (v17 == objc_msgSend(v6, "isEnabled"))
    {
      v24 = v9 ^ 1;
    }
    else
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBulletinBoardNotification isEnabled](v19, "isEnabled");
        HMFBooleanToString();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "isEnabled");
        HMFBooleanToString();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v21;
        v28 = 2112;
        v29 = v22;
        v30 = 2112;
        v31 = v23;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Merging due to enabled value change from %@ to %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMBulletinBoardNotification setEnabled:](v19, "setEnabled:", objc_msgSend(v6, "isEnabled"));
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMAudioAnalysisEventBulletinBoardNotification accessoryIdentifier](self, "accessoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBulletinBoardNotification isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Enabled"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBulletinBoardNotification condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Condition"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSUUID)accessoryIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

void __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Daemon responded with error %@ for commiting Audio Analysis settings", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_17;
    v21[3] = &unk_1E3AB60A0;
    v15 = &v23;
    v23 = *(id *)(a1 + 32);
    v22 = v5;
    objc_msgSend(v14, "invokeBlock:", v21);

    v16 = v22;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set Audio Analysis user notification settings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_19;
    v19[3] = &unk_1E3AB6078;
    v15 = &v20;
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v18, "invokeBlock:", v19);

  }
}

uint64_t __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)predicateForOptions:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %i) != 0"), CFSTR("audioAnalysisEventNotificationOptions"), a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1)
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_11281);
  return (id)logCategory__hmf_once_v12;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __60__HMAudioAnalysisEventBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12;
  logCategory__hmf_once_v12 = v0;

}

@end
