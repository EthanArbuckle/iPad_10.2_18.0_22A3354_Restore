@implementation WDDataTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDDataTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDDataTableViewCell"), CFSTR("source"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDDataTableViewCell"), CFSTR("displayValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDDataTableViewCell"), CFSTR("dateString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKSource"), CFSTR("name"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[WDDataTableViewCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("displayValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("dateString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
