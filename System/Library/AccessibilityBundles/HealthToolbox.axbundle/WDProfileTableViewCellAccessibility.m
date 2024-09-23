@implementation WDProfileTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDProfileTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDProfileTableViewCell"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDProfileTableViewCell"), CFSTR("displayValue"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (!-[WDProfileTableViewCellAccessibility isEditing](self, "isEditing"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)WDProfileTableViewCellAccessibility;
  return -[WDProfileTableViewCellAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[WDProfileTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[WDProfileTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
