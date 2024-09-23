@implementation HMDAccessoryFirmwareUpdateRegisterTask

- (HMDAccessoryFirmwareUpdateRegisterTask)initWithSession:(id)a3 profile:(id)a4 initialDelay:(double)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryFirmwareUpdateRegisterTask;
  return -[HMDAccessoryFirmwareUpdateTask initWithSession:profile:initialDelay:](&v6, sel_initWithSession_profile_initialDelay_, a3, a4, a5);
}

- (id)criteria
{
  int64_t v2;
  void *v3;

  v2 = -[HMDAccessoryFirmwareUpdateTask accessoryActiveTransport](self, "accessoryActiveTransport");
  switch(v2)
  {
    case 4:
      threadAccessoryStageSystemCriteria();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      bleAccessoryStageSystemCriteria();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      ipAccessoryStageSystemCriteria();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (BOOL)shouldRun
{
  void *v3;
  BOOL v4;
  void *v5;
  HMDAccessoryFirmwareUpdateRegisterTask *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAccessoryFirmwareUpdateTask shouldRunOnCurrentDevice](self, "shouldRunOnCurrentDevice");
  if (!v4)
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
      v10 = objc_msgSend(v3, "sessionState");
      if ((unint64_t)(v10 - 1) > 2)
        v11 = CFSTR("Up-To-Date");
      else
        v11 = off_1E89B4FC0[v10 - 1];
      v12 = v11;
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Register task shouldn't run - runOnCurrentDevice:%@ (%@)", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }

  return v4;
}

- (void)run
{
  id v2;

  -[HMDAccessoryFirmwareUpdateTask session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeWithState:", 3);

}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

@end
