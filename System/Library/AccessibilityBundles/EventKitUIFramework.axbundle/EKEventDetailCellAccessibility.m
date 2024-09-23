@implementation EKEventDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventDetailCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[EKEventDetailCellAccessibility accessoryType](self, "accessoryType") == 1)
    return *MEMORY[0x24BDF73B0];
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailCellAccessibility;
  return -[EKEventDetailCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

@end
