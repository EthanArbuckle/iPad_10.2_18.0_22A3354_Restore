@implementation CMISmartStyleTuning

- (id)copyWithZone:(_NSZone *)a3
{
  CMISmartStyleTuning *v4;
  CMISmartStyleTuning *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  float v14;

  v4 = -[CMISmartStyleTuning init](+[CMISmartStyleTuning allocWithZone:](CMISmartStyleTuning, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    -[CMISmartStyleTuning setApplyMaxTemporalFilterOrder:](v4, "setApplyMaxTemporalFilterOrder:", self->_applyMaxTemporalFilterOrder);
    -[CMISmartStyleTuning setLearningRate:](v5, "setLearningRate:", self->_learningRate);
    *(float *)&v6 = self->_statsUpdateDeltaTimeThreshold;
    -[CMISmartStyleTuning setStatsUpdateDeltaTimeThreshold:](v5, "setStatsUpdateDeltaTimeThreshold:", v6);
    *(float *)&v7 = self->_anstMasksMatchingTimeInSecondsThreshold;
    -[CMISmartStyleTuning setAnstMasksMatchingTimeInSecondsThreshold:](v5, "setAnstMasksMatchingTimeInSecondsThreshold:", v7);
    *(float *)&v8 = self->_coefficientsFilteringHalfWindowTime;
    -[CMISmartStyleTuning setCoefficientsFilteringHalfWindowTime:](v5, "setCoefficientsFilteringHalfWindowTime:", v8);
    *(float *)&v9 = self->_coefficientsFilteringGaussianScale;
    -[CMISmartStyleTuning setCoefficientsFilteringGaussianScale:](v5, "setCoefficientsFilteringGaussianScale:", v9);
    *(float *)&v10 = self->_coefficientsFilteringIIR1InitialHistoryFactor;
    -[CMISmartStyleTuning setCoefficientsFilteringIIR1InitialHistoryFactor:](v5, "setCoefficientsFilteringIIR1InitialHistoryFactor:", v10);
    *(float *)&v11 = self->_coefficientsFilteringIIR1MaxHistoryFactor;
    -[CMISmartStyleTuning setCoefficientsFilteringIIR1MaxHistoryFactor:](v5, "setCoefficientsFilteringIIR1MaxHistoryFactor:", v11);
    *(float *)&v12 = self->_coefficientsFilteringIIR1HistoryFactorRampUpStep;
    -[CMISmartStyleTuning setCoefficientsFilteringIIR1HistoryFactorRampUpStep:](v5, "setCoefficientsFilteringIIR1HistoryFactorRampUpStep:", v12);
    v13 = -[CMISmartStyleTuning coefficientsFilteringIIR3](v5, "coefficientsFilteringIIR3");
    v14 = self->_coefficientsFilteringIIR3.coefficients[4];
    *(_OWORD *)v13 = *(_OWORD *)self->_coefficientsFilteringIIR3.coefficients;
    *(float *)(v13 + 16) = v14;
  }
  return v5;
}

- ($DAE34F6CB135B6837C53FA9E1988B1DF)coefficientsFilteringIIR3
{
  return ($DAE34F6CB135B6837C53FA9E1988B1DF *)&self->_coefficientsFilteringIIR3;
}

- (unint64_t)applyMaxTemporalFilterOrder
{
  return self->_applyMaxTemporalFilterOrder;
}

- (void)setApplyMaxTemporalFilterOrder:(unint64_t)a3
{
  self->_applyMaxTemporalFilterOrder = a3;
}

- (unint64_t)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(unint64_t)a3
{
  self->_learningRate = a3;
}

- (float)statsUpdateDeltaTimeThreshold
{
  return self->_statsUpdateDeltaTimeThreshold;
}

- (void)setStatsUpdateDeltaTimeThreshold:(float)a3
{
  self->_statsUpdateDeltaTimeThreshold = a3;
}

- (float)anstMasksMatchingTimeInSecondsThreshold
{
  return self->_anstMasksMatchingTimeInSecondsThreshold;
}

- (void)setAnstMasksMatchingTimeInSecondsThreshold:(float)a3
{
  self->_anstMasksMatchingTimeInSecondsThreshold = a3;
}

- (float)coefficientsFilteringHalfWindowTime
{
  return self->_coefficientsFilteringHalfWindowTime;
}

- (void)setCoefficientsFilteringHalfWindowTime:(float)a3
{
  self->_coefficientsFilteringHalfWindowTime = a3;
}

- (float)coefficientsFilteringGaussianScale
{
  return self->_coefficientsFilteringGaussianScale;
}

- (void)setCoefficientsFilteringGaussianScale:(float)a3
{
  self->_coefficientsFilteringGaussianScale = a3;
}

- (float)coefficientsFilteringIIR1InitialHistoryFactor
{
  return self->_coefficientsFilteringIIR1InitialHistoryFactor;
}

- (void)setCoefficientsFilteringIIR1InitialHistoryFactor:(float)a3
{
  self->_coefficientsFilteringIIR1InitialHistoryFactor = a3;
}

- (float)coefficientsFilteringIIR1MaxHistoryFactor
{
  return self->_coefficientsFilteringIIR1MaxHistoryFactor;
}

- (void)setCoefficientsFilteringIIR1MaxHistoryFactor:(float)a3
{
  self->_coefficientsFilteringIIR1MaxHistoryFactor = a3;
}

- (float)coefficientsFilteringIIR1HistoryFactorRampUpStep
{
  return self->_coefficientsFilteringIIR1HistoryFactorRampUpStep;
}

- (void)setCoefficientsFilteringIIR1HistoryFactorRampUpStep:(float)a3
{
  self->_coefficientsFilteringIIR1HistoryFactorRampUpStep = a3;
}

- (float)srlCurrentValueWeight
{
  return self->_srlCurrentValueWeight;
}

- (void)setSrlCurrentValueWeight:(float)a3
{
  self->_srlCurrentValueWeight = a3;
}

- (NSDictionary)srlParameters
{
  return self->_srlParameters;
}

- (void)setSrlParameters:(id)a3
{
  objc_storeStrong((id *)&self->_srlParameters, a3);
}

- (int)srlSkinToneLevelFilterMaxAgeFrames
{
  return self->_srlSkinToneLevelFilterMaxAgeFrames;
}

- (void)setSrlSkinToneLevelFilterMaxAgeFrames:(int)a3
{
  self->_srlSkinToneLevelFilterMaxAgeFrames = a3;
}

- (int)srlSkinToneLevelFilterMaxFaceHistory
{
  return self->_srlSkinToneLevelFilterMaxFaceHistory;
}

- (void)setSrlSkinToneLevelFilterMaxFaceHistory:(int)a3
{
  self->_srlSkinToneLevelFilterMaxFaceHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srlParameters, 0);
}

@end
