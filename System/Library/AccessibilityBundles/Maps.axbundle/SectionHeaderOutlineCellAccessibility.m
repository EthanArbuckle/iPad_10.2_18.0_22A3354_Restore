@implementation SectionHeaderOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SectionHeaderOutlineCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SectionHeaderOutlineCell"), CFSTR("_cellModel"), "<SectionHeaderOutlineCellModel>");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SectionHeaderOutlineCellModel"), CFSTR("title"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SectionHeaderOutlineCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cellModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF7410];
}

@end
