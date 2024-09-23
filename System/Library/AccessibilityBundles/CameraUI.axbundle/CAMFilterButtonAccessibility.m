@implementation CAMFilterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFilterButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMFilterButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_effectFilterTypeForMode:"), "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CAMEffectFilterManager"), CFSTR("displayNameForType:"), "@", "q", 0);

}

- (id)accessibilityIdentifier
{
  return CFSTR("Filters");
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("filter.button"));
}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(CFSTR("filter.button.hint"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;

  -[CAMFilterButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMViewfinderView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("_currentMode"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __50__CAMFilterButtonAccessibility_accessibilityValue__block_invoke;
  v19 = &unk_24FEE07C0;
  v21 = &v10;
  v6 = v4;
  v20 = v6;
  v22 = v5;
  AXPerformSafeBlock();
  v7 = v11[3];

  _Block_object_dispose(&v10, 8);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || !v6)
  {
    accessibilityCameraKitLocalizedString(CFSTR("no.selected.filter"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__7;
    v14 = __Block_byref_object_dispose__7;
    v15 = 0;
    AXPerformSafeBlock();
    v8 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v8;
}

uint64_t __50__CAMFilterButtonAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_effectFilterTypeForMode:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __50__CAMFilterButtonAccessibility_accessibilityValue__block_invoke_222(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)MEMORY[0x2348BFB60](CFSTR("CAMEffectFilterManager")), "displayNameForType:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
