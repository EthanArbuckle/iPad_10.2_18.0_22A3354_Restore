@implementation AXPISystemPointerLargeAppearance

- (double)fingerInnerRadius
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXPISystemPointerLargeAppearance;
  -[AXPISystemPointerPreciseAppearance fingerInnerRadius](&v4, sel_fingerInnerRadius);
  return fmax(v2, 23.5);
}

- (double)unpressedAlpha
{
  return 0.7;
}

@end
