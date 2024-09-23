@implementation ATXContextHeuristicsLifetimeEngagementMetric

- (id)metricName
{
  return CFSTR("com.apple.proactive.zkw.lifetimeEngagement");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[10];
  _QWORD v29[12];

  v29[10] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("actionId");
  -[ATXContextHeuristicsLifetimeEngagementMetric actionId](self, "actionId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v27 = v4;
  v22 = (void *)v3;
  v29[0] = v3;
  v28[1] = CFSTR("contextType");
  -[ATXContextHeuristicsLifetimeEngagementMetric contextType](self, "contextType");
  v5 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v5;
  v29[1] = v5;
  v28[2] = CFSTR("numShown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsLifetimeEngagementMetric numShown](self, "numShown"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v25;
  v28[3] = CFSTR("numEngaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsLifetimeEngagementMetric numEngaged](self, "numEngaged"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v24;
  v28[4] = CFSTR("trialDeploymentId");
  -[ATXContextHeuristicsLifetimeEngagementMetric trialDeploymentId](self, "trialDeploymentId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v6;
  v29[4] = v6;
  v28[5] = CFSTR("trialExperimentId");
  -[ATXContextHeuristicsLifetimeEngagementMetric trialExperimentId](self, "trialExperimentId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v8;
  v29[5] = v8;
  v28[6] = CFSTR("trialTreatmentId");
  -[ATXContextHeuristicsLifetimeEngagementMetric trialTreatmentId](self, "trialTreatmentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[6] = v11;
  v28[7] = CFSTR("atxTrialDeploymentId");
  -[ATXContextHeuristicsLifetimeEngagementMetric atxTrialDeploymentId](self, "atxTrialDeploymentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[7] = v13;
  v28[8] = CFSTR("atxTrialExperimentId");
  -[ATXContextHeuristicsLifetimeEngagementMetric atxTrialExperimentId](self, "atxTrialExperimentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[8] = v15;
  v28[9] = CFSTR("atxTrialTreatmentId");
  -[ATXContextHeuristicsLifetimeEngagementMetric atxTrialTreatmentId](self, "atxTrialTreatmentId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 10);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)

  if (!v14)
  if (!v12)

  if (!v10)
  if (!v9)

  if (!v7)
  if (!v26)

  if (!v27)
  return v23;
}

- (NSString)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)numShown
{
  return self->_numShown;
}

- (void)setNumShown:(unint64_t)a3
{
  self->_numShown = a3;
}

- (unint64_t)numEngaged
{
  return self->_numEngaged;
}

- (void)setNumEngaged:(unint64_t)a3
{
  self->_numEngaged = a3;
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
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
}

@end
