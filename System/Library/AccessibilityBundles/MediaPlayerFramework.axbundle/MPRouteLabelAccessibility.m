@implementation MPRouteLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPRouteLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPRouteLabel"), CFSTR("_routeNames"), "NSMutableSet");
}

- (BOOL)isAccessibilityElement
{
  Class v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v3 = NSClassFromString(CFSTR("MRUNowPlayingHeaderView"));
  if (v3)
  {
    -[MPRouteLabelAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MPRouteLabelAccessibility;
    return -[MPRouteLabelAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1640];
  -[MPRouteLabelAccessibility safeSetForKey:](self, "safeSetForKey:", CFSTR("routeNames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringByJoiningStrings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
