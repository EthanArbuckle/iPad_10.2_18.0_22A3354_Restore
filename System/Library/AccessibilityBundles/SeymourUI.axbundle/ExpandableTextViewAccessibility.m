@implementation ExpandableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ExpandableTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.ExpandableTextView"), CFSTR("moreTextLabel"), "GradientBackedLabelView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.ExpandableTextView"), CFSTR("handleTapGesture:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ExpandableTextViewAccessibility;
  -[ExpandableTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[ExpandableTextViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("moreTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__ExpandableTextViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_250348530;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityActivateBlock:", v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

uint64_t __77__ExpandableTextViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __77__ExpandableTextViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleTapGesture:", 0);

}

@end
