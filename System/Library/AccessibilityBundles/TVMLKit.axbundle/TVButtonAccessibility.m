@implementation TVButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVButton"), CFSTR("textContentView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TVButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  -[TVButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v6, "length"))
      -[TVButtonAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", v6);
  }
  else
  {
    v7 = v6;

    v4 = v7;
  }
  if (!objc_msgSend(v4, "length"))
  {
    -[TVButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  return v4;
}

@end
