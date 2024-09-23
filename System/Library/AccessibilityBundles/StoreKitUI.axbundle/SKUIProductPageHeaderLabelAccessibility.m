@implementation SKUIProductPageHeaderLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIProductPageHeaderLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIProductPageHeaderLabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIProductPageHeaderLabel"), CFSTR("contentRating"), "@", 0);

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
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  -[SKUIProductPageHeaderLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageHeaderLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentRating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), &stru_24FF2D518);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilitySKUILocalizedString(CFSTR("app.rating.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_24FF2D518;
  }
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
