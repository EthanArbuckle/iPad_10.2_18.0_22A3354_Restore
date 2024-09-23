@implementation SFUnifiedBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedBarItemView"), CFSTR("item"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  SFUnifiedBarItemViewAccessibility *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SFUnifiedBarItemViewAccessibility;
  -[SFUnifiedBarItemViewAccessibility accessibilityLabel](&v18, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SFUnifiedBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy_;
      v16 = __Block_byref_object_dispose_;
      v17 = 0;
      v6 = MEMORY[0x24BDAC760];
      v7 = 3221225472;
      v8 = __55__SFUnifiedBarItemViewAccessibility_accessibilityLabel__block_invoke;
      v9 = &unk_2502967F0;
      v10 = self;
      v11 = &v12;
      AXPerformSafeBlock();
      v4 = (id)v13[5];
      _Block_object_dispose(&v12, 8);

    }
    objc_msgSend(v4, "accessibilityLabel", v6, v7, v8, v9, v10, v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void __55__SFUnifiedBarItemViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "allTargets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
