@implementation MTUIStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  return *(_QWORD *)"d" + 1;
}

@end
