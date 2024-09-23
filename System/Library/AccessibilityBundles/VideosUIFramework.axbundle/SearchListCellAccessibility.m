@implementation SearchListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.SearchListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.SearchListCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.SearchListCell"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.SearchListCell"), CFSTR("buttonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIButton"), CFSTR("selectActionHandler"), "@?", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;
  char v16;

  -[SearchListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_opt_class();
  -[SearchListCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("badgeView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)SearchListCellAccessibility;
  -[SearchListCellAccessibility accessibilityLabel](&v15, sel_accessibilityLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(v4, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchListCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchListCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)SearchListCellAccessibility;
  -[SearchListCellAccessibility accessibilityCustomActions](&v16, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[SearchListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);
  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("search.cell.button.more.action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __57__SearchListCellAccessibility_accessibilityCustomActions__block_invoke;
  v13 = &unk_2503D25D8;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v7, &v10);

  objc_msgSend(v3, "axSafelyAddObject:", v8, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v3;
}

BOOL __57__SearchListCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("selectActionHandler"));
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    ((void (**)(_QWORD, id))v3)[2](v3, v4);

  }
  return v3 != 0;
}

@end
