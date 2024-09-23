@implementation AVLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("AVLabel"), CFSTR("UILabel"));
}

- (id)accessibilityLabel
{
  void *v2;
  id v3;
  void *v4;

  -[AVLabelAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
