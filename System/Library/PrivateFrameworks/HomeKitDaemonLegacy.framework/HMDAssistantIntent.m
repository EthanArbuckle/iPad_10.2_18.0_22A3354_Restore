@implementation HMDAssistantIntent

- (HMDAssistantIntent)initWithIntent:(id)a3
{
  id v5;
  HMDAssistantIntent *v6;
  HMDAssistantIntent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAssistantIntent;
  v6 = -[HMDAssistantIntent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_intent, a3);

  return v7;
}

- (void)performWithGather:(id)a3 message:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "homeKitObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantIntent setHomeKitObjects:](self, "setHomeKitObjects:", v6);

  -[HMDAssistantIntent _handleIntentRequestMessage:](self, "_handleIntentRequestMessage:", v7);
}

- (void)_handleIntentRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  HMDAssistantIntent *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMDAssistantIntent *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAssistantIntent *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAssistantIntent intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[HMDAssistantIntent intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "entityType");

    switch(v12)
    {
      case 0:
        v13 = CFSTR("INHomeEntityTypeUnknown");
        goto LABEL_22;
      case 1:
        v13 = CFSTR("INHomeEntityTypeHome");
        goto LABEL_22;
      case 2:
        v13 = CFSTR("INHomeEntityTypeZone");
        goto LABEL_22;
      case 3:
        v13 = CFSTR("INHomeEntityTypeRoom");
        goto LABEL_22;
      case 4:
        v13 = CFSTR("INHomeEntityTypeGroup");
        goto LABEL_22;
      case 5:
        -[HMDAssistantIntent _getObjectsWithUUID](self, "_getObjectsWithUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CBACA8]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = v19;
            v21 = objc_msgSend(v19, "unsignedIntegerValue");
            if (v21 == 1)
            {
              -[HMDAssistantIntent _handleActionSetForExecution:message:](self, "_handleActionSetForExecution:message:", v18, v4);
            }
            else if (!v21)
            {
              -[HMDAssistantIntent _handleActionSetForConfirmation:message:](self, "_handleActionSetForConfirmation:message:", v18, v4);
            }

LABEL_33:
            goto LABEL_25;
          }
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v32 = 3;
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
            v34 = 138543362;
            v35 = v30;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@The actionSet provided by the intent does not exist.", (uint8_t *)&v34, 0xCu);

          }
          objc_autoreleasePoolPop(v27);
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v32 = 2;
        }
        objc_msgSend(v31, "hmErrorWithCode:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v33);

        goto LABEL_33;
      case 6:
        v13 = CFSTR("INHomeEntityTypeTrigger");
        goto LABEL_22;
      case 7:
        v13 = CFSTR("INHomeEntityTypeDevice");
        goto LABEL_22;
      case 8:
        v13 = CFSTR("INHomeEntityTypeServiceGroup");
        goto LABEL_22;
      case 9:
        v13 = CFSTR("INHomeEntityTypeAccessory");
        goto LABEL_22;
      case 10:
        v13 = CFSTR("INHomeEntityTypeService");
        goto LABEL_22;
      default:
        v13 = 0;
LABEL_22:
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v25;
          v36 = 2112;
          v37 = v13;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Intent execution with entityType %@ is not yet supported.", (uint8_t *)&v34, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v26);

        goto LABEL_25;
    }
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v17;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error - There is no content in intent to handle.", (uint8_t *)&v34, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 58);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v10);
LABEL_25:

}

- (id)_getObjectsWithUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[HMDAssistantIntent intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAssistantIntent homeKitObjects](self, "homeKitObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K =[d] %@"), CFSTR("objectSPIIdentifier"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_handleActionSetForConfirmation:(id)a3 message:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  actionSetFromObject(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = isPasscodeEnabledOnThisDevice();
  v15[1] = CFSTR("kApplyDeviceUnlockKey");
  v16[0] = &unk_1E8B33B70;
  v15[0] = CFSTR("sourceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285D0], "messageWithMessage:messagePayload:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HMDAssistantIntent__handleActionSetForConfirmation_message___block_invoke;
  v12[3] = &unk_1E89B2FE8;
  v14 = v7;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v6, "isAccessValidForExecutionWithMessage:completion:", v10, v12);

}

- (void)_handleActionSetForExecution:(id)a3 message:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  actionSetFromObject(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = &unk_1E8B33B70;
  v14[0] = CFSTR("sourceType");
  v14[1] = CFSTR("kActionUUID");
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("kApplyDeviceUnlockKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !isPasscodeEnabledOnThisDevice());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D285D0];
  objc_msgSend(v5, "responseHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "internalMessageWithName:messagePayload:responseHandler:", CFSTR("kExecuteActionSetRequestKey"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "execute:", v13);
}

- (NSArray)homeKitObjects
{
  return self->_homeKitObjects;
}

- (void)setHomeKitObjects:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitObjects, a3);
}

- (INControlHomeIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_homeKitObjects, 0);
}

void __62__HMDAssistantIntent__handleActionSetForConfirmation_message___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v8 = v5;
    if (objc_msgSend(v5, "code") == 82)
    {
      v6 = v8;
      if (!v8 || !*(_BYTE *)(a1 + 40))
        goto LABEL_7;
    }
    else
    {
      v6 = v8;
      if (!v8)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v7;
      }
    }
  }
  v9 = v6;
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, v6);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_106754 != -1)
    dispatch_once(&logCategory__hmf_once_t3_106754, &__block_literal_global_106755);
  return (id)logCategory__hmf_once_v4_106756;
}

void __33__HMDAssistantIntent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_106756;
  logCategory__hmf_once_v4_106756 = v0;

}

@end
