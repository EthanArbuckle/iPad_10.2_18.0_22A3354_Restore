@implementation CKAggregateAcknowledgmentBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAggregateAcknowledgmentBalloonView");
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
