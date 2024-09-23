@implementation BuddyLanguageControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyLanguageController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BuddyLanguageController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageLocaleCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageController"), CFSTR("languageComposite"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageComposite"), CFSTR("languageCodes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageController"), CFSTR("_selectLanguage:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BuddyLanguageControllerAccessibility;
  -[BuddyLanguageControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[BuddyLanguageControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_selectLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyLanguageControllerAccessibility;
  -[BuddyLanguageControllerAccessibility _selectLanguage:](&v10, sel__selectLanguage_, v4);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("backButtonView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "backButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXAttributedStringForLanguage(v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "setAccessibilityLabel:", v9);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BuddyLanguageControllerAccessibility;
  -[BuddyLanguageControllerAccessibility tableView:cellForRowAtIndexPath:](&v24, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v9 = v7;
  AXPerformSafeBlock();
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  LOBYTE(v18) = 0;
  objc_opt_class();
  __UIAccessibilitySafeClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  objc_msgSend(v11, "safeValueForKey:", CFSTR("titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v18)
    abort();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  AXAttributedStringForLanguage(v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v8, "setAccessibilityLabel:", v16);

  return v8;
}

void __72__BuddyLanguageControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("languageComposite"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("languageCodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
