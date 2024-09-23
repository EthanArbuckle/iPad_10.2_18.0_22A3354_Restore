@implementation CKContactBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKContactBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKContactBalloonView"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKContactBalloonView"), CFSTR("organizationLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  _AXCKStringForMediaType(4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("organizationLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

@end
