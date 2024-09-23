@implementation CollapsedTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.CollapsedTextView");
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
