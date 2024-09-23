@implementation SettingsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SettingsTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
