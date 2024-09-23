@implementation PUIProgressWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUIProgressWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUIProgressWindow"), CFSTR("_currentProgress"), "f");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("data.migration.title"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("data.migration.value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIProgressWindowAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("_currentProgress"));
  objc_msgSend(v3, "localizedStringWithFormat:", v4, roundf(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDFEFD0] | *MEMORY[0x24BDFF0D0];
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PUIProgressWindowAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)PUIProgressWindowAccessibility;
  -[PUIProgressWindowAccessibility dealloc](&v3, sel_dealloc);
}

@end
