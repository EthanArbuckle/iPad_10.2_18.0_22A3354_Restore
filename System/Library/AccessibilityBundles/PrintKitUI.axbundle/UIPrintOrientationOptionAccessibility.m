@implementation UIPrintOrientationOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrintOrientationOption");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrintOrientationOption"), CFSTR("printOptionTableViewCell"), "@", 0);
}

- (id)printOptionTableViewCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIPrintOrientationOptionAccessibility;
  -[UIPrintOrientationOptionAccessibility printOptionTableViewCell](&v10, sel_printOptionTableViewCell);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("accessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "numberOfSegments") == 2)
  {
    objc_msgSend(v4, "imageForSegmentAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("print.portrait.button.label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

    objc_msgSend(v4, "imageForSegmentAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("print.landscape.button.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v8);

  }
  return v2;
}

@end
