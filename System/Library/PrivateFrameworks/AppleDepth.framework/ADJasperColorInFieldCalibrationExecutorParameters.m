@implementation ADJasperColorInFieldCalibrationExecutorParameters

- (ADJasperColorInFieldCalibrationExecutorParameters)init
{
  ADJasperColorInFieldCalibrationExecutorParameters *v2;
  ADJasperColorInFieldCalibrationPipelineParameters *v3;
  ADJasperColorInFieldCalibrationPipelineParameters *pipelineParameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADJasperColorInFieldCalibrationExecutorParameters;
  v2 = -[ADExecutorParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ADJasperColorInFieldCalibrationPipelineParameters);
    pipelineParameters = v2->_pipelineParameters;
    v2->_pipelineParameters = v3;

  }
  return v2;
}

- (ADJasperColorInFieldCalibrationExecutorParameters)initWithPipelineParameters:(id)a3
{
  id v5;
  ADJasperColorInFieldCalibrationExecutorParameters *v6;
  ADJasperColorInFieldCalibrationExecutorParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorInFieldCalibrationExecutorParameters;
  v6 = -[ADExecutorParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineParameters, a3);
  v7->_reportTelemetry = 1;

  return v7;
}

- (id)initForDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorInFieldCalibrationExecutorParameters;
  v5 = -[ADExecutorParameters initForDevice:](&v9, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[ADJasperColorInFieldCalibrationPipelineParameters initForDevice:]([ADJasperColorInFieldCalibrationPipelineParameters alloc], "initForDevice:", v4);
    v7 = (void *)v5[7];
    v5[7] = v6;

    *((_BYTE *)v5 + 48) = 1;
  }

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

- (ADJasperColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
