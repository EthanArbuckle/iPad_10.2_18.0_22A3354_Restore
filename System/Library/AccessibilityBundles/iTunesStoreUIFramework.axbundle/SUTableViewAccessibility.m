@implementation SUTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SUTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityHeaderElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUWebView"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(CFSTR("ASApplicationPageView")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[SUTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityUIScrollViewScrollStatus"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUTableViewAccessibility;
    -[SUTableViewAccessibility _accessibilityScrollStatus](&v7, sel__accessibilityScrollStatus);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
