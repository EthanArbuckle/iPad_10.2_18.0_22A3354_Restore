@implementation HMDUserCloudShareOwnerAdoptionDailyEvent

- (HMDUserCloudShareOwnerAdoptionDailyEvent)initWithConfigureState:(int64_t)a3 isPrimaryResident:(BOOL)a4 trustStatusCounts:(CloudShareTrustManagerTrustStatusCounts *)a5
{
  _BOOL8 v6;
  HMDUserCloudShareOwnerAdoptionDailyEvent *v8;
  uint64_t v9;
  NSNumber *configureState;
  uint64_t v11;
  NSNumber *isPrimaryResident;
  uint64_t v13;
  NSNumber *hasSharedUser;
  uint64_t v15;
  NSNumber *percentageOfParticipantsHaveAccepted;
  uint64_t v17;
  NSNumber *percentageOfParticipantsHaveCloudShareIDAndHaveAccepted;
  uint64_t v19;
  NSNumber *percentageOfParticipantsHaveCloudShareIDButNotAccepted;
  uint64_t v21;
  NSNumber *percentageOfNonAcceptedParticipantsWithKnownCapability;
  uint64_t v23;
  NSNumber *percentageOfUsersThatAreNotParticipant;
  uint64_t v25;
  NSNumber *percentageOfParticipatingUsersThatNotAccepted;
  uint64_t v27;
  NSNumber *percentageOfAcceptedParticipantsWithoutCloudShareID;
  objc_super v30;

  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HMDUserCloudShareOwnerAdoptionDailyEvent;
  v8 = -[HMMLogEvent init](&v30, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    configureState = v8->_configureState;
    v8->_configureState = (NSNumber *)v9;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    isPrimaryResident = v8->_isPrimaryResident;
    v8->_isPrimaryResident = (NSNumber *)v11;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5->var0);
    v13 = objc_claimAutoreleasedReturnValue();
    hasSharedUser = v8->_hasSharedUser;
    v8->_hasSharedUser = (NSNumber *)v13;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var1);
    v15 = objc_claimAutoreleasedReturnValue();
    percentageOfParticipantsHaveAccepted = v8->_percentageOfParticipantsHaveAccepted;
    v8->_percentageOfParticipantsHaveAccepted = (NSNumber *)v15;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var2);
    v17 = objc_claimAutoreleasedReturnValue();
    percentageOfParticipantsHaveCloudShareIDAndHaveAccepted = v8->_percentageOfParticipantsHaveCloudShareIDAndHaveAccepted;
    v8->_percentageOfParticipantsHaveCloudShareIDAndHaveAccepted = (NSNumber *)v17;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var3);
    v19 = objc_claimAutoreleasedReturnValue();
    percentageOfParticipantsHaveCloudShareIDButNotAccepted = v8->_percentageOfParticipantsHaveCloudShareIDButNotAccepted;
    v8->_percentageOfParticipantsHaveCloudShareIDButNotAccepted = (NSNumber *)v19;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var4);
    v21 = objc_claimAutoreleasedReturnValue();
    percentageOfNonAcceptedParticipantsWithKnownCapability = v8->_percentageOfNonAcceptedParticipantsWithKnownCapability;
    v8->_percentageOfNonAcceptedParticipantsWithKnownCapability = (NSNumber *)v21;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var5);
    v23 = objc_claimAutoreleasedReturnValue();
    percentageOfUsersThatAreNotParticipant = v8->_percentageOfUsersThatAreNotParticipant;
    v8->_percentageOfUsersThatAreNotParticipant = (NSNumber *)v23;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var6);
    v25 = objc_claimAutoreleasedReturnValue();
    percentageOfParticipatingUsersThatNotAccepted = v8->_percentageOfParticipatingUsersThatNotAccepted;
    v8->_percentageOfParticipatingUsersThatNotAccepted = (NSNumber *)v25;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5->var7);
    v27 = objc_claimAutoreleasedReturnValue();
    percentageOfAcceptedParticipantsWithoutCloudShareID = v8->_percentageOfAcceptedParticipantsWithoutCloudShareID;
    v8->_percentageOfAcceptedParticipantsWithoutCloudShareID = (NSNumber *)v27;

  }
  return v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.trustManager.adoption.owner");
}

- (NSDictionary)coreAnalyticsEventDictionary
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

  v16[10] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("configureState");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent configureState](self, "configureState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("isPrimaryResident");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent isPrimaryResident](self, "isPrimaryResident");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("hasSharedUser");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent hasSharedUser](self, "hasSharedUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("percentageOfParticipantsHaveAccepted");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfParticipantsHaveAccepted](self, "percentageOfParticipantsHaveAccepted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("percentageOfParticipantsHaveCloudShareIDAndHaveAccepted");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfParticipantsHaveCloudShareIDAndHaveAccepted](self, "percentageOfParticipantsHaveCloudShareIDAndHaveAccepted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("percentageOfParticipantsHaveCloudShareIDButNotAccepted");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfParticipantsHaveCloudShareIDButNotAccepted](self, "percentageOfParticipantsHaveCloudShareIDButNotAccepted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("percentageOfNonAcceptedParticipantsWithKnownCapability");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfNonAcceptedParticipantsWithKnownCapability](self, "percentageOfNonAcceptedParticipantsWithKnownCapability");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("percentageOfUsersThatAreNotParticipant");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfUsersThatAreNotParticipant](self, "percentageOfUsersThatAreNotParticipant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("percentageOfParticipatingUsersThatNotAccepted");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfParticipatingUsersThatNotAccepted](self, "percentageOfParticipatingUsersThatNotAccepted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("percentageOfAcceptedParticipantsWithoutCloudShareID");
  -[HMDUserCloudShareOwnerAdoptionDailyEvent percentageOfAcceptedParticipantsWithoutCloudShareID](self, "percentageOfAcceptedParticipantsWithoutCloudShareID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)configureState
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)isPrimaryResident
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)hasSharedUser
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)percentageOfParticipantsHaveAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)percentageOfParticipantsHaveCloudShareIDAndHaveAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)percentageOfParticipantsHaveCloudShareIDButNotAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)percentageOfNonAcceptedParticipantsWithKnownCapability
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)percentageOfUsersThatAreNotParticipant
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)percentageOfParticipatingUsersThatNotAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)percentageOfAcceptedParticipantsWithoutCloudShareID
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageOfAcceptedParticipantsWithoutCloudShareID, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipatingUsersThatNotAccepted, 0);
  objc_storeStrong((id *)&self->_percentageOfUsersThatAreNotParticipant, 0);
  objc_storeStrong((id *)&self->_percentageOfNonAcceptedParticipantsWithKnownCapability, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipantsHaveCloudShareIDButNotAccepted, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipantsHaveCloudShareIDAndHaveAccepted, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipantsHaveAccepted, 0);
  objc_storeStrong((id *)&self->_hasSharedUser, 0);
  objc_storeStrong((id *)&self->_isPrimaryResident, 0);
  objc_storeStrong((id *)&self->_configureState, 0);
}

@end
