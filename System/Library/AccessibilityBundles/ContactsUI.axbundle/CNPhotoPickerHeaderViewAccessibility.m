@implementation CNPhotoPickerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("clearAvatarImageButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("didMoveToWindow"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("didTapClearAvatarImageButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("identityNameTextField"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNVisualIdentity"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("visualIdentity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentity"), CFSTR("canUpdateGroupName"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNVisualIdentityAvatarViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("avatarViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerHeaderView"), CFSTR("setClearAvatarImageButtonHidden:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNVisualIdentityAvatarViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityAvatarViewController"), CFSTR("badgeImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityAvatarViewController"), CFSTR("contentView"), "@", 0);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  -[CNPhotoPickerHeaderViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CNPhotoPickerHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
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
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  char v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  -[CNPhotoPickerHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v30, sel__accessibilityLoadAccessibilityInformation);
  -[CNPhotoPickerHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearAvatarImageButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("clear.image.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[CNPhotoPickerHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visualIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "safeBoolForKey:", CFSTR("canUpdateGroupName")) & 1) == 0)
  {
    -[CNPhotoPickerHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("identityNameTextField"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilitySetIdentification:", kAXPhotosTextFieldIdentifier);

  }
  v29 = 0;
  objc_opt_class();
  -[CNPhotoPickerHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatarViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsAccessibilityElement:", 1);
    objc_msgSend(v9, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
    objc_msgSend(v5, "safeStringForKey:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("person.photo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityLabel:", v13);

    }
    else
    {
      accessibilityLocalizedString(CFSTR("person.photo.unknown"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityLabel:", v12);
    }

    v29 = 0;
    objc_opt_class();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("badgeImageView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeValueForKey:", CFSTR("_imageAsset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeStringForKey:", CFSTR("assetName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v27[3] = &unk_2501D8320;
    v20 = v18;
    v28 = v20;
    objc_msgSend(v15, "_setIsAccessibilityElementBlock:", v27);
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v25[3] = &unk_2501D84C8;
    v21 = v20;
    v26 = v21;
    objc_msgSend(v15, "_setAccessibilityLabelBlock:", v25);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v23[3] = &unk_2501D84F0;
    v24 = v21;
    v22 = v21;
    objc_msgSend(v15, "_setAccessibilityTraitsBlock:", v23);

  }
}

uint64_t __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("xmark.circle.fill"));
}

id __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("xmark.circle.fill")))
  {
    accessibilityLocalizedString(CFSTR("clear.image.button"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

uint64_t __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("xmark.circle.fill"));
  v2 = MEMORY[0x24BDF73B0];
  if (!v1)
    v2 = MEMORY[0x24BDF73E0];
  return *(_QWORD *)v2;
}

- (void)didTapClearAvatarImageButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  -[CNPhotoPickerHeaderViewAccessibility didTapClearAvatarImageButton](&v2, sel_didTapClearAvatarImageButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setClearAvatarImageButtonHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  -[CNPhotoPickerHeaderViewAccessibility setClearAvatarImageButtonHidden:](&v4, sel_setClearAvatarImageButtonHidden_, a3);
  -[CNPhotoPickerHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
