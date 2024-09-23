@implementation PersonHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.PersonHorizontalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PersonHorizontalCell"), CFSTR("accessibilityPersonName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PersonHorizontalCell"), CFSTR("accessibilityPersonSubtitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[PersonHorizontalCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityPersonName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PersonHorizontalCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityPersonSubtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
