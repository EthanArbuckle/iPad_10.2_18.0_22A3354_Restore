@implementation HMMultiUserSettingsForMetrics

- (HMMultiUserSettingsForMetrics)initWithNumSharedUsers:(int64_t)a3 numUsersWithSettings:(int64_t)a4 numUsersWithIdentifyVoiceOff:(int64_t)a5 numUsersWithPlayBackInfluencesForYouOff:(int64_t)a6 numUsersCloudShareTrustNotConfigured:(int64_t)a7 numUsersSharedBackingStoreNotStarted:(int64_t)a8 numUsersSharedBackingStoreRunning:(int64_t)a9 numUsersSharedBackingStoreNotRunningDueToError:(int64_t)a10 numUsersSharedBackingStoreNotRunningDueToStopped:(int64_t)a11 numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:(int64_t)a12
{
  HMMultiUserSettingsForMetrics *v18;
  uint64_t v19;
  NSNumber *numSharedUsers;
  uint64_t v21;
  NSNumber *numUsersWithSettings;
  uint64_t v23;
  NSNumber *numUsersWithIdentifyVoiceOff;
  uint64_t v25;
  NSNumber *numUsersWithPlayBackInfluencesForYouOff;
  uint64_t v27;
  NSNumber *numUsersCloudShareTrustNotConfigured;
  uint64_t v29;
  NSNumber *numUsersSharedBackingStoreNotStarted;
  uint64_t v31;
  NSNumber *numUsersSharedBackingStoreRunning;
  uint64_t v33;
  NSNumber *numUsersSharedBackingStoreNotRunningDueToError;
  uint64_t v35;
  NSNumber *numUsersSharedBackingStoreNotRunningDueToStopped;
  uint64_t v37;
  NSNumber *numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)HMMultiUserSettingsForMetrics;
  v18 = -[HMMultiUserSettingsForMetrics init](&v40, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v19 = objc_claimAutoreleasedReturnValue();
    numSharedUsers = v18->_numSharedUsers;
    v18->_numSharedUsers = (NSNumber *)v19;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v21 = objc_claimAutoreleasedReturnValue();
    numUsersWithSettings = v18->_numUsersWithSettings;
    v18->_numUsersWithSettings = (NSNumber *)v21;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v23 = objc_claimAutoreleasedReturnValue();
    numUsersWithIdentifyVoiceOff = v18->_numUsersWithIdentifyVoiceOff;
    v18->_numUsersWithIdentifyVoiceOff = (NSNumber *)v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v25 = objc_claimAutoreleasedReturnValue();
    numUsersWithPlayBackInfluencesForYouOff = v18->_numUsersWithPlayBackInfluencesForYouOff;
    v18->_numUsersWithPlayBackInfluencesForYouOff = (NSNumber *)v25;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
    v27 = objc_claimAutoreleasedReturnValue();
    numUsersCloudShareTrustNotConfigured = v18->_numUsersCloudShareTrustNotConfigured;
    v18->_numUsersCloudShareTrustNotConfigured = (NSNumber *)v27;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v29 = objc_claimAutoreleasedReturnValue();
    numUsersSharedBackingStoreNotStarted = v18->_numUsersSharedBackingStoreNotStarted;
    v18->_numUsersSharedBackingStoreNotStarted = (NSNumber *)v29;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a9);
    v31 = objc_claimAutoreleasedReturnValue();
    numUsersSharedBackingStoreRunning = v18->_numUsersSharedBackingStoreRunning;
    v18->_numUsersSharedBackingStoreRunning = (NSNumber *)v31;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a10);
    v33 = objc_claimAutoreleasedReturnValue();
    numUsersSharedBackingStoreNotRunningDueToError = v18->_numUsersSharedBackingStoreNotRunningDueToError;
    v18->_numUsersSharedBackingStoreNotRunningDueToError = (NSNumber *)v33;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
    v35 = objc_claimAutoreleasedReturnValue();
    numUsersSharedBackingStoreNotRunningDueToStopped = v18->_numUsersSharedBackingStoreNotRunningDueToStopped;
    v18->_numUsersSharedBackingStoreNotRunningDueToStopped = (NSNumber *)v35;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a12);
    v37 = objc_claimAutoreleasedReturnValue();
    numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation = v18->_numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation;
    v18->_numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation = (NSNumber *)v37;

  }
  return v18;
}

- (HMMultiUserSettingsForMetrics)initWithPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMMultiUserSettingsForMetrics *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numSharedUsers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersWithSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersCloudShareTrustNotConfigured"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersWithIdentifyVoiceOff"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersWithPlayBackInfluencesForYouOff"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersSharedBackingStoreNotStarted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersSharedBackingStoreRunning"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersSharedBackingStoreNotRunningDueToError"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersSharedBackingStoreNotRunningDueToStopped"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMMultiUserSettingsForMetrics initWithNumSharedUsers:numUsersWithSettings:numUsersWithIdentifyVoiceOff:numUsersWithPlayBackInfluencesForYouOff:numUsersCloudShareTrustNotConfigured:numUsersSharedBackingStoreNotStarted:numUsersSharedBackingStoreRunning:numUsersSharedBackingStoreNotRunningDueToError:numUsersSharedBackingStoreNotRunningDueToStopped:numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:](self, "initWithNumSharedUsers:numUsersWithSettings:numUsersWithIdentifyVoiceOff:numUsersWithPlayBackInfluencesForYouOff:numUsersCloudShareTrustNotConfigured:numUsersSharedBackingStoreNotStarted:numUsersSharedBackingStoreRunning:numUsersSharedBackingStoreNotRunningDueToError:numUsersSharedBackingStoreNotRunningDueToStopped:numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:", (int)objc_msgSend(v15, "intValue"), (int)objc_msgSend(v14, "intValue"), (int)objc_msgSend(v13, "intValue"), (int)objc_msgSend(v11, "intValue"), (int)objc_msgSend(v12, "intValue"), (int)objc_msgSend(v10, "intValue"), (int)objc_msgSend(v8, "intValue"), (int)objc_msgSend(v4, "intValue"), (int)objc_msgSend(v9, "intValue"), (int)objc_msgSend(v5, "intValue"));
  return v6;
}

