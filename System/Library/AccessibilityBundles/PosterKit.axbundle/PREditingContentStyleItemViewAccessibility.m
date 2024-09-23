@implementation PREditingContentStyleItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingContentStyleItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingContentStyleItemView"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingContentStyleItemView"), CFSTR("contentStyleCoordinator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingPosterContentStyleCoordinator"), CFSTR("style"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRPosterContentDiscreteColorsStyle"), CFSTR("colors"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  PREditingContentStyleItemViewAccessibility *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __64__PREditingContentStyleItemViewAccessibility_accessibilityValue__block_invoke;
  v15 = &unk_25030BB10;
  v16 = self;
  v17 = &v18;
  AXPerformSafeBlock();
  v3 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[PREditingContentStyleItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentStyleCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("style"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("colors"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      AXColorStringForColor();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)PREditingContentStyleItemViewAccessibility;
      -[PREditingContentStyleItemViewAccessibility accessibilityValue](&v11, sel_accessibilityValue);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (id)v9;

  }
  return v4;
}

void __64__PREditingContentStyleItemViewAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingContentStyleItemViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PREditingContentStyleItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
