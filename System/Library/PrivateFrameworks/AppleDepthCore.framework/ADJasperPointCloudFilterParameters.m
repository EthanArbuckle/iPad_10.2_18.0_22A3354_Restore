@implementation ADJasperPointCloudFilterParameters

- (void)setEchoMode:(unint64_t)a3
{
  self->_echoMode = a3;
}

- (void)setMinDistance:(float)a3
{
  self->_minDistance = a3;
}

- (void)setMaxDistance:(float)a3
{
  self->_maxDistance = a3;
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (ADJasperPointCloudFilterParameters)init
{
  ADJasperPointCloudFilterParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADJasperPointCloudFilterParameters;
  result = -[ADJasperPointCloudFilterParameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_confidenceThreshold = xmmword_2363DF670;
    result->_shortRangeConfidenceThreshold = 0.75;
    *(_OWORD *)&result->_echoMode = xmmword_2363DF680;
    result->_duplicateProjectedSpotsMode = 0;
  }
  return result;
}

- (unint64_t)echoMode
{
  return self->_echoMode;
}

- (unint64_t)bankIDMask
{
  return self->_bankIDMask;
}

- (void)setBankIDMask:(unint64_t)a3
{
  self->_bankIDMask = a3;
}

- (float)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (float)minDistance
{
  return self->_minDistance;
}

- (float)maxDistance
{
  return self->_maxDistance;
}

- (float)shortRangeDepthThreshold
{
  return self->_shortRangeDepthThreshold;
}

- (void)setShortRangeDepthThreshold:(float)a3
{
  self->_shortRangeDepthThreshold = a3;
}

- (float)shortRangeConfidenceThreshold
{
  return self->_shortRangeConfidenceThreshold;
}

- (void)setShortRangeConfidenceThreshold:(float)a3
{
  self->_shortRangeConfidenceThreshold = a3;
}

- (unint64_t)duplicateProjectedSpotsMode
{
  return self->_duplicateProjectedSpotsMode;
}

- (void)setDuplicateProjectedSpotsMode:(unint64_t)a3
{
  self->_duplicateProjectedSpotsMode = a3;
}

+ (id)emptyFilter
{
  void *v2;
  double v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setEchoMode:", 3);
  objc_msgSend(v2, "setConfidenceThreshold:", 0.0);
  objc_msgSend(v2, "setMinDistance:", 0.0);
  LODWORD(v3) = 2139095039;
  objc_msgSend(v2, "setMaxDistance:", v3);
  objc_msgSend(v2, "setShortRangeDepthThreshold:", 0.0);
  objc_msgSend(v2, "setShortRangeConfidenceThreshold:", 0.0);
  objc_msgSend(v2, "setBankIDMask:", 0xFFFFFFFFLL);
  objc_msgSend(v2, "setDuplicateProjectedSpotsMode:", 0);
  return v2;
}

@end
