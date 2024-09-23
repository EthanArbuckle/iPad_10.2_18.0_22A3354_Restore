@implementation _UIContextMenuListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContextMenuListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  id v4;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIContextMenuListView"), CFSTR("_configureCell: forElement: section: size:"), "v", "@", "@", "@", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIContextMenuCell"), CFSTR("actionView"), v3, 0);
  objc_storeStrong(v5, v4);
}

- (void)_configureCell:(id)a3 forElement:(id)a4 section:(id)a5 size:(int64_t)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  objc_super v20;
  int64_t v21;
  id v22;
  id v23;
  id location[2];
  _UIContextMenuListViewAccessibility *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  v20.receiver = v25;
  v20.super_class = (Class)_UIContextMenuListViewAccessibility;
  -[_UIContextMenuListViewAccessibility _configureCell:forElement:section:size:](&v20, sel__configureCell_forElement_section_size_, location[0], v23, v22, a6);
  v18 = 0;
  objc_opt_class();
  v15 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("actionView"));
  v17 = (id)__UIAccessibilityCastAsSafeCategory();

  v16 = v17;
  objc_storeStrong(&v17, 0);
  v19 = (uint64_t)v16;
  v6 = (id)objc_msgSend(v23, "accessibilityLabel");
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredLabelFromMenuElement:](v19, v6);

  v7 = (id)objc_msgSend(v23, "accessibilityValue");
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredValueFromMenuElement:](v19, v7);

  v8 = (id)objc_msgSend(v23, "accessibilityHint");
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredHintFromMenuElement:](v19, v8);

  v9 = (id)objc_msgSend(v23, "accessibilityIdentifier");
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredIdentifierFromMenuElement:](v19, v9);

  v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v23, "accessibilityTraits"));
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredTraitsFromMenuElement:](v19, v10);

  v11 = (id)objc_msgSend(v23, "accessibilityUserInputLabels");
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredUserInputLabelsFromMenuElement:](v19, v11);

  objc_msgSend(v23, "accessibilityElementsHidden");
  -[_UIContextMenuCellContentViewAccessibility _accessibilitySetStoredElementsHidden:](v19);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end
