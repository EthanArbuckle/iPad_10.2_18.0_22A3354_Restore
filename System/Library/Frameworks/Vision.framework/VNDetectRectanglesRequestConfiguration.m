@implementation VNDetectRectanglesRequestConfiguration

- (VNDetectRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectRectanglesRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNDetectRectanglesRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_requiredVersion = 2;
    result->_minimumAspectRatio = 0.5;
    result->_maximumAspectRatio = 1.0;
    result->_quadratureTolerance = 30.0;
    result->_minimumSize = 0.2;
    result->_minimumConfidence = 0.0;
    result->_maximumObservations = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNDetectRectanglesRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRequiredVersion:", self->_requiredVersion);
    *(float *)&v6 = self->_minimumAspectRatio;
    objc_msgSend(v5, "setMinimumAspectRatio:", v6);
    *(float *)&v7 = self->_maximumAspectRatio;
    objc_msgSend(v5, "setMaximumAspectRatio:", v7);
    *(float *)&v8 = self->_quadratureTolerance;
    objc_msgSend(v5, "setQuadratureTolerance:", v8);
    *(float *)&v9 = self->_minimumSize;
    objc_msgSend(v5, "setMinimumSize:", v9);
    *(float *)&v10 = self->_minimumConfidence;
    objc_msgSend(v5, "setMinimumConfidence:", v10);
    objc_msgSend(v5, "setMaximumObservations:", self->_maximumObservations);
  }
  return v5;
}

- (unint64_t)requiredVersion
{
  return self->_requiredVersion;
}

- (void)setRequiredVersion:(unint64_t)a3
{
  self->_requiredVersion = a3;
}

- (float)minimumAspectRatio
{
  return self->_minimumAspectRatio;
}

- (void)setMinimumAspectRatio:(float)a3
{
  self->_minimumAspectRatio = a3;
}

- (float)maximumAspectRatio
{
  return self->_maximumAspectRatio;
}

- (void)setMaximumAspectRatio:(float)a3
{
  self->_maximumAspectRatio = a3;
}

- (float)quadratureTolerance
{
  return self->_quadratureTolerance;
}

- (void)setQuadratureTolerance:(float)a3
{
  self->_quadratureTolerance = a3;
}

- (float)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(float)a3
{
  self->_minimumSize = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (unint64_t)maximumObservations
{
  return self->_maximumObservations;
}

- (void)setMaximumObservations:(unint64_t)a3
{
  self->_maximumObservations = a3;
}

@end
