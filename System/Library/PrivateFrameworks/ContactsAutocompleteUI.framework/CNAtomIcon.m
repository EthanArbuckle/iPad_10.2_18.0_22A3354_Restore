@implementation CNAtomIcon

- (CGPoint)drawingOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->drawingOffset.x;
  y = self->drawingOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDrawingOffset:(CGPoint)a3
{
  self->drawingOffset = a3;
}

@end
