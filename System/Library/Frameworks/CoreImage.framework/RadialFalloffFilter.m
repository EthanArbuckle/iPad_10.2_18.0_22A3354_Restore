@implementation RadialFalloffFilter

- (id)outputImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  float v11;
  float v12;
  float v13;
  float v14;
  CGRect v16;

  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NSNumber floatValue](self->inputFalloff, "floatValue");
  v12 = v11;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v14 = v13;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  return RRradialCentroidMask(self->inputCenter, v16, v14, v12, 1);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputFalloff
{
  return self->inputFalloff;
}

- (void)setInputFalloff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputAnisotropic
{
  return self->inputAnisotropic;
}

- (void)setInputAnisotropic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
