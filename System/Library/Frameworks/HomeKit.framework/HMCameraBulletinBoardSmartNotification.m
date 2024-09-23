@implementation HMCameraBulletinBoardSmartNotification

- (HMCameraBulletinBoardSmartNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 context:(id)a5 cameraUserSettings:(id)a6
{
  _BOOL8 v8;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMCameraBulletinBoardSmartNotification *v15;
  objc_super v17;

  v8 = a3;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v10, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HMCameraBulletinBoardSmartNotification;
  v15 = -[HMBulletinBoardNotification initWithEnabled:condition:service:messageTargetUUID:](&v17, sel_initWithEnabled_condition_service_messageTargetUUID_, v8, v13, 0, v14);

  -[HMBulletinBoardNotification setContext:](v15, "setContext:", v12);
  objc_storeWeak((id *)&v15->_cameraUserSettings, v11);

  return v15;
}

- (unint64_t)significantEventTypes
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMBulletinBoardNotification condition](self, "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "significantEventTypesInPredicate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)personFamiliarityOptions
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMBulletinBoardNotification condition](self, "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "personFamiliarityOptionsInPredicate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)commitWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMCameraBulletinBoardSmartNotification *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMCameraBulletinBoardSmartNotification *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMCameraBulletinBoardSmartNotification *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMCameraBulletinBoardSmartNotification *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMBulletinBoardNotification context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraBulletinBoardSmartNotification commitWithCompletionHandler:]", CFSTR("completion"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v35;
      v39 = 2112;
      v40 = (const char *)v31;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v31, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }
  v6 = (void *)v5;
  if (v5)
  {
    -[HMCameraBulletinBoardSmartNotification cameraUserSettings](self, "cameraUserSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMBulletinBoardNotification condition](self, "condition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", v8);

      v10 = (void *)MEMORY[0x1A1AC1AAC]();
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
          *(_DWORD *)buf = 138543618;
          v38 = v14;
          v39 = 2112;
          v40 = (const char *)v11;
          _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Committing camera bulletin board smart notification: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        -[HMBulletinBoardNotification condition](v11, "condition");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMPredicateUtilities rewritePredicateForDaemon:characteristicIsInvalid:](HMPredicateUtilities, "rewritePredicateForDaemon:characteristicIsInvalid:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "updateBulletinNotificationEnabled:condition:completionHandler:", -[HMBulletinBoardNotification isEnabled](v11, "isEnabled"), v16, v4);
        goto LABEL_18;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBulletinBoardNotification condition](v11, "condition");
        v29 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        v39 = 2112;
        v40 = v29;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid predicate: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMBulletinBoardNotification context](v11, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = 3;
    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@No reference to cameraUserSettings, unable to commit change", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMBulletinBoardNotification context](v22, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = -1;
    }
    objc_msgSend(v26, "hmErrorWithCode:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "callCompletion:error:", v4, v30);

LABEL_18:
    goto LABEL_19;
  }
  v17 = (void *)MEMORY[0x1A1AC1AAC]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v20;
    v39 = 2080;
    v40 = "-[HMCameraBulletinBoardSmartNotification commitWithCompletionHandler:]";
    _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);
LABEL_19:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMCameraBulletinBoardSmartNotification cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (HMCameraUserSettings)cameraUserSettings
{
  return (HMCameraUserSettings *)objc_loadWeakRetained((id *)&self->_cameraUserSettings);
}

- (void)setCameraUserSettings:(id)a3
{
  objc_storeWeak((id *)&self->_cameraUserSettings, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraUserSettings);
}

+ (id)predicateForSignificantEventTypes:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %i) != 0"), CFSTR("cameraSignificantEvent"), a3 & 0x1F);
}

+ (id)predicateForPersonFamiliarityOptions:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %i) != 0"), CFSTR("personFamiliarityOptions"), a3 & 7);
}

+ (id)predicateForSignificantEventTypes:(unint64_t)a3 personFamiliarityOptions:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicateForSignificantEventTypes:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a1, "predicateForPersonFamiliarityOptions:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3528];
    v13[0] = v7;
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }

  return v11;
}

+ (id)significantEventTypesInPredicate:(id)a3
{
  return +[HMPredicateUtilities bitwiseAndValueWithKeyPath:inPredicate:validValues:](HMPredicateUtilities, "bitwiseAndValueWithKeyPath:inPredicate:validValues:", CFSTR("cameraSignificantEvent"), a3, 31);
}

+ (id)personFamiliarityOptionsInPredicate:(id)a3
{
  return +[HMPredicateUtilities bitwiseAndValueWithKeyPath:inPredicate:validValues:](HMPredicateUtilities, "bitwiseAndValueWithKeyPath:inPredicate:validValues:", CFSTR("personFamiliarityOptions"), a3, 7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1)
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_12452);
  return (id)logCategory__hmf_once_v6;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __53__HMCameraBulletinBoardSmartNotification_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6;
  logCategory__hmf_once_v6 = v0;

}

@end
