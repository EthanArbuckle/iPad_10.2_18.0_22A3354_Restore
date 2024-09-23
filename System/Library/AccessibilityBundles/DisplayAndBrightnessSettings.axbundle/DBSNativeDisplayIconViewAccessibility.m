@implementation DBSNativeDisplayIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DBSNativeDisplayIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("DBSNativeDisplayIconView"), CFSTR("nameField"), "@");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("arrangement.hint"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  _QWORD *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DBSNativeDisplayIconViewAccessibility;
  v3 = -[DBSNativeDisplayIconViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[DBSNativeDisplayIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  v6 = (_QWORD *)MEMORY[0x24BDF7400];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x24BDF73B0];
  return *v6 | v3;
}

@end
