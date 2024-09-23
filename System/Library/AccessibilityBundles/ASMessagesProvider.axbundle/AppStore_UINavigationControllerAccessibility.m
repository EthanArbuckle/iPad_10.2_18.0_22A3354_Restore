@implementation AppStore_UINavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationController"), CFSTR("_navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:"), "{CGSize=dd}", "@", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationController"), CFSTR("_heightRangeOfTopViews"), "{?=ddd}", 0);

}

- (CGSize)_navigationBarSizeForViewController:(id)a3 proposedHeight:(double)a4 allowRubberBandStretch:(BOOL)a5
{
  double v5;
  double v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CGSize result;

  v7 = a5;
  v10 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
    goto LABEL_9;
  objc_opt_class();
  -[AppStore_UINavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_heightRangeOfTopViews"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x3810000000;
  v38 = &unk_2323861B2;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  if (!v12)
    goto LABEL_8;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __122__AppStore_UINavigationControllerAccessibility__navigationBarSizeForViewController_proposedHeight_allowRubberBandStretch___block_invoke;
  v27 = &unk_250134178;
  v13 = v12;
  v28 = v13;
  v29 = &v35;
  v30 = &v31;
  AXPerformSafeBlock();
  v14 = *((unsigned __int8 *)v32 + 24);
  if (*((_BYTE *)v32 + 24))
  {
    v15 = v36[6];
    v23.receiver = self;
    v23.super_class = (Class)AppStore_UINavigationControllerAccessibility;
    -[AppStore_UINavigationControllerAccessibility _navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:](&v23, sel__navigationBarSizeForViewController_proposedHeight_allowRubberBandStretch_, v10, v7, v15);
    v5 = v16;
    v6 = v17;
  }

  _Block_object_dispose(&v31, 8);
  if (!v14)
  {
LABEL_8:
    _Block_object_dispose(&v35, 8);

LABEL_9:
    v22.receiver = self;
    v22.super_class = (Class)AppStore_UINavigationControllerAccessibility;
    -[AppStore_UINavigationControllerAccessibility _navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:](&v22, sel__navigationBarSizeForViewController_proposedHeight_allowRubberBandStretch_, v10, v7, a4);
    v5 = v18;
    v6 = v19;
    goto LABEL_10;
  }
  _Block_object_dispose(&v35, 8);

LABEL_10:
  v20 = v5;
  v21 = v6;
  result.height = v21;
  result.width = v20;
  return result;
}

@end
