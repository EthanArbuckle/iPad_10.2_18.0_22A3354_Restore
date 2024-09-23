@implementation CalWideStatusButton

- (CGRect)_selectedIndicatorBounds
{
  objc_super v2;
  CGRect v3;

  v2.receiver = self;
  v2.super_class = (Class)CalWideStatusButton;
  -[CalWideStatusButton _selectedIndicatorBounds](&v2, sel__selectedIndicatorBounds);
  return CGRectInset(v3, -5.0, 0.0);
}

@end
