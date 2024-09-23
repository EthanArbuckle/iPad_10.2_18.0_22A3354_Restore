@implementation VUITextBadgeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUITextBadge");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("VUITextBadge"), CFSTR("attributedTitle"), "@");
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
  void *v6;

  objc_opt_class();
  -[VUITextBadgeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXAttributedStringForBetterPronuciation();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
