@implementation TextComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreDynamicUIPlugin.TextComponent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CoreDynamicUIPlugin.TextComponent"), CFSTR("label"), "DynamicLabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[TextComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
