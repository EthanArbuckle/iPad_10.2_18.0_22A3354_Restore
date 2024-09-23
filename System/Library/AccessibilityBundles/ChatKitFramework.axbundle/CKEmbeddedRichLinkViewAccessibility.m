@implementation CKEmbeddedRichLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.CKEmbeddedRichLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKEmbeddedRichLinkView"), CFSTR("pluginEntryViewController"), "Optional<CKDefaultPluginEntryViewController>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDefaultPluginEntryViewController"), CFSTR("balloonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ChatKit.CKEmbeddedRichLinkView"), CFSTR("didTapDiscardButton"), "v", 0);

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
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[CKEmbeddedRichLinkViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("pluginEntryViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("balloonView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKEmbeddedRichLinkViewAccessibility;
    -[CKEmbeddedRichLinkViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)CKEmbeddedRichLinkViewAccessibility;
  -[CKEmbeddedRichLinkViewAccessibility accessibilityCustomActions](&v15, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("delete.button.label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __65__CKEmbeddedRichLinkViewAccessibility_accessibilityCustomActions__block_invoke;
  v12 = &unk_2501B1D80;
  objc_copyWeak(&v13, &location);
  v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &v9);

  objc_msgSend(v3, "axSafelyAddObject:", v7, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __65__CKEmbeddedRichLinkViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __65__CKEmbeddedRichLinkViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapDiscardButton");
}

@end
