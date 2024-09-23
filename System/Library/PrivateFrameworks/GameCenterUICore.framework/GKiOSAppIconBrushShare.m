@implementation GKiOSAppIconBrushShare

- (CGSize)sizeForInput:(id)a3
{
  id v4;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v4 = a3;
  width = self->_outputSize.width;
  if (width == 0.0)
  {
    height = self->_outputSize.height;
    if (height == 0.0)
    {
      v11.receiver = self;
      v11.super_class = (Class)GKiOSAppIconBrushShare;
      -[GKImageBrush sizeForInput:](&v11, sel_sizeForInput_, v4);
      width = v7;
      height = v8;
    }
  }
  else
  {
    height = self->_outputSize.height;
  }

  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
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
