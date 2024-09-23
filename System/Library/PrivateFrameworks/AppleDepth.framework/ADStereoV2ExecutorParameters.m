@implementation ADStereoV2ExecutorParameters

- (id)initForDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADStereoV2ExecutorParameters;
  v5 = -[ADExecutorParameters initForDevice:](&v9, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[ADPipelineParameters initForDevice:]([ADStereoV2PipelineParameters alloc], "initForDevice:", v4);
    v7 = (void *)v5[8];
    v5[8] = v6;

    *((_BYTE *)v5 + 48) = 1;
    *((_DWORD *)v5 + 13) = 1058642330;
    *((_DWORD *)v5 + 14) = 0;
  }

  return v5;
}

- (ADStereoV2PipelineParameters)pipelineParameters
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

- (float)temporalSmoothingCurrentFeaturesRatioMin
{
  return self->_temporalSmoothingCurrentFeaturesRatioMin;
}

- (void)setTemporalSmoothingCurrentFeaturesRatioMin:(float)a3
{
  self->_temporalSmoothingCurrentFeaturesRatioMin = a3;
}

- (float)temporalSmoothingPreviousFeaturesRatioMin
{
  return self->_temporalSmoothingPreviousFeaturesRatioMin;
}

- (void)setTemporalSmoothingPreviousFeaturesRatioMin:(float)a3
{
  self->_temporalSmoothingPreviousFeaturesRatioMin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
