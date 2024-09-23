@implementation ADJasperColorV2ExecutorParameters

- (id)initForDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorV2ExecutorParameters;
  v5 = -[ADExecutorParameters initForDevice:](&v9, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[ADJasperColorV2PipelineParameters initForDevice:]([ADJasperColorV2PipelineParameters alloc], "initForDevice:", v4);
    v7 = (void *)v5[6];
    v5[6] = v6;

  }
  return v5;
}

- (void)setOutputHighConfidencePixelsOnly:(BOOL)a3
{
  -[ADJasperColorV2PipelineParameters setOutputHighConfidencePixelsOnly:](self->_pipelineParameters, "setOutputHighConfidencePixelsOnly:", a3);
}

- (BOOL)outputHighConfidencePixelsOnly
{
  return -[ADJasperColorV2PipelineParameters outputHighConfidencePixelsOnly](self->_pipelineParameters, "outputHighConfidencePixelsOnly");
}

- (ADJasperColorV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
