@implementation ADPearlColorInFieldCalibrationExecutorParameters

- (ADPearlColorInFieldCalibrationExecutorParameters)init
{
  ADPearlColorInFieldCalibrationExecutorParameters *v2;
  ADPearlColorInFieldCalibrationPipelineParameters *v3;
  ADPearlColorInFieldCalibrationPipelineParameters *pipelineParameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADPearlColorInFieldCalibrationExecutorParameters;
  v2 = -[ADExecutorParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ADPearlColorInFieldCalibrationPipelineParameters);
    pipelineParameters = v2->_pipelineParameters;
    v2->_pipelineParameters = v3;

  }
  return v2;
}

- (ADPearlColorInFieldCalibrationExecutorParameters)initWithPipelineParameters:(id)a3
{
  id v5;
  ADPearlColorInFieldCalibrationExecutorParameters *v6;
  ADPearlColorInFieldCalibrationExecutorParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADPearlColorInFieldCalibrationExecutorParameters;
  v6 = -[ADExecutorParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineParameters, a3);
  v7->_reportTelemetry = 1;

  return v7;
}

- (id)initForPipeline:(id)a3
{
  id v4;
  ADPearlColorInFieldCalibrationExecutorParameters *v5;
  uint64_t v6;
  ADPearlColorInFieldCalibrationPipelineParameters *pipelineParameters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADPearlColorInFieldCalibrationExecutorParameters;
  v5 = -[ADExecutorParameters init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pipelineParameters");
    v6 = objc_claimAutoreleasedReturnValue();
    pipelineParameters = v5->_pipelineParameters;
    v5->_pipelineParameters = (ADPearlColorInFieldCalibrationPipelineParameters *)v6;

  }
  v5->_reportTelemetry = 1;

  return v5;
}

- (BOOL)reportTelemetry
{
  return self->_reportTelemetry;
}

- (void)setReportTelemetry:(BOOL)a3
{
  self->_reportTelemetry = a3;
}

- (ADPearlColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
