@implementation CanvasElementContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PaperKit.CanvasElementContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PPKMarkupContainerViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PaperKit.MarkupContainerViewController"), CFSTR("editingMode"), "CanvasEditingMode");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("canvas"));
}

- (unint64_t)accessibilityDirectTouchOptions
{
  return 2;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  -[CanvasElementContainerViewAccessibility markupController](self, "markupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("editingMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PaperKit.CanvasEditingMode.allowsAll")))
  {
    v6 = (id)*MEMORY[0x24BDF73A8];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CanvasElementContainerViewAccessibility;
    v6 = -[CanvasElementContainerViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  }

  return (unint64_t)v6;
}

- (id)markupController
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__CanvasElementContainerViewAccessibility_markupController__block_invoke;
  v5[3] = &unk_2502E2468;
  v5[4] = &v6;
  v2 = (id)-[CanvasElementContainerViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", v5, 0);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __59__CanvasElementContainerViewAccessibility_markupController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349189E8](CFSTR("PPKMarkupContainerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);

  return isKindOfClass & 1;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CanvasElementContainerViewAccessibility;
    -[CanvasElementContainerViewAccessibility automationElements](&v8, sel_automationElements);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
