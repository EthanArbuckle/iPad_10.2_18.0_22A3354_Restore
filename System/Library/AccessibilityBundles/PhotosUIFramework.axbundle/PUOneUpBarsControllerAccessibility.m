@implementation PUOneUpBarsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUOneUpBarsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUScrubberView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpBarsController"), CFSTR("browsingSession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpBarsController"), CFSTR("_scrubberView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingSession"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetViewModel"), CFSTR("isFavorite"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetViewModel"), CFSTR("isAccessoryViewVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpBarsController"), CFSTR("_newBarButtonItemWithIdentifier: location:"), "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpBarsController"), CFSTR("_activeBarButtonItemForIdentifier:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpBarsController"), CFSTR("_handleFavoriteButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("assetViewModelForAssetReference:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("currentAssetReference"), "@", 0);

}

- (id)_axAssetViewModel
{
  void *v2;
  void *v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[PUOneUpBarsControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("browsingSession.viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("currentAssetReference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = v2;
  v7 = v3;
  AXPerformSafeBlock();
  v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __55__PUOneUpBarsControllerAccessibility__axAssetViewModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_axIsFavorite
{
  void *v2;
  char v3;

  -[PUOneUpBarsControllerAccessibility _axAssetViewModel](self, "_axAssetViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isFavorite"));

  return v3;
}

- (BOOL)_axDetailsShowing
{
  void *v2;
  char v3;

  -[PUOneUpBarsControllerAccessibility _axAssetViewModel](self, "_axAssetViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isAccessoryViewVisible"));

  return v3;
}

- (void)_axLoadFavoriteButtonAccessibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *(*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  accessibilityPULocalizedString(CFSTR("photo.favorite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __73__PUOneUpBarsControllerAccessibility__axLoadFavoriteButtonAccessibility___block_invoke;
  v10 = &unk_24FF15050;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", &v7);
  accessibilityPULocalizedString(CFSTR("photo.favorite.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v6, v7, v8, v9, v10);

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDFF0C8]);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

__CFString *__73__PUOneUpBarsControllerAccessibility__axLoadFavoriteButtonAccessibility___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_axIsFavorite"))
    v2 = CFSTR("1");
  else
    v2 = CFSTR("0");
  v3 = v2;

  return v3;
}

- (void)_axLoadLikeButtonAccessibility:(id)a3 identifier:(int64_t)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;

  v5 = AXIsPhotoSharingLikeButtonKey;
  v6 = a3;
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], v5);
  accessibilityPULocalizedString(CFSTR("shared.photo.like"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  accessibilityPULocalizedString(CFSTR("shared.photo.like.hint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityHint:", v8);

  if (a4 == 19)
    v9 = CFSTR("shared.photo.like.value.like");
  else
    v9 = CFSTR("shared.photo.like.value.liked");
  accessibilityPULocalizedString(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityValue:", v10);

}

- (void)_axLoadEditButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.edit"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axLoadDetailsButtonAccessibility:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PUOneUpBarsControllerAccessibility _axDetailsShowing](self, "_axDetailsShowing"))
  {
    v4 = objc_msgSend(v8, "accessibilityTraits");
    v5 = *MEMORY[0x24BDF7400] | v4;
  }
  else
  {
    v6 = *MEMORY[0x24BDF7400];
    v5 = objc_msgSend(v8, "accessibilityTraits") & ~v6;
  }
  objc_msgSend(v8, "setAccessibilityTraits:", v5);
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  accessibilityPULocalizedString(CFSTR("photo.info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v7);

}

- (void)_axLoadAirplayButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.airplay"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axLoadBackButtonWithNoTitleAccessibility:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BEBB100] | v3);

}

- (void)_axLoadDoneButtonAccessibility:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BEBB100] | v3);

}

- (void)_axLoadShareButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.share"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axLoadDeleteButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.delete"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axLoadRewindButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.rewind"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axLoadMuteButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.volume.button"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axLoadUnmuteButtonAccessibility:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityPULocalizedString(CFSTR("photo.volume.muted.button"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUOneUpBarsControllerAccessibility;
  -[PUOneUpBarsControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  AXPerformSafeBlock();
}

void __80__PUOneUpBarsControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
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
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadFavoriteButtonAccessibility:", v14);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadLikeButtonAccessibility:identifier:", v13, 19);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadLikeButtonAccessibility:identifier:", v12, 20);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadEditButtonAccessibility:", v11);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadAirplayButtonAccessibility:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadBackButtonWithNoTitleAccessibility:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadDoneButtonAccessibility:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadShareButtonAccessibility:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadDeleteButtonAccessibility:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadDeleteButtonAccessibility:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadMuteButtonAccessibility:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadUnmuteButtonAccessibility:", v9);
  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadDetailsButtonAccessibility:", v10);

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  -[PUOneUpBarsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("__scrubberView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  NSClassFromString(CFSTR("PUScrubberView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v6 = v5;
  v7 = v6;
  if (a3 == 1)
  {
    v8 = objc_msgSend(v6, "_axDecrementForThreeFingerScroll");
    goto LABEL_7;
  }
  if (a3 != 2)
  {

LABEL_9:
    v11.receiver = self;
    v11.super_class = (Class)PUOneUpBarsControllerAccessibility;
    v9 = -[PUOneUpBarsControllerAccessibility accessibilityScroll:](&v11, sel_accessibilityScroll_, a3);
    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "_axIncrementForThreeFingerScroll");
LABEL_7:
  v9 = v8;

LABEL_10:
  return v9;
}

- (id)_newBarButtonItemWithIdentifier:(int64_t)a3 location:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUOneUpBarsControllerAccessibility;
  v6 = -[PUOneUpBarsControllerAccessibility _newBarButtonItemWithIdentifier:location:](&v9, sel__newBarButtonItemWithIdentifier_location_, a3, a4);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    -[PUOneUpBarsControllerAccessibility _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpBarsControllerAccessibility _axLoadFavoriteButtonAccessibility:](self, "_axLoadFavoriteButtonAccessibility:", v7);

  }
  else if ((unint64_t)(a3 - 19) > 1)
  {
    if (a3 <= 9)
    {
      if (a3 == 1)
      {
        -[PUOneUpBarsControllerAccessibility _axLoadEditButtonAccessibility:](self, "_axLoadEditButtonAccessibility:", v6);
        return v6;
      }
      if (a3 == 6)
      {
        -[PUOneUpBarsControllerAccessibility _axLoadShareButtonAccessibility:](self, "_axLoadShareButtonAccessibility:", v6);
        return v6;
      }
    }
    else
    {
      switch(a3)
      {
        case 10:
          -[PUOneUpBarsControllerAccessibility _axLoadDoneButtonAccessibility:](self, "_axLoadDoneButtonAccessibility:", v6);
          return v6;
        case 18:
          -[PUOneUpBarsControllerAccessibility _axLoadAirplayButtonAccessibility:](self, "_axLoadAirplayButtonAccessibility:", v6);
          return v6;
        case 31:
          -[PUOneUpBarsControllerAccessibility _axLoadBackButtonWithNoTitleAccessibility:](self, "_axLoadBackButtonWithNoTitleAccessibility:", v6);
          return v6;
      }
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[PUOneUpBarsControllerAccessibility _axLoadDeleteButtonAccessibility:](self, "_axLoadDeleteButtonAccessibility:", v6);
    }
    else
    {
      switch(a3)
      {
        case '&':
          -[PUOneUpBarsControllerAccessibility _axLoadDetailsButtonAccessibility:](self, "_axLoadDetailsButtonAccessibility:", v6);
          break;
        case '$':
          -[PUOneUpBarsControllerAccessibility _axLoadUnmuteButtonAccessibility:](self, "_axLoadUnmuteButtonAccessibility:", v6);
          break;
        case '#':
          -[PUOneUpBarsControllerAccessibility _axLoadMuteButtonAccessibility:](self, "_axLoadMuteButtonAccessibility:", v6);
          break;
      }
    }
  }
  else
  {
    -[PUOneUpBarsControllerAccessibility _axLoadLikeButtonAccessibility:identifier:](self, "_axLoadLikeButtonAccessibility:identifier:", v6, a3);
  }
  return v6;
}

- (void)_handleFavoriteButton:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsControllerAccessibility;
  -[PUOneUpBarsControllerAccessibility _handleFavoriteButton:](&v3, sel__handleFavoriteButton_, a3);
  AXPerformSafeBlock();
}

void __60__PUOneUpBarsControllerAccessibility__handleFavoriteButton___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_activeBarButtonItemForIdentifier:", 7);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadFavoriteButtonAccessibility:", v2);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
