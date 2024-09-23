@implementation CNSharingProfilePhotoPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNSharingProfilePhotoPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNSharingProfilePhotoPickerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNSharingProfilePhotoPickerViewController"), CFSTR("previewView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNSharingProfilePhotoPickerViewController"), CFSTR("selectedItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNSharingProfilePhotoPickerViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNSharingProfilePhotoPickerItemCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNSharingProfilePhotoPickerItemCell"), CFSTR("pickerItem"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNSharingProfilePhotoPickerItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNSharingProfilePhotoPickerItem"), CFSTR("avatarItem"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfilePhotoPickerViewControllerAccessibility;
  -[CNSharingProfilePhotoPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[CNSharingProfilePhotoPickerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("previewView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("preview.image.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __100__CNSharingProfilePhotoPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2501D8408;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

id __100__CNSharingProfilePhotoPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("selectedItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("avatarItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNSharingProfilePhotoPickerViewControllerAccessibility;
  -[CNSharingProfilePhotoPickerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CNSharingProfilePhotoPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id from;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNSharingProfilePhotoPickerViewControllerAccessibility;
  -[CNSharingProfilePhotoPickerViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v18, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
  v13[3] = &unk_2501D8478;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  objc_msgSend(v8, "_setAccessibilityTraitsBlock:", v13);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v11[3] = &unk_2501D8408;
  objc_copyWeak(&v12, &from);
  objc_msgSend(v8, "_setAccessibilityLabelBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *MEMORY[0x24BDF73B0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("selectedItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "safeValueForKey:", CFSTR("pickerItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x24BDF7400];
  if (v6 != v4)
    v7 = 0;
  v8 = v7 | v2;

  return v8;
}

id __96__CNSharingProfilePhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("pickerItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeStringForKey:", CFSTR("symbolImageName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ellipsis")))
  {
    accessibilityLocalizedString(CFSTR("more.button.label"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("avatarItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
