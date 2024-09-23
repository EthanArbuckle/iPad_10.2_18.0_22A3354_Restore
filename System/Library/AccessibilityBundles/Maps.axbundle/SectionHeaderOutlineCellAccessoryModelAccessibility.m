@implementation SectionHeaderOutlineCellAccessoryModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SectionHeaderOutlineCellAccessoryModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SectionHeaderOutlineCellAccessoryModel"), CFSTR("visibility"), "q", 0);
}

- (int64_t)visibility
{
  objc_super v4;

  if (_AXSCommandAndControlEnabled())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderOutlineCellAccessoryModelAccessibility;
  return -[SectionHeaderOutlineCellAccessoryModelAccessibility visibility](&v4, sel_visibility);
}

@end
