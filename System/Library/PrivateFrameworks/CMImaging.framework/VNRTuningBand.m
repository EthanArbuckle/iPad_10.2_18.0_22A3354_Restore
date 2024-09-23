@implementation VNRTuningBand

- (VNRTuningBand)initWithTuningParamsDict:(id)a3
{
  id v4;
  VNRTuningBand *v5;
  VNRGainValueArray *v6;
  void *v7;
  uint64_t v8;
  VNRGainValueArray *deghostPatchSigmaScalingGVA;
  VNRGainValueArray *v10;
  void *v11;
  uint64_t v12;
  VNRGainValueArray *deghostBoostFactorScalingGVA;
  VNRGainValueArray *v14;
  void *v15;
  uint64_t v16;
  VNRGainValueArray *fusionStrengthScalingGVA;
  VNRTuningBand *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNRTuningBand;
  v5 = -[VNRTuningBand init](&v20, sel_init);
  if (!v5)
    goto LABEL_7;
  v6 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeghostPatchSigmaScaling"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VNRGainValueArray initWithArray:](v6, "initWithArray:", v7);
  deghostPatchSigmaScalingGVA = v5->_deghostPatchSigmaScalingGVA;
  v5->_deghostPatchSigmaScalingGVA = (VNRGainValueArray *)v8;

  if (!v5->_deghostPatchSigmaScalingGVA)
    goto LABEL_7;
  v10 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeghostBoostFactorScaling"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VNRGainValueArray initWithArray:](v10, "initWithArray:", v11);
  deghostBoostFactorScalingGVA = v5->_deghostBoostFactorScalingGVA;
  v5->_deghostBoostFactorScalingGVA = (VNRGainValueArray *)v12;

  if (!v5->_deghostBoostFactorScalingGVA)
    goto LABEL_7;
  v14 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FusionStrengthScaling"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VNRGainValueArray initWithArray:](v14, "initWithArray:", v15);
  fusionStrengthScalingGVA = v5->_fusionStrengthScalingGVA;
  v5->_fusionStrengthScalingGVA = (VNRGainValueArray *)v16;

  if (v5->_fusionStrengthScalingGVA)
    v18 = v5;
  else
LABEL_7:
    v18 = 0;

  return v18;
}

- (int)updateWithGain:(float)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;

  -[VNRGainValueArray interpolateValueForGain:](self->_deghostPatchSigmaScalingGVA, "interpolateValueForGain:");
  self->_deghostPatchSigmaScaling = v5;
  *(float *)&v6 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_deghostBoostFactorScalingGVA, "interpolateValueForGain:", v6);
  self->_deghostBoostFactorScaling = v7;
  *(float *)&v8 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_fusionStrengthScalingGVA, "interpolateValueForGain:", v8);
  self->_fusionStrengthScaling = v9;
  return 0;
}

- (float)deghostPatchSigmaScaling
{
  if (a1)
    return *(float *)(a1 + 32);
  else
    return 0.0;
}

- (float)deghostBoostFactorScaling
{
  if (a1)
    return *(float *)(a1 + 36);
  else
    return 0.0;
}

- (float)fusionStrengthScaling
{
  if (a1)
    return *(float *)(a1 + 40);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionStrengthScalingGVA, 0);
  objc_storeStrong((id *)&self->_deghostBoostFactorScalingGVA, 0);
  objc_storeStrong((id *)&self->_deghostPatchSigmaScalingGVA, 0);
}

@end
