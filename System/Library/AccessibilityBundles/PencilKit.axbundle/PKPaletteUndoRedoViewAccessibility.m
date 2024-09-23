@implementation PKPaletteUndoRedoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteUndoRedoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteUndoRedoView"), CFSTR("undoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteUndoRedoView"), CFSTR("redoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteButton"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaletteButton"), CFSTR("UIControl"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaletteUndoRedoViewAccessibility;
  -[PKPaletteUndoRedoViewAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaletteUndoRedoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("undoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12[3] = &unk_2502F5DF8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v12);
  accessibilityPencilKitLocalizedString(CFSTR("palette.undo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  -[PKPaletteUndoRedoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("redoButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  accessibilityPencilKitLocalizedString(CFSTR("palette.redo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v10[3] = &unk_2502F5DF8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "_setAccessibilityTraitsBlock:", v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("undoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  v6 = objc_msgSend(v4, "isEnabled");
  v7 = (_QWORD *)MEMORY[0x24BDF73E0];
  if (!v6)
    v7 = (_QWORD *)MEMORY[0x24BDF73E8];
  v8 = *v7 | v5;

  return v8;
}

uint64_t __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("redoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  v6 = objc_msgSend(v4, "isEnabled");
  v7 = (_QWORD *)MEMORY[0x24BDF73E0];
  if (!v6)
    v7 = (_QWORD *)MEMORY[0x24BDF73E8];
  v8 = *v7 | v5;

  return v8;
}

- (PKPaletteUndoRedoViewAccessibility)initWithFrame:(CGRect)a3
{
  PKPaletteUndoRedoViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaletteUndoRedoViewAccessibility;
  v3 = -[PKPaletteUndoRedoViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKPaletteUndoRedoViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
