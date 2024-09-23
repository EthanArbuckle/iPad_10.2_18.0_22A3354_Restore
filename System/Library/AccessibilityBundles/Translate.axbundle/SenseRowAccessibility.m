@implementation SenseRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.SenseRow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.SenseRow"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.SenseRow"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.SenseRow"), CFSTR("checkmark"), "@", 0);

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
  void *v10;

  objc_opt_class();
  -[SenseRowAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SenseRowAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  -[SenseRowAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("checkmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    v5 = (id)*MEMORY[0x24BDF7400];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SenseRowAccessibility;
    v5 = -[SenseRowAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }

  return (unint64_t)v5;
}

@end
