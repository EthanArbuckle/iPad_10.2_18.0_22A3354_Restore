@implementation AXAuditDetectionResult

- (CGRect)detectionRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_detectionRegion.origin.x;
  y = self->_detectionRegion.origin.y;
  width = self->_detectionRegion.size.width;
  height = self->_detectionRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDetectionRegion:(CGRect)a3
{
  self->_detectionRegion = a3;
}

- (int64_t)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(int64_t)a3
{
  self->_detectionType = a3;
}

@end
