@implementation VUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUILabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILabel"), CFSTR("textLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITextLayout"), CFSTR("textTransform"), "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILabelAccessibility;
  -[VUILabelAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[VUILabelAccessibility tag](self, "tag") == 100)
    -[VUILabelAccessibility setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUILabelAccessibility;
  -[VUILabelAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "safeIntegerForKey:", CFSTR("textTransform")) == 2)
  {
    objc_msgSend(v3, "localizedLowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("·"), &stru_2503D3D30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
