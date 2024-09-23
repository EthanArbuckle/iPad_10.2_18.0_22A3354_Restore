@implementation PHVideoCallInterfaceOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHVideoCallInterfaceOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PHCallParticipantsView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHVideoCallInterfaceOverlayView"), CFSTR("UIView"));

}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  char v3;

  -[PHVideoCallInterfaceOverlayViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("PHCallParticipantsView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityViewIsModal");

  return v3;
}

@end
