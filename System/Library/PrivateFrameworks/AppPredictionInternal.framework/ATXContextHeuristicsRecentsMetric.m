@implementation ATXContextHeuristicsRecentsMetric

- (id)metricName
{
  return CFSTR("com.apple.zkw.recents");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[10];
  _QWORD v26[12];

  v26[10] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("recentType");
  -[ATXContextHeuristicsRecentsMetric recentType](self, "recentType");
  v3 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v3;
  v26[0] = v3;
  v25[1] = CFSTR("recentAge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsRecentsMetric recentAge](self, "recentAge"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  v25[2] = CFSTR("numEngaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsRecentsMetric numEngaged](self, "numEngaged"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v22;
  v25[3] = CFSTR("numSearched");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsRecentsMetric numSearched](self, "numSearched"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v21;
  v25[4] = CFSTR("trialDeploymentId");
  -[ATXContextHeuristicsRecentsMetric trialDeploymentId](self, "trialDeploymentId");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v4;
  v26[4] = v4;
  v25[5] = CFSTR("trialExperimentId");
  -[ATXContextHeuristicsRecentsMetric trialExperimentId](self, "trialExperimentId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v6;
  v25[6] = CFSTR("trialTreatmentId");
  -[ATXContextHeuristicsRecentsMetric trialTreatmentId](self, "trialTreatmentId", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[6] = v9;
  v25[7] = CFSTR("atxTrialDeploymentId");
  -[ATXContextHeuristicsRecentsMetric atxTrialDeploymentId](self, "atxTrialDeploymentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[7] = v11;
  v25[8] = CFSTR("atxTrialExperimentId");
  -[ATXContextHeuristicsRecentsMetric atxTrialExperimentId](self, "atxTrialExperimentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[8] = v13;
  v25[9] = CFSTR("atxTrialTreatmentId");
  -[ATXContextHeuristicsRecentsMetric atxTrialTreatmentId](self, "atxTrialTreatmentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[9] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v12)
  if (!v10)

  if (!v8)
  if (!v7)

  if (!v5)
  if (!v24)

  return v20;
}

- (NSString)recentType
{
  return self->_recentType;
}

- (void)setRecentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)recentAge
{
  return self->_recentAge;
}

- (void)setRecentAge:(unint64_t)a3
{
  self->_recentAge = a3;
}

- (unint64_t)numEngaged
{
  return self->_numEngaged;
}

- (void)setNumEngaged:(unint64_t)a3
{
  self->_numEngaged = a3;
}

- (unint64_t)numSearched
{
  return self->_numSearched;
}

- (void)setNumSearched:(unint64_t)a3
{
  self->_numSearched = a3;
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)atxTrialDeploymentId
{
  return self->_atxTrialDeploymentId;
}

- (void)setAtxTrialDeploymentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)atxTrialExperimentId
{
  return self->_atxTrialExperimentId;
}

- (void)setAtxTrialExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)atxTrialTreatmentId
{
  return self->_atxTrialTreatmentId;
}

- (void)setAtxTrialTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atxTrialTreatmentId, 0);
  objc_storeStrong((id *)&self->_atxTrialExperimentId, 0);
  objc_storeStrong((id *)&self->_atxTrialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_recentType, 0);
}

@end
