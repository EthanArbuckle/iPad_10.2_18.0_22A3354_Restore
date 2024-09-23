@implementation GKBasePlayerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKBasePlayerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKBasePlayerCell"), CFSTR("nameLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[GKBasePlayerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
