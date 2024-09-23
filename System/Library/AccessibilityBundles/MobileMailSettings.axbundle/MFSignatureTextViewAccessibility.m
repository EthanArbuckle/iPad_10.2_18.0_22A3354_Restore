@implementation MFSignatureTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFSignatureTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
