@implementation VCPClusteringAccuracyMeasures

- (VCPClusteringAccuracyMeasures)init
{
  VCPClusteringAccuracyMeasures *v2;
  NSMutableArray *v3;
  NSMutableArray *precisionPerCluster;
  NSMutableArray *v5;
  NSMutableArray *recallPerPersonToGroundTruth;
  NSMutableArray *v7;
  NSMutableArray *recallPerPersonExcludeMissDetection;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VCPClusteringAccuracyMeasures;
  v2 = -[VCPClusteringAccuracyMeasures init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    precisionPerCluster = v2->_precisionPerCluster;
    v2->_precisionPerCluster = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recallPerPersonToGroundTruth = v2->_recallPerPersonToGroundTruth;
    v2->_recallPerPersonToGroundTruth = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recallPerPersonExcludeMissDetection = v2->_recallPerPersonExcludeMissDetection;
    v2->_recallPerPersonExcludeMissDetection = v7;

  }
  return v2;
}

- (void)addClusterPrecision:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 validFaceCount:(unint64_t)a6 identitySize:(unint64_t)a7
{
  id v12;
  NSMutableArray *precisionPerCluster;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  precisionPerCluster = self->_precisionPerCluster;
  v20[0] = CFSTR("precision");
  *(float *)&v14 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = v12;
  v20[1] = CFSTR("personID");
  v20[2] = CFSTR("personFaceCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v16;
  v20[3] = CFSTR("validFaceCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v17;
  v20[4] = CFSTR("identitySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](precisionPerCluster, "addObject:", v19);

}

- (void)addIdentityRecallToGroundTruth:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 identitySize:(unint64_t)a6
{
  id v10;
  NSMutableArray *recallPerPersonToGroundTruth;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  recallPerPersonToGroundTruth = self->_recallPerPersonToGroundTruth;
  v17[0] = CFSTR("recall");
  *(float *)&v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = v10;
  v17[1] = CFSTR("personID");
  v17[2] = CFSTR("personFaceCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("identitySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](recallPerPersonToGroundTruth, "addObject:", v16);

}

- (void)addIdentityRecallExcludeMissDetection:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 identitySize:(unint64_t)a6
{
  id v10;
  NSMutableArray *recallPerPersonExcludeMissDetection;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  recallPerPersonExcludeMissDetection = self->_recallPerPersonExcludeMissDetection;
  v17[0] = CFSTR("recall");
  *(float *)&v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = v10;
  v17[1] = CFSTR("personID");
  v17[2] = CFSTR("personFaceCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("identitySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](recallPerPersonExcludeMissDetection, "addObject:", v16);

}

- (float)weightedAveragePrecision
{
  return self->_weightedAveragePrecision;
}

- (void)setWeightedAveragePrecision:(float)a3
{
  self->_weightedAveragePrecision = a3;
}

- (float)weightedAverageRecall
{
  return self->_weightedAverageRecall;
}

- (void)setWeightedAverageRecall:(float)a3
{
  self->_weightedAverageRecall = a3;
}

- (float)numSingletons
{
  return self->_numSingletons;
}

- (void)setNumSingletons:(float)a3
{
  self->_numSingletons = a3;
}

- (float)numValidSingletons
{
  return self->_numValidSingletons;
}

- (void)setNumValidSingletons:(float)a3
{
  self->_numValidSingletons = a3;
}

- (NSMutableArray)precisionPerCluster
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrecisionPerCluster:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)recallPerPersonToGroundTruth
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecallPerPersonToGroundTruth:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)recallPerPersonExcludeMissDetection
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecallPerPersonExcludeMissDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recallPerPersonExcludeMissDetection, 0);
  objc_storeStrong((id *)&self->_recallPerPersonToGroundTruth, 0);
  objc_storeStrong((id *)&self->_precisionPerCluster, 0);
}

@end
