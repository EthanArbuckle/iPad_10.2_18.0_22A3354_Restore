@implementation SSOBBoldTrayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSOBBoldTrayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SSOBBoldTrayButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSOBBoldTrayButton"), CFSTR("normalStateTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSOBBoldTrayButton"), CFSTR("spinner"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSpinner"), CFSTR("_label"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
  {
    -[SSOBBoldTrayButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("normalStateTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v5 = v6;
    }
    else
    {
      objc_msgSend(v3, "titleForState:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v6;
  }
  else
  {
    -[SSOBBoldTrayButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("spinner"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v5, "safeUIViewForKey:", CFSTR("_label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSOBBoldTrayButtonAccessibility;
  v2 = -[SSOBBoldTrayButtonAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEnabled"))
    v2 = (id)*MEMORY[0x24BDF73E0];

  return (unint64_t)v2;
}

@end
