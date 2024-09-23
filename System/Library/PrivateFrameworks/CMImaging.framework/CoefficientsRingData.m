@implementation CoefficientsRingData

- (void)releaseResources
{
  id v3;

  -[CoefficientsRingData coefficients](self, "coefficients");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  FigMetalDecRef(&v3);
  -[CoefficientsRingData setCoefficientsPixelBuffer:](self, "setCoefficientsPixelBuffer:", 0);

}

- (MTLBuffer)coefficients
{
  return self->_coefficients;
}

- (void)setCoefficients:(id)a3
{
  objc_storeStrong((id *)&self->_coefficients, a3);
}

- (id)coefficientsPixelBuffer
{
  return self->_coefficientsPixelBuffer;
}

- (void)setCoefficientsPixelBuffer:(id)a3
{
  objc_storeStrong(&self->_coefficientsPixelBuffer, a3);
}

- (double)pts
{
  return self->_pts;
}

- (void)setPts:(double)a3
{
  self->_pts = a3;
}

- (unint64_t)frameID
{
  return self->_frameID;
}

- (void)setFrameID:(unint64_t)a3
{
  self->_frameID = a3;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (CGRect)learnedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_learnedRect.origin.x;
  y = self->_learnedRect.origin.y;
  width = self->_learnedRect.size.width;
  height = self->_learnedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLearnedRect:(CGRect)a3
{
  self->_learnedRect = a3;
}

- (double)globalRemixFactor
{
  return self->_globalRemixFactor;
}

- (void)setGlobalRemixFactor:(double)a3
{
  self->_globalRemixFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coefficientsPixelBuffer, 0);
  objc_storeStrong((id *)&self->_coefficients, 0);
}

@end
