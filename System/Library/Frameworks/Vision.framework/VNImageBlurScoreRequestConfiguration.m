@implementation VNImageBlurScoreRequestConfiguration

- (VNImageBlurScoreRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNImageBlurScoreRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNImageBlurScoreRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_maximumIntermediateSideLength = 1024;
    result->_blurDeterminationMethod = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageBlurScoreRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setMaximumIntermediateSideLength:", self->_maximumIntermediateSideLength);
    objc_msgSend(v5, "setBlurDeterminationMethod:", self->_blurDeterminationMethod);
  }
  return v5;
}

- (unint64_t)maximumIntermediateSideLength
{
  return self->_maximumIntermediateSideLength;
}

- (void)setMaximumIntermediateSideLength:(unint64_t)a3
{
  self->_maximumIntermediateSideLength = a3;
}

- (unint64_t)blurDeterminationMethod
{
  return self->_blurDeterminationMethod;
}

- (void)setBlurDeterminationMethod:(unint64_t)a3
{
  self->_blurDeterminationMethod = a3;
}

@end
