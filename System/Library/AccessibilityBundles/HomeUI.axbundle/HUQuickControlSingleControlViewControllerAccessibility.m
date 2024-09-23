@implementation HUQuickControlSingleControlViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlSingleControlViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSingleControlViewController"), CFSTR("interactionCoordinator:showAuxiliaryView:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSingleControlViewController"), CFSTR("hideAuxiliaryViewForInteractionCoordinator:"), "v", "@", 0);

}

- (void)interactionCoordinator:(id)a3 showAuxiliaryView:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSingleControlViewControllerAccessibility;
  -[HUQuickControlSingleControlViewControllerAccessibility interactionCoordinator:showAuxiliaryView:](&v5, sel_interactionCoordinator_showAuxiliaryView_, a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HUQuickControlSingleControlViewControllerAccessibility _accessibilityMoveToActiveControl](self, "_accessibilityMoveToActiveControl");
}

- (void)hideAuxiliaryViewForInteractionCoordinator:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSingleControlViewControllerAccessibility;
  -[HUQuickControlSingleControlViewControllerAccessibility hideAuxiliaryViewForInteractionCoordinator:](&v4, sel_hideAuxiliaryViewForInteractionCoordinator_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HUQuickControlSingleControlViewControllerAccessibility _accessibilityMoveToActiveControl](self, "_accessibilityMoveToActiveControl");
}

@end
