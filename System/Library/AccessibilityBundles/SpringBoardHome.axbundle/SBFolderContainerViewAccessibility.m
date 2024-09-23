@implementation SBFolderContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolderContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBFloatyFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderContainerView"), CFSTR("folderView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFolderContainerView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isTransparentFocusRegion"), "B", 0);

}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  char isKindOfClass;

  -[SBFolderContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("folderView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBFloatyFolderView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isTransparentFocusRegion
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFolderContainerViewAccessibility;
  v3 = -[SBFolderContainerViewAccessibility _isTransparentFocusRegion](&v5, sel__isTransparentFocusRegion);
  return -[SBFolderContainerViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") | v3;
}

@end
