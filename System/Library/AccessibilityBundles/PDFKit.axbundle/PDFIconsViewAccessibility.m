@implementation PDFIconsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PDFIconsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFIconsView"), CFSTR("_updateScrubberForPageIndex:goToPage:"), "v", "i", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PDFThumbnailView"));

}

- (id)_accessibilityAnnouncementTimer
{
  JUMPOUT(0x2349187C4);
}

- (void)_accessibilitySetAnnouncementTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_updateScrubberForPageIndex:(int)a3 goToPage:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PDFIconsViewAccessibility;
  -[PDFIconsViewAccessibility _updateScrubberForPageIndex:goToPage:](&v14, sel__updateScrubberForPageIndex_goToPage_, *(_QWORD *)&a3, a4);
  -[PDFIconsViewAccessibility _accessibilityAnnouncementTimer](self, "_accessibilityAnnouncementTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE005F0]);
    v5 = (void *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[PDFIconsViewAccessibility _accessibilitySetAnnouncementTimer:](self, "_accessibilitySetAnnouncementTimer:", v5);
  }
  -[PDFIconsViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__PDFIconsViewAccessibility__updateScrubberForPageIndex_goToPage___block_invoke_2;
  v10[3] = &unk_2502DF178;
  objc_copyWeak(&v12, &location);
  v9 = v8;
  v11 = v9;
  objc_msgSend(v5, "afterDelay:processBlock:", v10, 0.1);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

uint64_t __66__PDFIconsViewAccessibility__updateScrubberForPageIndex_goToPage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234918584](CFSTR("PDFThumbnailView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __66__PDFIconsViewAccessibility__updateScrubberForPageIndex_goToPage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id argument;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accessibilityValue");
  argument = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(argument, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);

}

@end
