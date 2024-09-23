@implementation MFPhotoPickerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFPhotoPickerController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFPhotoPickerController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFPhotoPickerController"), CFSTR("photosFetchResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFPhotoPickerController"), CFSTR("close:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UICollectionViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFPhotoPickerController"), CFSTR("UICollectionViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFPhotoPickerControllerAccessibility;
  -[MFPhotoPickerControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF73C0];
  objc_msgSend(v2, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", v3);

  UIKitAccessibilityLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v6);

}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __66__MFPhotoPickerControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close:", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFPhotoPickerControllerAccessibility;
  -[MFPhotoPickerControllerAccessibility collectionView:cellForItemAtIndexPath:](&v15, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[MFPhotoPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photosFetchResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v12);

  objc_msgSend(v11, "accessibilityCustomContent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityCustomContent:", v13);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPhotoPickerControllerAccessibility;
  -[MFPhotoPickerControllerAccessibility viewDidLoad](&v7, sel_viewDidLoad);
  -[MFPhotoPickerControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF72C8];
  objc_msgSend(v3, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

@end
