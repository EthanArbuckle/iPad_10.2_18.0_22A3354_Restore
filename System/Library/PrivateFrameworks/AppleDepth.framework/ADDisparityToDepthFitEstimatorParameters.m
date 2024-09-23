@implementation ADDisparityToDepthFitEstimatorParameters

- (ADDisparityToDepthFitEstimatorParameters)init
{
  ADDisparityToDepthFitEstimatorParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADDisparityToDepthFitEstimatorParameters;
  result = -[ADDisparityToDepthFitEstimatorParameters init](&v3, sel_init);
  if (result)
  {
    result->_iterations = 100;
    *(_OWORD *)&result->_threshold = xmmword_20B6D29C0;
    result->_constantSlope = 1;
    *(_QWORD *)&result->_minDepth = 0x40E000003F000000;
    *(_WORD *)&result->_smoothing = 0;
    result->_smoothingWeight = 0.7;
    *(_QWORD *)&result->_seed = 0x3DCCCCCD0000002ALL;
    result->_retainedWorldPointsCapacity = 900;
  }
  return result;
}

- (unsigned)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unsigned int)a3
{
  self->_iterations = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (double)minInlinersRatio
{
  return self->_minInlinersRatio;
}

- (void)setMinInlinersRatio:(double)a3
{
  self->_minInlinersRatio = a3;
}

- (BOOL)constantSlope
{
  return self->_constantSlope;
}

- (void)setConstantSlope:(BOOL)a3
{
  self->_constantSlope = a3;
}

- (float)minDepth
{
  return self->_minDepth;
}

- (void)setMinDepth:(float)a3
{
  self->_minDepth = a3;
}

- (float)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(float)a3
{
  self->_maxDepth = a3;
}

- (BOOL)smoothing
{
  return self->_smoothing;
}

- (void)setSmoothing:(BOOL)a3
{
  self->_smoothing = a3;
}

- (float)smoothingWeight
{
  return self->_smoothingWeight;
}

- (void)setSmoothingWeight:(float)a3
{
  self->_smoothingWeight = a3;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)setSeed:(unsigned int)a3
{
  self->_seed = a3;
}

- (BOOL)errorCalculationOnDisparity
{
  return self->_errorCalculationOnDisparity;
}

- (void)setErrorCalculationOnDisparity:(BOOL)a3
{
  self->_errorCalculationOnDisparity = a3;
}

- (unint64_t)retainedWorldPointsCapacity
{
  return self->_retainedWorldPointsCapacity;
}

- (void)setRetainedWorldPointsCapacity:(unint64_t)a3
{
  self->_retainedWorldPointsCapacity = a3;
}

- (float)retainedWorldPointsConfidenceThreshold
{
  return self->_retainedWorldPointsConfidenceThreshold;
}

- (void)setRetainedWorldPointsConfidenceThreshold:(float)a3
{
  self->_retainedWorldPointsConfidenceThreshold = a3;
}

@end
