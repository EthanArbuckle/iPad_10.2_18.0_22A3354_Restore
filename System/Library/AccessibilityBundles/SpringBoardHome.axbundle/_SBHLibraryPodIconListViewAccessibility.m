@implementation _SBHLibraryPodIconListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SBHLibraryPodIconListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBHLibraryPodFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryPodFolderView"), CFSTR("librarySearchControllerScrollViewDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBHLibrarySearchController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibrarySearchController"), CFSTR("setActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_minimumContentOffset"), "{CGPoint=dd}", 0);

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v16;

  -[_SBHLibraryPodIconListViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 3
    && (objc_msgSend(v5, "contentOffset"),
        v8 = v7,
        objc_msgSend(v6, "safeCGPointForKey:", CFSTR("_minimumContentOffset")),
        v8 == v9))
  {
    -[_SBHLibraryPodIconListViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBHLibraryPodFolderView")));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("librarySearchControllerScrollViewDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v12;
    v13 = v12;
    AXPerformSafeBlock();

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
