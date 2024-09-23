@implementation CKMessagePartHighlightBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessagePartHighlightBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
