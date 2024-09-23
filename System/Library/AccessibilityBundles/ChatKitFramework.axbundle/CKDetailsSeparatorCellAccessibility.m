@implementation CKDetailsSeparatorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsSeparatorCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CKDetailsSeparatorCell"), CFSTR("CKDetailsCell"));
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
