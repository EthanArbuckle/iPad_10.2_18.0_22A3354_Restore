@implementation PXCuratedLibraryViewProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCuratedLibraryViewProvider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewProvider"), CFSTR("gridView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewProvider"), CFSTR("axGroup:didChange:userInfo:"), "v", "@", "Q", "@", 0);

}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  if (a4 != 2
    || (-[PXCuratedLibraryViewProviderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("gridView")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "_accessibilityIsFKARunningForFocusItem"),
        v10,
        (v11 & 1) == 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXCuratedLibraryViewProviderAccessibility;
    -[PXCuratedLibraryViewProviderAccessibility axGroup:didChange:userInfo:](&v12, sel_axGroup_didChange_userInfo_, v8, a4, v9);
  }

}

@end
