@implementation CKTranscriptLabelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptLabelCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptLabelCell"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptLabelCell"), CFSTR("CKTranscriptCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptCell"), CFSTR("CKEditableCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEditableCollectionViewCell"), CFSTR("orientation"), "c", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptLabelCellAccessibility;
  -[CKTranscriptLabelCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[CKTranscriptLabelCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF67B0]);
  accessibilityLocalizedString(CFSTR("drop.into.compose"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:view:", v5, self);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityDropPointDescriptors:", v7);

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0]);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__CKTranscriptLabelCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_2501B24C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityHeadingLevelBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

uint64_t __80__CKTranscriptLabelCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  unsigned __int8 v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("orientation"));
  if (v2 > 2u)
    v3 = 0;
  else
    v3 = qword_2501B24E0[(char)v2];

  return v3;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptLabelCellAccessibility;
  -[CKTranscriptLabelCellAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CKTranscriptLabelCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

@end
