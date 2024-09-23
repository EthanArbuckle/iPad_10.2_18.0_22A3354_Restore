@implementation ATXCandidateRelevanceLogisticRegressionModelTrainingPlan

- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)init
{
  void *v3;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan initWithParameters:](self, "initWithParameters:", v3);

  return v4;
}

- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  Class v20;
  id v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v44;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionIntercept"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 1;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionLearningRate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    v11 = v10;
  }
  else
  {
    v11 = 1017370378;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionMinIterations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = (int)objc_msgSend(v12, "intValue");
  else
    v14 = 100;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionStoppingThreshold"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "floatValue");
    v18 = v17;
  }
  else
  {
    v18 = 953267991;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionRegularizationStrategy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = NSClassFromString(CFSTR("NSString"));
  v21 = v19;
  if (v20)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  v24 = CFSTR("ElasticNet");
  if (v23)
    v24 = v23;
  v25 = v24;

  v26 = objc_msgSend((id)objc_opt_class(), "regularizationStrategyForString:", v25);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionRegularizationRate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "floatValue");
    v30 = v29;
  }
  else
  {
    v30 = 4.0;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionRegularizationL1Ratio"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "floatValue");
    v34 = v33;
  }
  else
  {
    v34 = 1053609165;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LogisticRegressionWeightTruncationThreshold"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "floatValue");
    v38 = v37;
  }
  else
  {
    v38 = 981668463;
  }

  LODWORD(v39) = v11;
  LODWORD(v40) = v18;
  *(float *)&v41 = v30;
  LODWORD(v42) = v34;
  LODWORD(v43) = v38;
  v44 = -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan initWithIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:regularizationL1Ratio:weightTruncationThreshold:](self, "initWithIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:regularizationL1Ratio:weightTruncationThreshold:", v7, v14, v26, v39, v40, v41, v42, v43);

  return v44;
}

- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)initWithIntercept:(BOOL)a3 learningRate:(float)a4 minIterations:(unint64_t)a5 stoppingThreshold:(float)a6 regularizationStrategy:(unint64_t)a7 regularizationRate:(float)a8 regularizationL1Ratio:(float)a9 weightTruncationThreshold:(float)a10
{
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ATXCandidateRelevanceLogisticRegressionModelTrainingPlan;
  result = -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan init](&v19, sel_init);
  if (result)
  {
    result->_intercept = a3;
    result->_learningRate = a4;
    result->_stoppingThreshold = a6;
    result->_minIterations = a5;
    result->_regularizationStrategy = a7;
    result->_regularizationRate = a8;
    result->_regularizationL1Ratio = a9;
    result->_weightTruncationThreshold = a10;
  }
  return result;
}

+ (unint64_t)regularizationStrategyForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("L1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("L2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ElasticNet")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringForPMLRegularizationStrategy:(unint64_t)a3
{
  if (a3 < 4)
    return off_1E82E4D20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)trainModelForDataPoints:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ATXCandidateRelevanceLogisticRegressionModel *v22;
  void *v23;
  ATXCandidateRelevanceLogisticRegressionModel *v24;

  v7 = (void *)MEMORY[0x1E0D81040];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "zeroWeightsOfLength:", self->_intercept + objc_msgSend(v8, "numberOfInputDimensions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = self->_learningRate;
  *(float *)&v12 = self->_stoppingThreshold;
  *(float *)&v13 = self->_regularizationRate;
  *(float *)&v14 = self->_regularizationL1Ratio;
  objc_msgSend(MEMORY[0x1E0D81030], "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:l1Ratio:", v10, self->_intercept, self->_minIterations, self->_regularizationStrategy, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sparseFeatureMatrixFromDataPoints:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCovariates:", v16);
  v17 = (void *)objc_opt_class();

  objc_msgSend(v17, "denseLabelVectorFromDataPoints:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81038], "modelRegressorFromFloats:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObjective:", v19);
  objc_msgSend(v15, "solve");
  objc_msgSend(v15, "weights");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan truncatedWeightsForWeights:](self, "truncatedWeightsForWeights:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [ATXCandidateRelevanceLogisticRegressionModel alloc];
  objc_msgSend(MEMORY[0x1E0D81030], "withWeights:andIntercept:", v21, self->_intercept);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ATXCandidateRelevanceLogisticRegressionModel initWithModel:](v22, "initWithModel:", v23);

  return v24;
}

- (id)truncatedWeightsForWeights:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, double);
  void *v14;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (self->_weightTruncationThreshold == 0.0)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "asMutableDenseVector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __87__ATXCandidateRelevanceLogisticRegressionModelTrainingPlan_truncatedWeightsForWeights___block_invoke;
    v14 = &unk_1E82E4D00;
    v15 = self;
    v16 = v8;
    v9 = v8;
    objc_msgSend(v7, "enumerateValuesWithBlock:", &v11);
    objc_msgSend(MEMORY[0x1E0D81040], "modelWeightsFromFloats:", v9, v11, v12, v13, v14, v15);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __87__ATXCandidateRelevanceLogisticRegressionModelTrainingPlan_truncatedWeightsForWeights___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (fabsf(*(float *)&a2) < *(float *)(v3 + 28))
    *(float *)&a2 = 0.0;
  return objc_msgSend(v2, "append:", a2);
}

- (BOOL)isEqual:(id)a3
{
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v4;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v5;
  BOOL v6;

  v4 = (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan isEqualToATXCandidateRelevanceLogisticRegressionModelTrainingPlan:](self, "isEqualToATXCandidateRelevanceLogisticRegressionModelTrainingPlan:", v5);

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceLogisticRegressionModelTrainingPlan:(id)a3
{
  float *v4;
  BOOL v5;

  v4 = (float *)a3;
  v5 = self->_intercept == *((unsigned __int8 *)v4 + 8)
    && self->_learningRate == v4[3]
    && self->_minIterations == *((_QWORD *)v4 + 4)
    && self->_stoppingThreshold == v4[4]
    && self->_regularizationRate == v4[5]
    && self->_regularizationStrategy == *((_QWORD *)v4 + 5)
    && self->_regularizationL1Ratio == v4[6]
    && self->_weightTruncationThreshold == v4[7];

  return v5;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (float)learningRate
{
  return self->_learningRate;
}

- (unint64_t)minIterations
{
  return self->_minIterations;
}

- (float)stoppingThreshold
{
  return self->_stoppingThreshold;
}

- (unint64_t)regularizationStrategy
{
  return self->_regularizationStrategy;
}

- (float)regularizationRate
{
  return self->_regularizationRate;
}

- (float)regularizationL1Ratio
{
  return self->_regularizationL1Ratio;
}

- (float)weightTruncationThreshold
{
  return self->_weightTruncationThreshold;
}

@end
