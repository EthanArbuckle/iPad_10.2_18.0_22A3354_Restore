@implementation CKTranscriptTypingIndicatorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptTypingIndicatorCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("contact.typing.message"));
}

@end
