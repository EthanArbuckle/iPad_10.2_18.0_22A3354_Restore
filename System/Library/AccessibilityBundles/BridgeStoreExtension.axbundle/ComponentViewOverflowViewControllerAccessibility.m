@implementation ComponentViewOverflowViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.ComponentViewOverflowViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("BridgeStoreExtension.ComponentViewOverflowViewController"), CFSTR("UIViewController"));
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v6[5];
  v6[5] = v2;

  AXPerformSafeBlock();
  _Block_object_dispose(&v5, 8);

  return 1;
}

uint64_t __78__ComponentViewOverflowViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
