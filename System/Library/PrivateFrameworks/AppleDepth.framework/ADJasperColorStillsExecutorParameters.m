@implementation ADJasperColorStillsExecutorParameters

- (id)initForDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorStillsExecutorParameters;
  v5 = -[ADExecutorParameters initForDevice:](&v9, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[ADJasperColorStillsPipelineParameters initForDevice:]([ADJasperColorStillsPipelineParameters alloc], "initForDevice:", v4);
    v7 = (void *)v5[7];
    v5[7] = v6;

    *((_BYTE *)v5 + 48) = 1;
  }

  return v5;
}

- (ADJasperColorStillsPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (BOOL)performJasperToColorTransformCorrection
{
  return self->_performJasperToColorTransformCorrection;
}

- (void)setPerformJasperToColorTransformCorrection:(BOOL)a3
{
  self->_performJasperToColorTransformCorrection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
