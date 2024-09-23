@implementation CKMessageEditingBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEditingBalloonView");
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
