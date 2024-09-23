@implementation EKUIParticipantContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIParticipantContainer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIParticipantContainer"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIParticipantContainer"), CFSTR("subLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[EKUIParticipantContainerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIParticipantContainerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("subLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
