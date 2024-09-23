@implementation HMDAccessoryFirmwareUpdateApplyTask

- (HMDAccessoryFirmwareUpdateApplyTask)initWithSession:(id)a3 profile:(id)a4 policy:(id)a5 userInitiated:(BOOL)a6 delay:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  double v15;
  int v16;
  int v17;
  HMDAccessoryFirmwareUpdateApplyTask *v18;
  HMDAccessoryFirmwareUpdateApplyTask *v19;
  objc_super v21;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = 0.0;
  if (v7 && !a6)
  {
    v16 = uint32ForPreference(CFSTR("firmwareUpdateApplyMinDelay"));
    v17 = uint32ForPreference(CFSTR("firmwareUpdateApplyMaxDelay"));
    v15 = (double)(arc4random_uniform(1000 * (v17 - v16)) + 1000 * v16) / 1000.0;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessoryFirmwareUpdateApplyTask;
  v18 = -[HMDAccessoryFirmwareUpdateTask initWithSession:profile:initialDelay:](&v21, sel_initWithSession_profile_initialDelay_, v12, v13, v15);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_policy, v14);
    v19->_userInitiated = a6;
  }

  return v19;
}

- (id)criteria
{
  int64_t v3;
  xpc_object_t v4;
  const char *v5;
  __CFString *v6;
  unsigned int v7;
  const char *v8;
  unsigned int v9;

  if (!-[HMDAccessoryFirmwareUpdateApplyTask isUserInitiated](self, "isUserInitiated"))
  {
    v3 = -[HMDAccessoryFirmwareUpdateTask accessoryActiveTransport](self, "accessoryActiveTransport");
    switch(v3)
    {
      case 4:
        v4 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.homed.firmwareUpdate.threadAccessory.apply.group");
        v5 = (const char *)*MEMORY[0x1E0C80798];
        v6 = CFSTR("firmwareUpdateThreadAccessoryApplyConcurrentLimit");
        goto LABEL_8;
      case 3:
        v4 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.homed.firmwareUpdate.bleAccessory.apply.group");
        v8 = (const char *)*MEMORY[0x1E0C80798];
        v9 = uint32ForPreference(CFSTR("firmwareUpdateBLEAccessoryApplyConcurrentLimit"));
        xpc_dictionary_set_uint64(v4, v8, v9);
        goto LABEL_10;
      case 2:
        v4 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.homed.firmwareUpdate.ipAccessory.apply.group");
        v5 = (const char *)*MEMORY[0x1E0C80798];
        v6 = CFSTR("firmwareUpdateIPAccessoryApplyConcurrentLimit");
LABEL_8:
        v7 = uint32ForPreference(v6);
        xpc_dictionary_set_uint64(v4, v5, v7);
        xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808C8], 1);
LABEL_10:
        xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 1);
        return v4;
    }
  }
  v4 = 0;
  return v4;
}

- (BOOL)shouldRun
{
  void *v3;
  BOOL v4;
  void *v5;
  HMDAccessoryFirmwareUpdateApplyTask *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAccessoryFirmwareUpdateTask shouldRunOnCurrentDevice](self, "shouldRunOnCurrentDevice")
    && objc_msgSend(v3, "isReadyToApplyUpdate")
    && objc_msgSend(v3, "sessionState") == 2
    && -[HMDAccessoryFirmwareUpdateApplyTask _isApplyAllowedByPolicy](self, "_isApplyAllowedByPolicy"))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "isReadyToApplyUpdate");
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sessionState");
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "sessionState");
      if ((unint64_t)(v11 - 1) > 2)
        v12 = CFSTR("Up-To-Date");
      else
        v12 = off_1E89B4FC0[v11 - 1];
      v13 = v12;
      -[HMDAccessoryFirmwareUpdateApplyTask _isApplyAllowedByPolicy](v6, "_isApplyAllowedByPolicy");
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544386;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Apply task shouldn't run - readyForApply:%@ needsApply:%@ (%@) policyCheck: %@", (uint8_t *)&v16, 0x34u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

- (void)run
{
  id v2;

  -[HMDAccessoryFirmwareUpdateTask session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeWithState:", 2);

}

- (BOOL)_isApplyAllowedByPolicy
{
  void *v3;
  BOOL v4;
  char v5;

  -[HMDAccessoryFirmwareUpdateApplyTask policy](self, "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAccessoryFirmwareUpdateApplyTask isUserInitiated](self, "isUserInitiated");
  v5 = 1;
  if (!v4 && v3)
    v5 = objc_msgSend(v3, "status");

  return v5;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (HMDAccessoryFirmwareUpdatePolicy)policy
{
  return (HMDAccessoryFirmwareUpdatePolicy *)objc_loadWeakRetained((id *)&self->_policy);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_policy);
}

@end
