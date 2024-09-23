@implementation SUUIStyledImageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIStyledImageButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStyledImageButton"), CFSTR("imageView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  -[SUUIStyledImageButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("UIButtonBarAction"));

  if (v6)
  {
    UIKitAccessibilityLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIStyledImageButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("image"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("UniversalActionControl"));

    if (v11)
    {
      accessibilityLocalizedString(CFSTR("more.button"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)SUUIStyledImageButtonAccessibility;
      -[SUUIStyledImageButtonAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7;
}

@end
