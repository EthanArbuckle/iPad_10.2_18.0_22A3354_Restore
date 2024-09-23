@implementation UITableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
