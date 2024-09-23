@implementation ABPKDirectScalingParams

- (ABPKDirectScalingParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  ABPKDirectScalingParams *result;
  float v9;
  float v10;
  float v11;
  float v12;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)ABPKDirectScalingParams;
  result = -[ABPKDirectScalingParams init](&v13, sel_init);
  if (result)
  {
    v9 = width;
    v10 = v9 / v7;
    v11 = height;
    v12 = v11 / v6;
    result->_heightScale = v12;
    result->_widthScale = v10;
  }
  return result;
}

- (float)heightScale
{
  return self->_heightScale;
}

- (float)widthScale
{
  return self->_widthScale;
}

@end
