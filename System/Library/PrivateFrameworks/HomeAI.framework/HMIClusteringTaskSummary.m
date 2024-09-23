@implementation HMIClusteringTaskSummary

- (HMIClusteringTaskSummary)init
{
  HMIClusteringTaskSummary *v2;
  HMIClusteringTaskSummary *v3;
  NSError *error;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIClusteringTaskSummary;
  v2 = -[HMIClusteringTaskSummary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfFaceprintsClustered = 0;
    v2->_numberOfClusters = 0;
    v2->_numberOfPersonsCreated = 0;
    v2->_numberOfUnknownFaceprintsAssociated = 0;
    v2->_faceprintingDuration = 0.0;
    v2->_clusteringDuration = 0.0;
    v2->_totalDuration = 0.0;
    error = v2->_error;
    v2->_error = 0;

  }
  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[9];

  v32[8] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIClusteringTaskSummary numberOfFaceprintsClustered](self, "numberOfFaceprintsClustered"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Faceprints"), v31);
  v32[0] = v30;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIClusteringTaskSummary numberOfClusters](self, "numberOfClusters"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Clusters"), v29);
  v32[1] = v28;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIClusteringTaskSummary numberOfPersonsCreated](self, "numberOfPersonsCreated"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Persons"), v27);
  v32[2] = v26;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIClusteringTaskSummary numberOfUnknownFaceprintsAssociated](self, "numberOfUnknownFaceprintsAssociated"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Associated"), v25);
  v32[3] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMIClusteringTaskSummary faceprintingDuration](self, "faceprintingDuration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Faceprinting Duration"), v10);
  v32[4] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[HMIClusteringTaskSummary clusteringDuration](self, "clusteringDuration");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Clustering Duration"), v14);
  v32[5] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[HMIClusteringTaskSummary totalDuration](self, "totalDuration");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Total Duration"), v18);
  v32[6] = v19;
  v20 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIClusteringTaskSummary error](self, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("Error"), v21);
  v32[7] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (int64_t)numberOfFaceprintsClustered
{
  return self->_numberOfFaceprintsClustered;
}

- (void)setNumberOfFaceprintsClustered:(int64_t)a3
{
  self->_numberOfFaceprintsClustered = a3;
}

- (int64_t)numberOfClusters
{
  return self->_numberOfClusters;
}

- (void)setNumberOfClusters:(int64_t)a3
{
  self->_numberOfClusters = a3;
}

- (int64_t)numberOfPersonsCreated
{
  return self->_numberOfPersonsCreated;
}

- (void)setNumberOfPersonsCreated:(int64_t)a3
{
  self->_numberOfPersonsCreated = a3;
}

- (int64_t)numberOfUnknownFaceprintsAssociated
{
  return self->_numberOfUnknownFaceprintsAssociated;
}

- (void)setNumberOfUnknownFaceprintsAssociated:(int64_t)a3
{
  self->_numberOfUnknownFaceprintsAssociated = a3;
}

- (double)faceprintingDuration
{
  return self->_faceprintingDuration;
}

- (void)setFaceprintingDuration:(double)a3
{
  self->_faceprintingDuration = a3;
}

- (double)clusteringDuration
{
  return self->_clusteringDuration;
}

- (void)setClusteringDuration:(double)a3
{
  self->_clusteringDuration = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
