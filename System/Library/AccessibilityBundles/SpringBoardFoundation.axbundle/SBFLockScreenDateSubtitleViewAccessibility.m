@implementation SBFLockScreenDateSubtitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFLockScreenDateSubtitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SBFLockScreenDateSubtitleViewAccessibility frame](self, "frame", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

@end
