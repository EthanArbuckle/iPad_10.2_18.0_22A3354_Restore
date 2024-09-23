@implementation CNContactGeminiViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactGeminiView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactGeminiView"), CFSTR("shouldDisplayChevron"), "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactGeminiViewAccessibility;
  v3 = -[CNContactGeminiViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CNContactGeminiViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldDisplayChevron"));
  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
