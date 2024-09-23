@implementation UIClassicWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIClassicWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  return (-[UIClassicWindowAccessibility isHidden](self, "isHidden", a2, self) ^ 1) & 1;
}

@end
