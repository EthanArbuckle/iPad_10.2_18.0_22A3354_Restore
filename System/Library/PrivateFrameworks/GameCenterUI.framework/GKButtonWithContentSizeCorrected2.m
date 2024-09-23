@implementation GKButtonWithContentSizeCorrected2

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)GKButtonWithContentSizeCorrected2;
  -[GKButton intrinsicContentSize](&v5, sel_intrinsicContentSize);
  v4 = v3 + 20.0;
  result.height = v2;
  result.width = v4;
  return result;
}

@end
