@implementation SFStartPageBackgroundImageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFStartPageBackgroundImageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SFStartPageCustomizationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageCustomizationViewController"), CFSTR("_backgroundImagesCollectionViewDataSource"), "UICollectionViewDiffableDataSource");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStartPageBackgroundImageCell"), CFSTR("showsSelectionRing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStartPageBackgroundImageCell"), CFSTR("showsCustomImageControls"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStartPageBackgroundImageCell"), CFSTR("didSelectClearButton:"), "v", "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFStartPageBackgroundImageCellAccessibility;
  -[SFStartPageBackgroundImageCellAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageBackgroundImageCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageBackgroundImageCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MEMORY[0x23491571C](CFSTR("SFStartPageCustomizationViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("_backgroundImagesCollectionViewDataSource"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFStartPageBackgroundImageCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemIdentifierForIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessibilityLabel");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = (void *)v11;
      else
        v13 = v3;
      v14 = v13;

      v3 = v14;
    }
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0];
  v3 = -[SFStartPageBackgroundImageCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsSelectionRing"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v2 | v4;
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFStartPageBackgroundImageCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsCustomImageControls")))
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityMobileSafariLocalizedString(CFSTR("clear.background.image.button"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __73__SFStartPageBackgroundImageCellAccessibility_accessibilityCustomActions__block_invoke;
    v11 = &unk_250296978;
    objc_copyWeak(&v12, &location);
    v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, &v8);

    objc_msgSend(v3, "addObject:", v6, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __73__SFStartPageBackgroundImageCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __73__SFStartPageBackgroundImageCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didSelectClearButton:", 0);

}

@end
