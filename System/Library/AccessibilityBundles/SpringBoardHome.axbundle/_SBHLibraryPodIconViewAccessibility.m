@implementation _SBHLibraryPodIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SBHLibraryPodIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SBHLibraryPodIconView"), CFSTR("SBIconView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("customIconImageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryCategoryIconViewController"), CFSTR("_canBeLocked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryCategoryIconViewController"), CFSTR("isLocked"), "B", 0);

}

- (id)accessibilityHint
{
  void *v2;

  if (-[_SBHLibraryPodIconViewAccessibility _axIsHiddenPod](self, "_axIsHiddenPod"))
  {
    accessibilityLocalizedString(CFSTR("app.library.hidden.folder.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[_SBHLibraryPodIconViewAccessibility _axIsHiddenPod](self, "_axIsHiddenPod"))
  {
    -[_SBHLibraryPodIconViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    AX_CGRectGetCenter();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_SBHLibraryPodIconViewAccessibility;
    -[_SBHLibraryPodIconViewAccessibility accessibilityActivationPoint](&v5, sel_accessibilityActivationPoint);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (int64_t)accessibilityContainerType
{
  objc_super v4;

  if (-[_SBHLibraryPodIconViewAccessibility _axIsHiddenPod](self, "_axIsHiddenPod"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_SBHLibraryPodIconViewAccessibility;
  return -[_SBHLibraryPodIconViewAccessibility accessibilityContainerType](&v4, sel_accessibilityContainerType);
}

- (BOOL)_axIsHiddenPod
{
  void *v2;
  char v3;

  -[_SBHLibraryPodIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("customIconImageViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("_canBeLocked")))
    v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isLocked"));
  else
    v3 = 0;

  return v3;
}

@end
