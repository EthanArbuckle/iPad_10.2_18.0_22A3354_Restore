@implementation HMDLegacyPrimaryElectionConfirmationLogEvent

- (HMDLegacyPrimaryElectionConfirmationLogEvent)init
{
  HMDLegacyPrimaryElectionConfirmationLogEvent *v2;
  NSString *criteria;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDLegacyPrimaryElectionConfirmationLogEvent;
  v2 = -[HMMLogEvent init](&v5, sel_init);
  criteria = v2->_criteria;
  v2->_criteria = (NSString *)CFSTR("unknown");

  return v2;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.election.legacy.confirmation");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  unint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  if (-[HMDLegacyPrimaryElectionConfirmationLogEvent availableResidentCount](self, "availableResidentCount"))
  {
    v3 = -[HMDLegacyPrimaryElectionConfirmationLogEvent residentsRespondedCount](self, "residentsRespondedCount");
    v4 = (double)(100
                * (v3
                 / -[HMDLegacyPrimaryElectionConfirmationLogEvent availableResidentCount](self, "availableResidentCount")));
  }
  else
  {
    v4 = 0.0;
  }
  v12[0] = CFSTR("availableResidents");
  +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intervalIndexForValue:", -[HMDLegacyPrimaryElectionConfirmationLogEvent availableResidentCount](self, "availableResidentCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("respondedResidentsPercentage");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("criteria");
  -[HMDLegacyPrimaryElectionConfirmationLogEvent criteria](self, "criteria");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v12[3] = CFSTR("changedPrimary");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDLegacyPrimaryElectionConfirmationLogEvent changedPrimary](self, "changedPrimary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = CFSTR("eventCount");
  v13[3] = v9;
  v13[4] = &unk_24E96D598;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (unint64_t)availableResidentCount
{
  return self->_availableResidentCount;
}

- (void)setAvailableResidentCount:(unint64_t)a3
{
  self->_availableResidentCount = a3;
}

- (unint64_t)residentsRespondedCount
{
  return self->_residentsRespondedCount;
}

- (void)setResidentsRespondedCount:(unint64_t)a3
{
  self->_residentsRespondedCount = a3;
}

- (NSString)criteria
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCriteria:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)changedPrimary
{
  return self->_changedPrimary;
}

- (void)setChangedPrimary:(BOOL)a3
{
  self->_changedPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
}

@end
