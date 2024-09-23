@implementation CVABackgroundRequestImplSDOF

- (float)simulatedFocalRatio
{
  return self->_simulatedFocalRatio;
}

- (void)setSimulatedFocalRatio:(float)a3
{
  self->_simulatedFocalRatio = a3;
}

- (float)sourceColorGain
{
  return self->_sourceColorGain;
}

- (void)setSourceColorGain:(float)a3
{
  self->_sourceColorGain = a3;
}

- (float)sourceColorLux
{
  return self->_sourceColorLux;
}

- (void)setSourceColorLux:(float)a3
{
  self->_sourceColorLux = a3;
}

- (NSDictionary)sbufMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSbufMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CGRect)primaryCaptureRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_primaryCaptureRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbufMetadata, 0);
}

@end
