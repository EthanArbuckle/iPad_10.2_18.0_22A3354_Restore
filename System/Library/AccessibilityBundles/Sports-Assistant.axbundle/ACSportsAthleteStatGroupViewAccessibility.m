@implementation ACSportsAthleteStatGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsAthleteStatGroupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
