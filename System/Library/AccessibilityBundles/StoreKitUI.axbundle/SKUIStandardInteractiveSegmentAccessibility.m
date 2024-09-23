@implementation SKUIStandardInteractiveSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIStandardInteractiveSegment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SKUIInteractiveSegmentedControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIInteractiveSegmentedControl"), CFSTR("segments"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIInteractiveSegmentedControl"), CFSTR("selectedSegmentIndexForSelectionProgress:"), "q", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStandardInteractiveSegment"), CFSTR("attributedTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIInteractiveSegmentedControl"), CFSTR("_selectionProgress"), "d");

}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[SKUIStandardInteractiveSegmentAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("SKUIInteractiveSegmentedControl")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("segments"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "indexOfObject:", self);
    v8 = objc_msgSend(v6, "count");

  }
  else
  {
    v8 = 0;
    v7 = 0x7FFFFFFFLL;
  }

  v9 = v7;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
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

  objc_opt_class();
  -[SKUIStandardInteractiveSegmentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *MEMORY[0x24BDF73B0];
  -[SKUIStandardInteractiveSegmentAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("SKUIInteractiveSegmentedControl")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("segments"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v12 = MEMORY[0x24BDAC760];
    v13 = v5;
    AXPerformSafeBlock();
    v8 = v15[3];

    _Block_object_dispose(&v14, 8);
    v9 = objc_msgSend(v7, "indexOfObject:", self, v12, 3221225472, __66__SKUIStandardInteractiveSegmentAccessibility_accessibilityTraits__block_invoke, &unk_24FF2BDC8);
    v10 = *MEMORY[0x24BDF7400];
    if (v8 != v9)
      v10 = 0;
    v3 |= v10;

  }
  return v3;
}

uint64_t __66__SKUIStandardInteractiveSegmentAccessibility_accessibilityTraits__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeDoubleForKey:", CFSTR("_selectionProgress"));
  result = objc_msgSend(v2, "selectedSegmentIndexForSelectionProgress:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
