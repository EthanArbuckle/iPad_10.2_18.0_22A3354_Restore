@implementation CNUINavigationListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNUINavigationListViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNUINavigationListViewCell"), CFSTR("accessoryImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("CNUINavigationListViewCell"), CFSTR("accessoryControlExpanded"), CFSTR("isAccessoryControlExpanded"), 0, "B");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNUINavigationListViewCellAccessibility;
  -[CNUINavigationListViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CNUINavigationListViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)CNUINavigationListViewCellAccessibility;
  -[CNUINavigationListViewCellAccessibility accessibilityCustomActions](&v13, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[CNUINavigationListViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessoryImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityViewIsVisible");

  if (v6)
  {
    v7 = -[CNUINavigationListViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessoryControlExpanded"));
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    if (v7)
      v9 = CFSTR("collapse.selection.action");
    else
      v9 = CFSTR("expand.selection.action");
    accessibilityLocalizedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithName:target:selector:", v10, self, sel__accessibilityToggleSelection);

    objc_msgSend(v3, "axSafelyAddObject:", v11);
  }
  return v3;
}

- (BOOL)_accessibilityToggleSelection
{
  void *v2;
  void *v3;
  char v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[CNUINavigationListViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __72__CNUINavigationListViewCellAccessibility__accessibilityToggleSelection__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_accessibilityToggleItemForCell:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], *(id *)(a1 + 40));
}

@end
