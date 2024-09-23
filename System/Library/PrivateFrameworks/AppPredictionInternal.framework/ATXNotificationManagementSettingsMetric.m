@implementation ATXNotificationManagementSettingsMetric

- (id)metricName
{
  return CFSTR("com.apple.NotificationManagement.Settings");
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("numDailyDigests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationManagementSettingsMetric numDailyDigests](self, "numDailyDigests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("numDigestApps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationManagementSettingsMetric numDigestApps](self, "numDigestApps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("numConfiguredModes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationManagementSettingsMetric numConfiguredModes](self, "numConfiguredModes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("hasOfferedDigest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXNotificationManagementSettingsMetric hasOfferedDigest](self, "hasOfferedDigest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("hasSetupDigest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXNotificationManagementSettingsMetric hasSetupDigest](self, "hasSetupDigest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATXNotificationManagementSettingsMetric numDailyDigests:%lu\nnumDigestApps:%lu\nnumConfiguredModes:%lu\nhasOfferedDigest:%d\nhasSetupDigest:%d"), -[ATXNotificationManagementSettingsMetric numDailyDigests](self, "numDailyDigests"), -[ATXNotificationManagementSettingsMetric numDigestApps](self, "numDigestApps"), -[ATXNotificationManagementSettingsMetric numConfiguredModes](self, "numConfiguredModes"), -[ATXNotificationManagementSettingsMetric hasOfferedDigest](self, "hasOfferedDigest"), -[ATXNotificationManagementSettingsMetric hasSetupDigest](self, "hasSetupDigest"));
}

- (unint64_t)numDailyDigests
{
  return self->_numDailyDigests;
}

- (void)setNumDailyDigests:(unint64_t)a3
{
  self->_numDailyDigests = a3;
}

- (unint64_t)numDigestApps
{
  return self->_numDigestApps;
}

- (void)setNumDigestApps:(unint64_t)a3
{
  self->_numDigestApps = a3;
}

- (unint64_t)numConfiguredModes
{
  return self->_numConfiguredModes;
}

- (void)setNumConfiguredModes:(unint64_t)a3
{
  self->_numConfiguredModes = a3;
}

- (BOOL)hasOfferedDigest
{
  return self->_hasOfferedDigest;
}

- (void)setHasOfferedDigest:(BOOL)a3
{
  self->_hasOfferedDigest = a3;
}

- (BOOL)hasSetupDigest
{
  return self->_hasSetupDigest;
}

- (void)setHasSetupDigest:(BOOL)a3
{
  self->_hasSetupDigest = a3;
}

@end
