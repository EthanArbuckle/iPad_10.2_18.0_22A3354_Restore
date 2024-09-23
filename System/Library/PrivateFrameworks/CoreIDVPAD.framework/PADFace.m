@implementation PADFace

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (PADPose)facePose
{
  return self->_facePose;
}

- (void)setFacePose:(id)a3
{
  objc_storeStrong((id *)&self->_facePose, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facePose, 0);
}

@end
