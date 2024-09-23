@implementation ATXDigestOnboardingAppSelectionMetrics

- (id)metricName
{
  return CFSTR("com.apple.digestSetupFlowEvent.digestAppSelectionEvent");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[8];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("sessionUUID");
  -[ATXDigestOnboardingAppSelectionMetrics sessionUUID](self, "sessionUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v3;
  v16[1] = CFSTR("bundleId");
  -[ATXDigestOnboardingAppSelectionMetrics bundleId](self, "bundleId", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("basicNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics avgNumBasicNotifications](self, "avgNumBasicNotifications"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = CFSTR("messageNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics avgNumMessageNotfications](self, "avgNumMessageNotfications"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("timeSensitiveNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics avgNumTimeSensitiveNonMessageNotifications](self, "avgNumTimeSensitiveNonMessageNotifications"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  v16[5] = CFSTR("rank");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics rank](self, "rank"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  v16[6] = CFSTR("addedToDigest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXDigestOnboardingAppSelectionMetrics addedToDigest](self, "addedToDigest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v11;
  v16[7] = CFSTR("wasShownInDigest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXDigestOnboardingAppSelectionMetrics wasShownInDigestOnboarding](self, "wasShownInDigestOnboarding"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (!v4)

  return v13;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (unint64_t)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (void)setAvgNumBasicNotifications:(unint64_t)a3
{
  self->_avgNumBasicNotifications = a3;
}

- (unint64_t)avgNumMessageNotfications
{
  return self->_avgNumMessageNotfications;
}

- (void)setAvgNumMessageNotfications:(unint64_t)a3
{
  self->_avgNumMessageNotfications = a3;
}

- (unint64_t)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (void)setAvgNumTimeSensitiveNonMessageNotifications:(unint64_t)a3
{
  self->_avgNumTimeSensitiveNonMessageNotifications = a3;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (BOOL)addedToDigest
{
  return self->_addedToDigest;
}

- (void)setAddedToDigest:(BOOL)a3
{
  self->_addedToDigest = a3;
}

- (BOOL)wasShownInDigestOnboarding
{
  return self->_wasShownInDigestOnboarding;
}

- (void)setWasShownInDigestOnboarding:(BOOL)a3
{
  self->_wasShownInDigestOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
