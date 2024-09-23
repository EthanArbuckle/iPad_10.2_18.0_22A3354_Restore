@implementation _TVProductTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVProductTemplateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_atvaccessibilitySemanticContextViewIdentifier
{
  return CFSTR("productPage");
}

@end
