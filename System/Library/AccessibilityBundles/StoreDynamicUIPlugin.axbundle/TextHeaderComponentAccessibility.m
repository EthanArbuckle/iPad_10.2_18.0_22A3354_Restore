@implementation TextHeaderComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StoreDynamicUIPlugin.TextHeaderComponent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.TextHeaderComponent"), CFSTR("titleLabel"), "DynamicLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.TextHeaderComponent"), CFSTR("subtitleLabel"), "DynamicLabel");

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
  int v6;
  void *v7;
  void *v8;

  -[TextHeaderComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TextHeaderComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(v3, "accessibilityLabel"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsString:", CFSTR("one-logo")),
        v5,
        v6))
  {
    accessibilityLocalizedString(CFSTR("apple.one"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
