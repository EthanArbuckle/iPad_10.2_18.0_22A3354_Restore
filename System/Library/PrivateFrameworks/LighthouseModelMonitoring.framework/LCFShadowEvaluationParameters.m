@implementation LCFShadowEvaluationParameters

- (id)init:(id)a3 featureNames:(id)a4 vectorFeatureName:(id)a5 srcLabelName:(id)a6 destLabelName:(id)a7 startDate:(id)a8 endDate:(id)a9
{
  id v16;
  id v17;
  LCFShadowEvaluationParameters *v18;
  LCFShadowEvaluationParameters *v19;
  id preprocessHandler;
  id inferenceHandler;
  id metricsHandler;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v16 = a8;
  v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)LCFShadowEvaluationParameters;
  v18 = -[LCFShadowEvaluationParameters init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelNames, a3);
    objc_storeStrong((id *)&v19->_featureNames, a4);
    objc_storeStrong((id *)&v19->_vectorFeatureName, a5);
    objc_storeStrong((id *)&v19->_srcLabelName, a6);
    objc_storeStrong((id *)&v19->_destLabelName, a7);
    objc_storeStrong((id *)&v19->_startDate, a8);
    objc_storeStrong((id *)&v19->_endDate, a9);
    preprocessHandler = v19->_preprocessHandler;
    v19->_preprocessHandler = 0;

    inferenceHandler = v19->_inferenceHandler;
    v19->_inferenceHandler = 0;

    metricsHandler = v19->_metricsHandler;
    v19->_metricsHandler = 0;

    objc_storeStrong((id *)&v19->_groundTruthLabelFeatureName, a7);
    objc_storeStrong((id *)&v19->_predictedLabelFeatureName, a7);
  }

  return v19;
}

- (id)init:(id)a3 featureNames:(id)a4 vectorFeatureName:(id)a5 srcLabelName:(id)a6 destLabelName:(id)a7 startDate:(id)a8 endDate:(id)a9 preprocessHandler:(id)a10 inferenceHandler:(id)a11 metricsHandler:(id)a12 groundTruthLabelFeatureName:(id)a13 predictedLabelFeatureName:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  LCFShadowEvaluationParameters *v25;
  LCFShadowEvaluationParameters *v26;
  uint64_t v27;
  id preprocessHandler;
  uint64_t v29;
  id inferenceHandler;
  uint64_t v31;
  id metricsHandler;
  void *v33;
  NSString *v34;
  NSString *groundTruthLabelFeatureName;
  void *v36;
  NSString *v37;
  NSString *predictedLabelFeatureName;
  id v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v49 = a3;
  v48 = a4;
  v41 = a5;
  v47 = a5;
  v46 = a6;
  v42 = a7;
  v19 = a7;
  v45 = a8;
  v44 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v50.receiver = self;
  v50.super_class = (Class)LCFShadowEvaluationParameters;
  v25 = -[LCFShadowEvaluationParameters init](&v50, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_modelNames, a3);
    objc_storeStrong((id *)&v26->_featureNames, a4);
    objc_storeStrong((id *)&v26->_vectorFeatureName, v41);
    objc_storeStrong((id *)&v26->_srcLabelName, a6);
    objc_storeStrong((id *)&v26->_destLabelName, v42);
    objc_storeStrong((id *)&v26->_startDate, a8);
    objc_storeStrong((id *)&v26->_endDate, a9);
    v27 = MEMORY[0x242684AA8](v20);
    preprocessHandler = v26->_preprocessHandler;
    v26->_preprocessHandler = (id)v27;

    v29 = MEMORY[0x242684AA8](v21);
    inferenceHandler = v26->_inferenceHandler;
    v26->_inferenceHandler = (id)v29;

    v31 = MEMORY[0x242684AA8](v22);
    metricsHandler = v26->_metricsHandler;
    v26->_metricsHandler = (id)v31;

    if (v23)
      v33 = v23;
    else
      v33 = v19;
    v34 = v33;
    groundTruthLabelFeatureName = v26->_groundTruthLabelFeatureName;
    v26->_groundTruthLabelFeatureName = v34;

    if (v24)
      v36 = v24;
    else
      v36 = v19;
    v37 = v36;
    predictedLabelFeatureName = v26->_predictedLabelFeatureName;
    v26->_predictedLabelFeatureName = v37;

  }
  return v26;
}

- (NSArray)modelNames
{
  return self->_modelNames;
}

- (NSArray)featureNames
{
  return self->_featureNames;
}

- (NSString)srcLabelName
{
  return self->_srcLabelName;
}

- (NSString)destLabelName
{
  return self->_destLabelName;
}

- (NSString)vectorFeatureName
{
  return self->_vectorFeatureName;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (id)preprocessHandler
{
  return self->_preprocessHandler;
}

- (id)inferenceHandler
{
  return self->_inferenceHandler;
}

- (id)metricsHandler
{
  return self->_metricsHandler;
}

- (NSString)groundTruthLabelFeatureName
{
  return self->_groundTruthLabelFeatureName;
}

- (NSString)predictedLabelFeatureName
{
  return self->_predictedLabelFeatureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedLabelFeatureName, 0);
  objc_storeStrong((id *)&self->_groundTruthLabelFeatureName, 0);
  objc_storeStrong(&self->_metricsHandler, 0);
  objc_storeStrong(&self->_inferenceHandler, 0);
  objc_storeStrong(&self->_preprocessHandler, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_vectorFeatureName, 0);
  objc_storeStrong((id *)&self->_destLabelName, 0);
  objc_storeStrong((id *)&self->_srcLabelName, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_modelNames, 0);
}

@end
