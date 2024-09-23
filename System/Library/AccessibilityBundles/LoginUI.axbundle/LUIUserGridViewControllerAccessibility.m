@implementation LUIUserGridViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIUserGridViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LUIUserGridViewController"), CFSTR("vibrantButtonPressed:"), "v", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  LUIUserGridViewControllerAccessibility *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __68__LUIUserGridViewControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v9 = &unk_25024C718;
  v10 = self;
  v11 = &v12;
  AXPerformSafeBlock();
  if (*((_BYTE *)v13 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LUIUserGridViewControllerAccessibility;
    v3 = -[LUIUserGridViewControllerAccessibility accessibilityPerformEscape](&v5, sel_accessibilityPerformEscape);
    *((_BYTE *)v13 + 24) = v3;
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

uint64_t __68__LUIUserGridViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "vibrantButtonPressed:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
