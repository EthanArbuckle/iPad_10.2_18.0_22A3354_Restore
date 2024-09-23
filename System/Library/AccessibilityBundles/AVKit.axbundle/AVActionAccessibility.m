@implementation AVActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVAction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIMenuElement"), CFSTR("title"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[AVActionAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVActionAccessibility;
    -[AVActionAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
