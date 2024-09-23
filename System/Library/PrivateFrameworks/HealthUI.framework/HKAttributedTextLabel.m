@implementation HKAttributedTextLabel

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)HKAttributedTextLabel;
  -[HKAttributedTextLabel intrinsicContentSize](&v5, sel_intrinsicContentSize);
  *(float *)&v3 = v3;
  v4 = ceilf(*(float *)&v3);
  result.height = v4;
  result.width = v2;
  return result;
}

@end