- (id)payloadCopy
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
  void *v12;
  void *v14;
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("numSharedUsers");
  -[HMMultiUserSettingsForMetrics numSharedUsers](self, "numSharedUsers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("numUsersWithSettings");
  -[HMMultiUserSettingsForMetrics numUsersWithSettings](self, "numUsersWithSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("numUsersCloudShareTrustNotConfigured");
  -[HMMultiUserSettingsForMetrics numUsersCloudShareTrustNotConfigured](self, "numUsersCloudShareTrustNotConfigured");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("numUsersWithIdentifyVoiceOff");
  -[HMMultiUserSettingsForMetrics numUsersWithIdentifyVoiceOff](self, "numUsersWithIdentifyVoiceOff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("numUsersWithPlayBackInfluencesForYouOff");
  -[HMMultiUserSettingsForMetrics numUsersWithPlayBackInfluencesForYouOff](self, "numUsersWithPlayBackInfluencesForYouOff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("numUsersSharedBackingStoreNotStarted");
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreNotStarted](self, "numUsersSharedBackingStoreNotStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("numUsersSharedBackingStoreRunning");
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreRunning](self, "numUsersSharedBackingStoreRunning");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("numUsersSharedBackingStoreNotRunningDueToError");
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreNotRunningDueToError](self, "numUsersSharedBackingStoreNotRunningDueToError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("numUsersSharedBackingStoreNotRunningDueToStopped");
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreNotRunningDueToStopped](self, "numUsersSharedBackingStoreNotRunningDueToStopped");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation");
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation](self, "numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSString)description
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
  void *v12;
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[HMMultiUserSettingsForMetrics numSharedUsers](self, "numSharedUsers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersWithSettings](self, "numUsersWithSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersWithIdentifyVoiceOff](self, "numUsersWithIdentifyVoiceOff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersWithPlayBackInfluencesForYouOff](self, "numUsersWithPlayBackInfluencesForYouOff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersCloudShareTrustNotConfigured](self, "numUsersCloudShareTrustNotConfigured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreNotStarted](self, "numUsersSharedBackingStoreNotStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreRunning](self, "numUsersSharedBackingStoreRunning");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreNotRunningDueToError](self, "numUsersSharedBackingStoreNotRunningDueToError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreNotRunningDueToStopped](self, "numUsersSharedBackingStoreNotRunningDueToStopped");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMultiUserSettingsForMetrics numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation](self, "numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<HMMultiUserSettingsForMetrics> {\n            numSharedUsers: %@\n            numUsersWithSettings: %@\n            numUsersWithIdentifyVoiceOff: %@\n            numUsersWithPlayBackInfluencesForYouOff: %@\n            numUsersCloudShareTrustNotConfigured: %@\n            numUsersSharedBackingStoreNotStarted: %@\n            numUsersSharedBackingStoreRunning: %@\n            numUsersSharedBackingStoreNotRunningDueToError: %@\n            numUsersSharedBackingStoreNotRunningDueToStopped: %@\n            numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation: %@\n}"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  return 0;
}

- (NSNumber)numSharedUsers
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNumSharedUsers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)numUsersWithSettings
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNumUsersWithSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)numUsersWithIdentifyVoiceOff
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNumUsersWithIdentifyVoiceOff:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)numUsersWithPlayBackInfluencesForYouOff
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNumUsersWithPlayBackInfluencesForYouOff:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)numUsersCloudShareTrustNotConfigured
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNumUsersCloudShareTrustNotConfigured:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)numUsersSharedBackingStoreNotStarted
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNumUsersSharedBackingStoreNotStarted:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)numUsersSharedBackingStoreRunning
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNumUsersSharedBackingStoreRunning:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)numUsersSharedBackingStoreNotRunningDueToError
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNumUsersSharedBackingStoreNotRunningDueToError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)numUsersSharedBackingStoreNotRunningDueToStopped
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNumUsersSharedBackingStoreNotRunningDueToStopped:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNumUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreNotRunningDueToStopped, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreNotRunningDueToError, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreRunning, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreNotStarted, 0);
  objc_storeStrong((id *)&self->_numUsersCloudShareTrustNotConfigured, 0);
  objc_storeStrong((id *)&self->_numUsersWithPlayBackInfluencesForYouOff, 0);
  objc_storeStrong((id *)&self->_numUsersWithIdentifyVoiceOff, 0);
  objc_storeStrong((id *)&self->_numUsersWithSettings, 0);
  objc_storeStrong((id *)&self->_numSharedUsers, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_39318 != -1)
    dispatch_once(&logCategory__hmf_once_t0_39318, &__block_literal_global_39319);
  return (id)logCategory__hmf_once_v1_39320;
}

void __44__HMMultiUserSettingsForMetrics_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_39320;
  logCategory__hmf_once_v1_39320 = v0;

}

@end
