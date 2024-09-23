@implementation HUSimpleControlCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUSimpleControlCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUSimpleControlCell"), CFSTR("controlView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[HUSimpleControlCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("controlView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HUSimpleControlCellAccessibility;
    -[HUSimpleControlCellAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
