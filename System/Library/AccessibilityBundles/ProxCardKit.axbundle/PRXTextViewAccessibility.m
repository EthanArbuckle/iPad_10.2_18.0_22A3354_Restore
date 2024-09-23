@implementation PRXTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRXTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRXTextView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PRXTextView"), CFSTR("_style"), "q");

}

- (id)accessibilityValue
{
  return 0;
}

- (id)accessibilityAttributedValue
{
  return 0;
}

- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs
{
  return 0;
}

- (id)accessibilityLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXTextViewAccessibility;
  -[PRXTextViewAccessibility accessibilityValue](&v3, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  unint64_t *v3;

  v2 = -[PRXTextViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_style"));
  v3 = (unint64_t *)MEMORY[0x24BDF73C0];
  if (v2)
    v3 = (unint64_t *)MEMORY[0x24BDF7410];
  return *v3;
}

@end
