@implementation PedestrianARInstructionContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PedestrianARInstructionContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PedestrianARInstructionContainerView"), CFSTR("topLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PedestrianARInstructionContainerView"), CFSTR("bottomLabel"), "@", 0);

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
  void *v7;

  -[PedestrianARInstructionContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("topLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PedestrianARInstructionContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("bottomLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARInstructionContainerViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[PedestrianARInstructionContainerViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
