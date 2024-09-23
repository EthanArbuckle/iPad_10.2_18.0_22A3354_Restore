@implementation AVMobileChromelessPlaybackControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileChromelessPlaybackControlButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessPlaybackControlButtonAccessibility;
  -[AVMobileChromelessPlaybackControlButtonAccessibility accessibilityFrame](&v8, sel_accessibilityFrame);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  v6 = -CGRectGetWidth(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v7 = -CGRectGetHeight(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectInset(v11, v6, v7);
}

- (id)accessibilityValue
{
  return 0;
}

@end
