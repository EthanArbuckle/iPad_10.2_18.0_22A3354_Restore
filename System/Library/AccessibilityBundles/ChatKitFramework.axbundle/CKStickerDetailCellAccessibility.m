@implementation CKStickerDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKStickerDetailCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_axStickerDescription
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetStickerDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKStickerDetailCell"), CFSTR("senderLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKStickerDetailCell"), CFSTR("stickerPackLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKStickerDetailCell"), CFSTR("timestampLabel"), "@", 0);

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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[CKStickerDetailCellAccessibility _axStickerDescription](self, "_axStickerDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[CKStickerDetailCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("senderLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("message.from.format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CKStickerDetailCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stickerPackLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CKStickerDetailCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timestampLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CKStickerDetailCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  v5 = objc_alloc(MEMORY[0x24BDF6788]);
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __62__CKStickerDetailCellAccessibility_accessibilityCustomActions__block_invoke;
  v13 = &unk_2501B1D80;
  objc_copyWeak(&v14, &location);
  v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &v10);

  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __62__CKStickerDetailCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 0x2000);

  return 1;
}

@end
