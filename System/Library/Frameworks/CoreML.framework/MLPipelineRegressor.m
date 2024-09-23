@implementation MLPipelineRegressor

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  void *v11;
  void *v12;
  id v14[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v14, v10, 3, -[MLPipelineRegressor signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  -[MLPipeline predictionFromFeatures:options:error:](self->_engine, "predictionFromFeatures:options:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLRegressor regressorResultFromOutputFeatures:error:](self, "regressorResultFromOutputFeatures:error:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v14);
  return v12;
}

- (unint64_t)signpostID
{
  void *v2;
  unint64_t v3;

  -[MLPipelineRegressor engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "signpostID");

  return v3;
}

- (MLPipeline)engine
{
  return (MLPipeline *)objc_getProperty(self, a2, 80, 1);
}

- (MLPipeline)pipeline
{
  return self->_engine;
}

- (MLPipelineRegressor)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  MLPipelineRegressor *v14;
  MLPipelineRegressor *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLPipelineRegressor;
  v14 = -[MLRegressor initWithDescription:configuration:error:](&v17, sel_initWithDescription_configuration_error_, v12, v13, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engine, a3);
    -[MLModel setSignpostID:](v15, "setSignpostID:", objc_msgSend(v11, "signpostID"));
  }

  return v15;
}

- (id)executionSchedule
{
  void *v2;
  void *v3;

  -[MLPipelineRegressor engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionSchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
