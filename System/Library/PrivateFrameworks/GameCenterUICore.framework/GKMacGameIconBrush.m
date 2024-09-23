@implementation GKMacGameIconBrush

- (id)renderedImageIdentifier
{
  CGSize v3;

  -[GKMacGameIconBrush outputSize](self, "outputSize");
  return NSStringFromCGSize(v3);
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOutputSize:(CGSize)a3
{
  self->_outputSize = a3;
}

@end
