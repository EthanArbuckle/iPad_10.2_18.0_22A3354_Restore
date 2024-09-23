@implementation BCSVisualCode

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  self->_topLeft = a3;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  self->_topRight = a3;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  self->_bottomRight = a3;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  self->_bottomLeft = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (NSString)payloadString
{
  return self->_payloadString;
}

- (NSData)rawPayload
{
  return self->_rawPayload;
}

- (unint64_t)codeVersion
{
  return self->_codeVersion;
}

- (int64_t)codeType
{
  return self->_codeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPayload, 0);
  objc_storeStrong((id *)&self->_payloadString, 0);
}

@end
