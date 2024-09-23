@implementation TwoLinesTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TwoLinesTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoLinesTableViewCell"), CFSTR("_twoLinesContentView"), "TwoLinesContentView");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[TwoLinesTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_twoLinesContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
