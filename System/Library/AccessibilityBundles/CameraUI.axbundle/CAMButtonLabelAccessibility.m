@implementation CAMButtonLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMButtonLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMButtonLabel"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
