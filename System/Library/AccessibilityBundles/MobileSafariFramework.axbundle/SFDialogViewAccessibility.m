@implementation SFDialogViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFDialogView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 10;
}

@end
