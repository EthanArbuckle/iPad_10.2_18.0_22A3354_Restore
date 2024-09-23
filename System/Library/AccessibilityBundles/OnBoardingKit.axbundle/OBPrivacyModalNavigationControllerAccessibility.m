@implementation OBPrivacyModalNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBPrivacyModalNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBPrivacyModalNavigationController"), CFSTR("_doneButtonPressed"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBPrivacyModalNavigationController"), CFSTR("UINavigationController"));

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  OBPrivacyModalNavigationControllerAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  LOBYTE(v14) = 0;
  objc_opt_class();
  -[OBPrivacyModalNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __77__OBPrivacyModalNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke;
    v11 = &unk_2502DC1D0;
    v12 = self;
    v13 = &v14;
    AXPerformSafeBlock();
    v5 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OBPrivacyModalNavigationControllerAccessibility;
    v5 = -[OBPrivacyModalNavigationControllerAccessibility accessibilityPerformEscape](&v7, sel_accessibilityPerformEscape);
  }

  return v5;
}

uint64_t __77__OBPrivacyModalNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_doneButtonPressed");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
