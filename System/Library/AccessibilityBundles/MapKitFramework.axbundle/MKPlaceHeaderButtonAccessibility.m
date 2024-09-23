@implementation MKPlaceHeaderButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceHeaderButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MKPlaceHeaderButton"), CFSTR("UIButton"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[MKPlaceHeaderButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
