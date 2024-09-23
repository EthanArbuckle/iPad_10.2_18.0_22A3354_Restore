@implementation AmbientCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.AmbientCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.AmbientCollectionViewCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PREditingHideButton"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.AmbientCollectionViewCell"), CFSTR("hideOrDeleteButton"), "Optional<PREditingCloseBoxButton>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.AmbientCollectionViewCell"), CFSTR("editingButton"), "Optional<UIButton>");
  objc_msgSend(v3, "validateClass:", CFSTR("PREditingHideButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PREditingHideButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.AmbientCollectionViewCell"), CFSTR("ambientPosterViewController"), "Optional<PRUISAmbientPosterViewController>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PRUISAmbientPosterViewController"), CFSTR("_configuration"), "PRSPosterConfiguration");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRSPosterConfiguration"), CFSTR("providerBundleIdentifier"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id from;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AmbientCollectionViewCellAccessibility;
  -[AmbientCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v30, sel__accessibilityLoadAccessibilityInformation);
  -[AmbientCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("hideOrDeleteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v4 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v25[3] = &unk_2503080B8;
  objc_copyWeak(&v26, &from);
  objc_copyWeak(&v27, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v25);
  -[AmbientCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("editingButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AmbientCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("ambientPosterViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = v4;
  v14 = 3221225472;
  v15 = __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_207;
  v16 = &unk_2503080E0;
  v18 = &v19;
  v8 = v7;
  v17 = v8;
  AXPerformSafeBlock();
  v9 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v11[3] = &unk_250308108;
  v10 = v9;
  v12 = v10;
  objc_msgSend(v5, "setAccessibilityLabelBlock:", v11);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

id __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "axSetHideOrDeleteButtonLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_207(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "providerBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  __CFString *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider")))v1 = CFSTR("people.picker");
  else
    v1 = CFSTR("standby.color.picker");
  accessibilityLocalizedString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)axSetHideOrDeleteButtonLabel:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  char isKindOfClass;
  const __CFString *v8;
  int v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[AmbientCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("posterModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeSwiftStringForKey:", CFSTR("localizedTitle"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x23491A0AC](CFSTR("PREditingHideButton"));
  isKindOfClass = objc_opt_isKindOfClass();
  if (v6)
    v8 = v6;
  else
    v8 = &stru_250308B10;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isSelected"));
    v10 = (void *)MEMORY[0x24BDD17C8];
    if (v9)
      v11 = CFSTR("editing.unhide.button.label");
    else
      v11 = CFSTR("editing.hide.button.label");
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = CFSTR("editing.minus.close.button.label");
  }
  accessibilityLocalizedString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AmbientCollectionViewCellAccessibility;
  -[AmbientCollectionViewCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[AmbientCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
