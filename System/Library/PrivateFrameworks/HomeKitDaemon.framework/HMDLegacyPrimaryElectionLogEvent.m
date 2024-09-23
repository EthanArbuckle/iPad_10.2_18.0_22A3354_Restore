@implementation HMDLegacyPrimaryElectionLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.election.legacy");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("reason");
  -[HMDLegacyPrimaryElectionLogEvent reason](self, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("criteria");
  -[HMDLegacyPrimaryElectionLogEvent criteria](self, "criteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("availableResidents");
  +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intervalIndexForValue:", -[HMDLegacyPrimaryElectionLogEvent availableResidentCount](self, "availableResidentCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = CFSTR("eventCount");
  v10[2] = v6;
  v10[3] = &unk_24E96D3E8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)criteria
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCriteria:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)availableResidentCount
{
  return self->_availableResidentCount;
}

- (void)setAvailableResidentCount:(unint64_t)a3
{
  self->_availableResidentCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
