@implementation CARIconScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CARIconScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CARFolderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("_CARDashboardHomeViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CARTodayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CARDashboardHomeViewController"), CFSTR("todayViewController"), "@", 0);

}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_opt_class();
  -[CARIconScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("todayViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CARIconScrollViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234909F28](CFSTR("CARFolderView")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "automationElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axArrayWithPossiblyNilArrays:", 2, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __52__CARIconScrollViewAccessibility_automationElements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234909F28](CFSTR("_CARDashboardHomeViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
