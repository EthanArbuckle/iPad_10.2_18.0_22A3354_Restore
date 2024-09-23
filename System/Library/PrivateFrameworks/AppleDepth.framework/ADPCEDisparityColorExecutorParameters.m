@implementation ADPCEDisparityColorExecutorParameters

- (id)initForPipelineParameters:(id)a3 inputSource:(unint64_t)a4
{
  id v7;
  ADPCEDisparityColorExecutorParameters *v8;
  ADPCEDisparityColorExecutorParameters *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADPCEDisparityColorExecutorParameters;
  v8 = -[ADExecutorParameters init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pipelineParameters, a3);
    v9->_temporalConsistencyActive = 1;
    v9->_disparityPreprocessingActive = 1;
    v9->_disparityPostprocessingActive = 1;
    v9->_disparityRotation = a4 == 2;
    v9->_disparityInvalidValue = 0x1FFF;
  }

  return v9;
}

- (id)initForInputSource:(unint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_opt_new();
  v6 = -[ADPCEDisparityColorExecutorParameters initForPipelineParameters:inputSource:](self, "initForPipelineParameters:inputSource:", v5, a3);

  return v6;
}

- (ADPCEDisparityColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (BOOL)temporalConsistencyActive
{
  return self->_temporalConsistencyActive;
}

- (void)setTemporalConsistencyActive:(BOOL)a3
{
  self->_temporalConsistencyActive = a3;
}

- (BOOL)disparityPreprocessingActive
{
  return self->_disparityPreprocessingActive;
}

- (void)setDisparityPreprocessingActive:(BOOL)a3
{
  self->_disparityPreprocessingActive = a3;
}

- (BOOL)disparityPostprocessingActive
{
  return self->_disparityPostprocessingActive;
}

- (void)setDisparityPostprocessingActive:(BOOL)a3
{
  self->_disparityPostprocessingActive = a3;
}

- (int64_t)disparityRotation
{
  return self->_disparityRotation;
}

- (void)setDisparityRotation:(int64_t)a3
{
  self->_disparityRotation = a3;
}

- (unsigned)disparityInvalidValue
{
  return self->_disparityInvalidValue;
}

- (void)setDisparityInvalidValue:(unsigned __int16)a3
{
  self->_disparityInvalidValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
