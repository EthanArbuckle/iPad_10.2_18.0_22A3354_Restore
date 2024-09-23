@implementation EKCalendarItemLocationInlineEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKCalendarItemLocationInlineEditItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItemLocationInlineEditItem"), CFSTR("cellForSubitemAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItemLocationInlineEditItem"), CFSTR("_updateClearButtonAndMakeVisible:index:"), "v", "@", "Q", 0);

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemLocationInlineEditItemAccessibility;
  -[EKCalendarItemLocationInlineEditItemAccessibility cellForSubitemAtIndex:](&v6, sel_cellForSubitemAtIndex_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v4);
  return v3;
}

- (void)_updateClearButtonAndMakeVisible:(id)a3 index:(unint64_t)a4
{
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKCalendarItemLocationInlineEditItemAccessibility;
  v5 = a3;
  -[EKCalendarItemLocationInlineEditItemAccessibility _updateClearButtonAndMakeVisible:index:](&v7, sel__updateClearButtonAndMakeVisible_index_, v5, a4);
  UIKitAccessibilityLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6, v7.receiver, v7.super_class);

}

@end
