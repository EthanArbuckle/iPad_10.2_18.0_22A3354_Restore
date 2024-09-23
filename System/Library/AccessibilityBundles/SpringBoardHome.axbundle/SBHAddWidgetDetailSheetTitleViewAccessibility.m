@implementation SBHAddWidgetDetailSheetTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHAddWidgetDetailSheetTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetTitleView"), CFSTR("textLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[SBHAddWidgetDetailSheetTitleViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBHAddWidgetDetailSheetTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
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
    v8.super_class = (Class)SBHAddWidgetDetailSheetTitleViewAccessibility;
    -[SBHAddWidgetDetailSheetTitleViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  objc_super v6;
  objc_super v7;

  -[SBHAddWidgetDetailSheetTitleViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHAddWidgetDetailSheetTitleViewAccessibility;
    v4 = *MEMORY[0x24BDF73C0] | -[SBHAddWidgetDetailSheetTitleViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHAddWidgetDetailSheetTitleViewAccessibility;
    v4 = -[SBHAddWidgetDetailSheetTitleViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }

  return v4;
}

@end
