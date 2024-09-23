@implementation HUServiceDetailsHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUServiceDetailsHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUServiceDetailsHeaderCell"), CFSTR("messageTextView"), "@", 0);
}

- (BOOL)accessibilityElementsHidden
{
  return !-[HUServiceDetailsHeaderCellAccessibility accessibilityHomeUIIsMessageTextViewVisible](self, "accessibilityHomeUIIsMessageTextViewVisible");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[HUServiceDetailsHeaderCellAccessibility accessibilityHomeUIIsMessageTextViewVisible](self, "accessibilityHomeUIIsMessageTextViewVisible"))
  {
    -[HUServiceDetailsHeaderCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("messageTextView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("text"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HUServiceDetailsHeaderCellAccessibility;
    -[HUServiceDetailsHeaderCellAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[HUServiceDetailsHeaderCellAccessibility accessibilityHomeUIIsMessageTextViewVisible](self, "accessibilityHomeUIIsMessageTextViewVisible"))
  {
    return *MEMORY[0x24BDF73B0];
  }
  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsHeaderCellAccessibility;
  return -[HUServiceDetailsHeaderCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (BOOL)accessibilityHomeUIIsMessageTextViewVisible
{
  void *v2;
  char v3;

  -[HUServiceDetailsHeaderCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("messageTextView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

@end
