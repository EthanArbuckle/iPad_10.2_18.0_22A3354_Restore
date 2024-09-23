@implementation ATXDigestOnboardingMetrics

- (id)metricName
{
  return CFSTR("com.apple.digestSetupFlow.digestSetupEvent");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[10];
  _QWORD v26[12];

  v26[10] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("sessionUUID");
  -[ATXDigestOnboardingMetrics sessionUUID](self, "sessionUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v26[0] = v3;
  v25[1] = CFSTR("entrySource");
  -[ATXDigestOnboardingMetrics entrySource](self, "entrySource");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v5;
  v26[1] = v5;
  v25[2] = CFSTR("digestOnboardingOutcome");
  -[ATXDigestOnboardingMetrics digestOnboardingOutcome](self, "digestOnboardingOutcome");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v24 = v4;
  v21 = (void *)v7;
  v26[2] = v7;
  v25[3] = CFSTR("finalUIShown");
  -[ATXDigestOnboardingMetrics finalUIShown](self, "finalUIShown");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v26[3] = v9;
  v25[4] = CFSTR("didSelectShowMore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXDigestOnboardingMetrics didSelectShowMore](self, "didSelectShowMore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v11;
  v25[5] = CFSTR("timeTaken");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDigestOnboardingMetrics timeTaken](self, "timeTaken");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v13;
  v25[6] = CFSTR("deliveryTime1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXDigestOnboardingMetrics deliveryTime1](self, "deliveryTime1"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v14;
  v25[7] = CFSTR("deliveryTime2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXDigestOnboardingMetrics deliveryTime2](self, "deliveryTime2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v15;
  v25[8] = CFSTR("deliveryTime3");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXDigestOnboardingMetrics deliveryTime3](self, "deliveryTime3"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v16;
  v25[9] = CFSTR("numScheduledDeliveries");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestOnboardingMetrics numScheduledDeliveries](self, "numScheduledDeliveries"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  if (!v8)

  if (!v6)
  if (!v24)

  return v18;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (NSString)entrySource
{
  return self->_entrySource;
}

- (void)setEntrySource:(id)a3
{
  objc_storeStrong((id *)&self->_entrySource, a3);
}

- (NSString)digestOnboardingOutcome
{
  return self->_digestOnboardingOutcome;
}

- (void)setDigestOnboardingOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingOutcome, a3);
}

- (NSString)finalUIShown
{
  return self->_finalUIShown;
}

- (void)setFinalUIShown:(id)a3
{
  objc_storeStrong((id *)&self->_finalUIShown, a3);
}

- (BOOL)didSelectShowMore
{
  return self->_didSelectShowMore;
}

- (void)setDidSelectShowMore:(BOOL)a3
{
  self->_didSelectShowMore = a3;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (void)setTimeTaken:(double)a3
{
  self->_timeTaken = a3;
}

- (int64_t)deliveryTime1
{
  return self->_deliveryTime1;
}

- (void)setDeliveryTime1:(int64_t)a3
{
  self->_deliveryTime1 = a3;
}

- (int64_t)deliveryTime2
{
  return self->_deliveryTime2;
}

- (void)setDeliveryTime2:(int64_t)a3
{
  self->_deliveryTime2 = a3;
}

- (int64_t)deliveryTime3
{
  return self->_deliveryTime3;
}

- (void)setDeliveryTime3:(int64_t)a3
{
  self->_deliveryTime3 = a3;
}

- (unint64_t)numScheduledDeliveries
{
  return self->_numScheduledDeliveries;
}

- (void)setNumScheduledDeliveries:(unint64_t)a3
{
  self->_numScheduledDeliveries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalUIShown, 0);
  objc_storeStrong((id *)&self->_digestOnboardingOutcome, 0);
  objc_storeStrong((id *)&self->_entrySource, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
