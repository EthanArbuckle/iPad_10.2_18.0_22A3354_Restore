@implementation VideosUI_FocusableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FocusableTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FocusableTextView"), CFSTR("descriptionText"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[VideosUI_FocusableTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionText"));
}

@end
