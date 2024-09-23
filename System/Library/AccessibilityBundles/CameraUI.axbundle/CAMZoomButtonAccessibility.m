@implementation CAMZoomButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMZoomButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPath
{
  -[CAMZoomButtonAccessibility accessibilityFrame](self, "accessibilityFrame");
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
}

@end
