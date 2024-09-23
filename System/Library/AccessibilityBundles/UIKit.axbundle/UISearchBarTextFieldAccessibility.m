@implementation UISearchBarTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchBarTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UISearchBarTextField");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v4 = CFSTR("UITextField");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UISearchBarTextField"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("isEditing"), "B", 0);
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("textStorage"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextFieldAccessibility"), CFSTR("_accessibilityRightButtons"), v6, 0);
  v5 = CFSTR("_UISearchTokenAttachment");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_viewProvider"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSTextAttachmentViewProvider"), CFSTR("view"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (unint64_t)_accessibilityAutomationType
{
  return 45;
}

- (id)accessibilityLabel
{
  id v2;
  id v4;
  char v5;
  _BOOL4 v6;
  BOOL v7;

  v2 = (id)-[UISearchBarTextFieldAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v7 = v2 == 0;

  if (!v7)
    return (id)-[UISearchBarTextFieldAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  LOBYTE(v6) = 0;
  if (_AXSAutomationEnabled())
    v6 = !UIAccessibilityIsVoiceOverRunning();
  v4 = -[UISearchBarTextFieldAccessibility accessibilityValue](self, "accessibilityValue");
  v5 = 1;
  if (objc_msgSend(v4, "length"))
    v5 = v6;

  if ((v5 & 1) != 0)
    return (id)-[UISearchBarTextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeholder"));
  else
    return 0;
}

- (id)accessibilityValue
{
  id v2;
  void *v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(_QWORD *, void *, void *, void *);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30[2];
  UISearchBarTextFieldAccessibility *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = self;
  v30[1] = (id)a2;
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = __Block_byref_object_copy__18;
  v29 = __Block_byref_object_dispose__18;
  v30[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v22 = 0;
  objc_opt_class();
  v9 = (id)-[UISearchBarTextFieldAccessibility safeValueForKey:](v31, "safeValueForKey:", CFSTR("textStorage"));
  v21 = (id)__UIAccessibilityCastAsClass();

  v20 = v21;
  objc_storeStrong(&v21, 0);
  v23 = v20;
  v7 = *MEMORY[0x24BEBB318];
  v8 = objc_msgSend(v20, "length");
  v33 = 0;
  v32 = v8;
  v34 = 0;
  v35 = v8;
  v18 = 0;
  v19 = v8;
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __55__UISearchBarTextFieldAccessibility_accessibilityValue__block_invoke;
  v16 = &unk_24FF3F310;
  v17 = &v24;
  objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, &v12);
  v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v10.receiver = v31;
  v10.super_class = (Class)UISearchBarTextFieldAccessibility;
  v5 = -[UISearchBarTextFieldAccessibility accessibilityValue](&v10, sel_accessibilityValue);
  v2 = (id)__UIAXStringForVariables();
  v3 = (void *)v25[5];
  v25[5] = (uint64_t)v2;

  v6 = (id)v25[5];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(v30, 0);
  return v6;
}

void __55__UISearchBarTextFieldAccessibility_accessibilityValue__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id location[4];

  location[2] = a3;
  location[3] = a4;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("_UISearchTokenAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend(location[0], "accessibilityLabel");
    v4 = (id)__UIAXStringForVariables();
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_storeStrong(location, 0);
}

- (id)accessibilityLocalizedStringKey
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UISearchBarTextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeholder"));
  v5 = (id)objc_msgSend(v6[0], "_accessibilityAttributedLocalizedString");
  v4 = (id)objc_msgSend(v5, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringKey"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (id)accessibilityLocalizationBundleID
{
  return (id)-[UISearchBarTextFieldAccessibility _accessibilityRetrieveLocalizationBundleID](self, "_accessibilityRetrieveLocalizationBundleID", a2, self);
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)-[UISearchBarTextFieldAccessibility _accessibilityRetrieveLocalizationBundlePath](self, "_accessibilityRetrieveLocalizationBundlePath", a2, self);
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)-[UISearchBarTextFieldAccessibility _accessibilityRetrieveLocalizedStringTableName](self, "_accessibilityRetrieveLocalizedStringTableName", a2, self);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  UISearchBarTextFieldAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UISearchBarTextFieldAccessibility;
  v4 = -[UISearchBarTextFieldAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  return v4 | *MEMORY[0x24BDF73F8];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UISearchBarTextFieldAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISearchBarTextFieldAccessibility;
  -[UISearchBarTextFieldAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UISearchBarTextFieldAccessibility _accessibilityEditingModeChanged](v4, "_accessibilityEditingModeChanged");
}

- (void)_accessibilityEditingModeChanged
{
  id v2;

  v2 = (id)-[UISearchBarTextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_clearButton"));
  objc_msgSend(v2, "setIsAccessibilityElement:", -[UISearchBarTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing")) & 1);

}

- (id)_accessibilityRightButtons
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(_QWORD *, void *, void *, void *);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23[2];
  UISearchBarTextFieldAccessibility *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v24 = self;
  v23[1] = (id)a2;
  v23[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0;
  objc_opt_class();
  v9 = (id)-[UISearchBarTextFieldAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("textStorage"));
  v20 = (id)__UIAccessibilityCastAsClass();

  v19 = v20;
  objc_storeStrong(&v20, 0);
  v22 = v19;
  v5 = v19;
  v4 = *MEMORY[0x24BEBB318];
  v2 = objc_msgSend(v19, "length");
  v26 = 0;
  v25 = v2;
  v27 = 0;
  v28 = v2;
  v17 = 0;
  v18 = v2;
  v11 = MEMORY[0x24BDAC760];
  v12 = -1073741824;
  v13 = 0;
  v14 = __63__UISearchBarTextFieldAccessibility__accessibilityRightButtons__block_invoke;
  v15 = &unk_24FF3F338;
  v16 = v23[0];
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v4, v17, v18, 0, &v11);
  v6 = v23[0];
  v10.receiver = v24;
  v10.super_class = (Class)UISearchBarTextFieldAccessibility;
  v7 = -[UISearchBarTextFieldAccessibility _accessibilityRightButtons](&v10, sel__accessibilityRightButtons);
  v8 = (id)objc_msgSend(v6, "arrayByAddingObjectsFromArray:");

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  return v8;
}

void __63__UISearchBarTextFieldAccessibility__accessibilityRightButtons__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v5;
  id v6;
  id location[4];

  location[2] = a3;
  location[3] = a4;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("_UISearchTokenAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)a1[4];
    v6 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_viewProvider"));
    v5 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("view"));
    objc_msgSend(v4, "axSafelyAddObject:");

  }
  objc_storeStrong(location, 0);
}

@end
