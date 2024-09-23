@implementation MLCNormalizationGPUDeviceOps

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:", v7, v6);

  return v8;
}

- (MLCNormalizationGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  MLCNormalizationGPUDeviceOps *v4;
  MLCNormalizationGPUDeviceOps *v5;
  id normalizationGammaGradient;
  id normalizationBetaGradient;
  id normalizationInputNormalized;
  id normalizationInverseSqrtVariance;
  id normalizationComputedMean;
  id normalizationComputedVariance;
  id batchNormMeanKernel;
  id batchNormVarianceKernel;
  id batchNormBetaGammaDeltaKernel;
  id normalizationSumBetaGammaDeltaKernel;
  id instanceNormMovingMeanVarianceKernel;
  id normalizationRecomputeResultKernel;
  id normalizationMultiGPUChildOps;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MLCNormalizationGPUDeviceOps;
  v4 = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v20, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, a3, a4, 0, 0, 0);
  v5 = v4;
  if (v4)
  {
    normalizationGammaGradient = v4->_normalizationGammaGradient;
    v4->_normalizationGammaGradient = 0;

    normalizationBetaGradient = v5->_normalizationBetaGradient;
    v5->_normalizationBetaGradient = 0;

    normalizationInputNormalized = v5->_normalizationInputNormalized;
    v5->_normalizationInputNormalized = 0;

    normalizationInverseSqrtVariance = v5->_normalizationInverseSqrtVariance;
    v5->_normalizationInverseSqrtVariance = 0;

    normalizationComputedMean = v5->_normalizationComputedMean;
    v5->_normalizationComputedMean = 0;

    normalizationComputedVariance = v5->_normalizationComputedVariance;
    v5->_normalizationComputedVariance = 0;

    batchNormMeanKernel = v5->_batchNormMeanKernel;
    v5->_batchNormMeanKernel = 0;

    batchNormVarianceKernel = v5->_batchNormVarianceKernel;
    v5->_batchNormVarianceKernel = 0;

    batchNormBetaGammaDeltaKernel = v5->_batchNormBetaGammaDeltaKernel;
    v5->_batchNormBetaGammaDeltaKernel = 0;

    normalizationSumBetaGammaDeltaKernel = v5->_normalizationSumBetaGammaDeltaKernel;
    v5->_normalizationSumBetaGammaDeltaKernel = 0;

    instanceNormMovingMeanVarianceKernel = v5->_instanceNormMovingMeanVarianceKernel;
    v5->_instanceNormMovingMeanVarianceKernel = 0;

    normalizationRecomputeResultKernel = v5->_normalizationRecomputeResultKernel;
    v5->_normalizationRecomputeResultKernel = 0;

    v5->_varianceEpsilon = 0.0;
    v5->_groupCount = 1;
    normalizationMultiGPUChildOps = v5->_normalizationMultiGPUChildOps;
    v5->_normalizationMultiGPUChildOps = 0;

    v5->_isFusedWithArithmeticLayer = 0;
  }
  return v5;
}

- (NSArray)normalizedShape
{
  return self->_normalizedShape;
}

- (void)setNormalizedShape:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedShape, a3);
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (void)setVarianceEpsilon:(float)a3
{
  self->_varianceEpsilon = a3;
}

- (float)momentum
{
  return self->_momentum;
}

- (void)setMomentum:(float)a3
{
  self->_momentum = a3;
}

- (unint64_t)groupCount
{
  return self->_groupCount;
}

- (void)setGroupCount:(unint64_t)a3
{
  self->_groupCount = a3;
}

- (id)normalizationGammaGradient
{
  return self->_normalizationGammaGradient;
}

- (void)setNormalizationGammaGradient:(id)a3
{
  objc_storeStrong(&self->_normalizationGammaGradient, a3);
}

- (id)normalizationBetaGradient
{
  return self->_normalizationBetaGradient;
}

- (void)setNormalizationBetaGradient:(id)a3
{
  objc_storeStrong(&self->_normalizationBetaGradient, a3);
}

- (id)normalizationInverseSqrtVariance
{
  return self->_normalizationInverseSqrtVariance;
}

