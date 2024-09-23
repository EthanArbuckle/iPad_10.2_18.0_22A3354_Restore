@implementation HMDMultiUserSettingsLogEvent

- (HMDMultiUserSettingsLogEvent)initWithMultiUserSettings:(id)a3
{
  id v5;
  HMDMultiUserSettingsLogEvent *v6;
  HMDMultiUserSettingsLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMultiUserSettingsLogEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_multiUserSettings, a3);

  return v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDMultiUserSettingsLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  -[HMDMultiUserSettingsLogEvent multiUserSettings](self, "multiUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("numSharedUsers");
  objc_msgSend(v2, "numSharedUsers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("numUsersWithSettings");
  objc_msgSend(v2, "numUsersWithSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  v15[2] = CFSTR("numUsersWithIdentifyVoiceOff");
  objc_msgSend(v2, "numUsersWithIdentifyVoiceOff");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  v15[3] = CFSTR("numUsersWithPlayBackInfluencesForYouOff");
  objc_msgSend(v2, "numUsersWithPlayBackInfluencesForYouOff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  v15[4] = CFSTR("numUsersCloudShareTrustNotConfigured");
  objc_msgSend(v2, "numUsersCloudShareTrustNotConfigured");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  v15[5] = CFSTR("numUsersSharedBackingStoreNotStarted");
  objc_msgSend(v2, "numUsersSharedBackingStoreNotStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v6;
  v15[6] = CFSTR("numUsersSharedBackingStoreRunning");
  objc_msgSend(v2, "numUsersSharedBackingStoreRunning");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v7;
  v15[7] = CFSTR("numUsersSharedBackingStoreNotRunningDueToError");
  objc_msgSend(v2, "numUsersSharedBackingStoreNotRunningDueToError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v8;
  v15[8] = CFSTR("numUsersSharedBackingStoreNotRunningDueToStopped");
  objc_msgSend(v2, "numUsersSharedBackingStoreNotRunningDueToStopped");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v9;
  v15[9] = CFSTR("numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation");
  objc_msgSend(v2, "numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMMultiUserSettingsForMetrics)multiUserSettings
{
  return (HMMultiUserSettingsForMetrics *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserSettings, 0);
}

@end
