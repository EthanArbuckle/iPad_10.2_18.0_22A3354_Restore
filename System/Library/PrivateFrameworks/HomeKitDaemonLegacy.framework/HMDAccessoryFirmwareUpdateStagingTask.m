@implementation HMDAccessoryFirmwareUpdateStagingTask

- (HMDAccessoryFirmwareUpdateStagingTask)initWithSession:(id)a3 profile:(id)a4 userInitiated:(BOOL)a5 delay:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  double v12;
  int v13;
  int v14;
  HMDAccessoryFirmwareUpdateStagingTask *v15;
  HMDAccessoryFirmwareUpdateStagingTask *v16;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = 0.0;
  if (v6 && !a5)
  {
    v13 = uint32ForPreference(CFSTR("firmwareUpdateStageMinDelay"));
    v14 = uint32ForPreference(CFSTR("firmwareUpdateStageMaxDelay"));
    v12 = (double)(arc4random_uniform(1000 * (v14 - v13)) + 1000 * v13) / 1000.0;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdateStagingTask;
  v15 = -[HMDAccessoryFirmwareUpdateTask initWithSession:profile:initialDelay:](&v18, sel_initWithSession_profile_initialDelay_, v10, v11, v12);
  v16 = v15;
  if (v15)
    v15->_userInitiated = a5;

  return v16;
}

- (id)criteria
{
  int64_t v3;
  void *v4;

  if (-[HMDAccessoryFirmwareUpdateStagingTask isUserInitiated](self, "isUserInitiated"))
    goto LABEL_6;
  v3 = -[HMDAccessoryFirmwareUpdateTask accessoryActiveTransport](self, "accessoryActiveTransport");
  if (v3 == 4)
  {
    threadAccessoryStageSystemCriteria();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (v3 == 3)
  {
    bleAccessoryStageSystemCriteria();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (v3 != 2)
  {
LABEL_6:
    v4 = 0;
  }
  else
  {
    ipAccessoryStageSystemCriteria();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)shouldRun
{
  void *v3;
  BOOL v4;
  void *v5;
  HMDAccessoryFirmwareUpdateStagingTask *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAccessoryFirmwareUpdateTask shouldRunOnCurrentDevice](self, "shouldRunOnCurrentDevice")
    && objc_msgSend(v3, "isReadyForStaging")
    && objc_msgSend(v3, "sessionState") == 1)
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
      -[HMDAccessoryFirmwareUpdateTask shouldRunOnCurrentDevice](v6, "shouldRunOnCurrentDevice");
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "isReadyForStaging");
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sessionState");
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "sessionState");
      if ((unint64_t)(v12 - 1) > 2)
        v13 = CFSTR("Up-To-Date");
      else
        v13 = off_1E89B4FC0[v12 - 1];
      v14 = v13;
      v16 = 138544386;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging task shouldn't run - runOnCurrentDevice:%@ readyForStaging:%@ needsStaging:%@ (%@)", (uint8_t *)&v16, 0x34u);

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
  objc_msgSend(v2, "resumeWithState:", 1);

}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

@end
