@implementation CollapsedTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.CollapsedTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.CollapsedTextView"), CFSTR("accessibilityTextView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[CollapsedTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
