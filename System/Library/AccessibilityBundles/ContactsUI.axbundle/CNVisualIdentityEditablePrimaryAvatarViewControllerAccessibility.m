@implementation CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNVisualIdentityEditablePrimaryAvatarViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerProviderItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerEmojiProviderItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerMonogramProviderItem"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPhotoPickerEmojiProviderItem"), CFSTR("CNPhotoPickerProviderItem"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPhotoPickerMonogramProviderItem"), CFSTR("CNPhotoPickerProviderItem"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CNPhotoPickerEmojiProviderItem"), CFSTR("CNVisualIdentityPickerTextEditableProviderItem"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CNPhotoPickerMonogramProviderItem"), CFSTR("CNVisualIdentityPickerTextEditableProviderItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityEditablePrimaryAvatarViewController"), CFSTR("providerItem"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CNVisualIdentityPickerTextEditableProviderItem"), CFSTR("backgroundColor"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNVisualIdentityEditablePrimaryAvatarViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityEditablePrimaryAvatarViewController"), CFSTR("textField"), "@", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility;
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("providerItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility _axUpdateTextFieldWithProviderItem:](self, "_axUpdateTextFieldWithProviderItem:", v4);

}

- (void)updateWithProviderItem:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility;
  v4 = a3;
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility updateWithProviderItem:](&v5, sel_updateWithProviderItem_, v4);
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility _axUpdateTextFieldWithProviderItem:](self, "_axUpdateTextFieldWithProviderItem:", v4, v5.receiver, v5.super_class);

}

- (void)_axUpdateTextFieldWithProviderItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _BYTE v13[12];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MEMORY[0x23490B8BC](CFSTR("CNVisualIdentityPickerTextEditableProviderItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToProtocol:", v5);

  v13[0] = 0;
  objc_opt_class();
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_axSetIsTextEditable:", v6);
  if ((_DWORD)v6)
  {
    v13[0] = 0;
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("backgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogTemp();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 138412290;
      *(_QWORD *)&v13[4] = v10;
      _os_log_impl(&dword_23255C000, v11, OS_LOG_TYPE_INFO, "Color: %@", v13, 0xCu);
    }

    if (v10)
      AXColorStringForColor();
    else
      accessibilityLocalizedString(CFSTR("default.background.color"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_axSetColorName:", v12, *(_QWORD *)v13);

  }
  MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerEmojiProviderItem"));
  objc_msgSend(v8, "_axSetIsEmoji:", objc_opt_isKindOfClass() & 1);

}

@end