- (void)setNormalizationInverseSqrtVariance:(id)a3
{
  objc_storeStrong(&self->_normalizationInverseSqrtVariance, a3);
}

- (id)normalizationInputNormalized
{
  return self->_normalizationInputNormalized;
}

- (void)setNormalizationInputNormalized:(id)a3
{
  objc_storeStrong(&self->_normalizationInputNormalized, a3);
}

- (id)normalizationComputedMean
{
  return self->_normalizationComputedMean;
}

- (void)setNormalizationComputedMean:(id)a3
{
  objc_storeStrong(&self->_normalizationComputedMean, a3);
}

- (id)normalizationComputedVariance
{
  return self->_normalizationComputedVariance;
}

- (void)setNormalizationComputedVariance:(id)a3
{
  objc_storeStrong(&self->_normalizationComputedVariance, a3);
}

- (id)batchNormMeanKernel
{
  return self->_batchNormMeanKernel;
}

- (void)setBatchNormMeanKernel:(id)a3
{
  objc_storeStrong(&self->_batchNormMeanKernel, a3);
}

- (id)batchNormVarianceKernel
{
  return self->_batchNormVarianceKernel;
}

- (void)setBatchNormVarianceKernel:(id)a3
{
  objc_storeStrong(&self->_batchNormVarianceKernel, a3);
}

- (id)batchNormBetaGammaDeltaKernel
{
  return self->_batchNormBetaGammaDeltaKernel;
}

- (void)setBatchNormBetaGammaDeltaKernel:(id)a3
{
  objc_storeStrong(&self->_batchNormBetaGammaDeltaKernel, a3);
}

- (id)instanceNormMovingMeanVarianceKernel
{
  return self->_instanceNormMovingMeanVarianceKernel;
}

- (void)setInstanceNormMovingMeanVarianceKernel:(id)a3
{
  objc_storeStrong(&self->_instanceNormMovingMeanVarianceKernel, a3);
}

- (id)normalizationRecomputeResultKernel
{
  return self->_normalizationRecomputeResultKernel;
}

- (void)setNormalizationRecomputeResultKernel:(id)a3
{
  objc_storeStrong(&self->_normalizationRecomputeResultKernel, a3);
}

- (id)normalizationSumBetaGammaDeltaKernel
{
  return self->_normalizationSumBetaGammaDeltaKernel;
}

- (void)setNormalizationSumBetaGammaDeltaKernel:(id)a3
{
  objc_storeStrong(&self->_normalizationSumBetaGammaDeltaKernel, a3);
}

- (id)normalizationMultiGPUChildOps
{
  return self->_normalizationMultiGPUChildOps;
}

- (void)setNormalizationMultiGPUChildOps:(id)a3
{
  objc_storeStrong(&self->_normalizationMultiGPUChildOps, a3);
}

- (BOOL)isFusedWithArithmeticLayer
{
  return self->_isFusedWithArithmeticLayer;
}

- (void)setIsFusedWithArithmeticLayer:(BOOL)a3
{
  self->_isFusedWithArithmeticLayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_normalizationMultiGPUChildOps, 0);
  objc_storeStrong(&self->_normalizationSumBetaGammaDeltaKernel, 0);
  objc_storeStrong(&self->_normalizationRecomputeResultKernel, 0);
  objc_storeStrong(&self->_instanceNormMovingMeanVarianceKernel, 0);
  objc_storeStrong(&self->_batchNormBetaGammaDeltaKernel, 0);
  objc_storeStrong(&self->_batchNormVarianceKernel, 0);
  objc_storeStrong(&self->_batchNormMeanKernel, 0);
  objc_storeStrong(&self->_normalizationComputedVariance, 0);
  objc_storeStrong(&self->_normalizationComputedMean, 0);
  objc_storeStrong(&self->_normalizationInputNormalized, 0);
  objc_storeStrong(&self->_normalizationInverseSqrtVariance, 0);
  objc_storeStrong(&self->_normalizationBetaGradient, 0);
  objc_storeStrong(&self->_normalizationGammaGradient, 0);
  objc_storeStrong((id *)&self->_normalizedShape, 0);
}

@end
