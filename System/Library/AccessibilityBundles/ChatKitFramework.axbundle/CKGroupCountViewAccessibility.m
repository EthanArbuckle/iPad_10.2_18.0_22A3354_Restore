@implementation CKGroupCountViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKGroupCountView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKGroupCountView"), CFSTR("_count"), "Q");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("number.of.recipients.in.thread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, -[CKGroupCountViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_count")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
