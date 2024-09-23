@implementation ProfileIconButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProfileIconButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProfileIconButton"), CFSTR("_iconName"), "NSString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[ProfileIconButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("ellipsis")))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    profileSymbolAccessibilityLabel(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    profileSymbolAccessibilityLabel(v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    profileSymbolAccessibilityLabel(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
