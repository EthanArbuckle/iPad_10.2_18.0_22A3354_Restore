@implementation VideosUI

uint64_t __62__VideosUI_MultiPlayerContainerViewAccessibility__axMultiView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349244BC](CFSTR("VideosUI.MultiPlayerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __74__VideosUI_MultiPlayerContainerViewAccessibility__axAllPlayerViewControls__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safeSwiftValueForKey:", CFSTR("playerViewController"));
}

uint64_t __75__VideosUI_MultiPlayerContainerViewAccessibility__axAllMultiviewContainers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VideosUI.MultiPlayerContainerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataCanonicalID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "safeSwiftStringForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VideosUI.StackCollectionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VUIStackingPosterView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x2349244BC](CFSTR("VideosUI.CardView"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "safeValueForKey:", CFSTR("textLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "safeIntegerForKey:", CFSTR("textStyle")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "safeValueForKey:", CFSTR("textLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "safeIntegerForKey:", CFSTR("textStyle")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "compare:", v10);
  return v11;
}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;
  char v6;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v6 = *(_BYTE *)(a1 + 40);
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDetailsViewControllerVisible:animated:completion:", *(_BYTE *)(a1 + 40) == 0, 0, 0);

}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 0;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "_axAVPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "removePlayerViewController:animated:completion:", v3, 0, 0);

}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 0;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "_axAVPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "enterFullscreenWithPlayerViewController:completion:", v3, 0);

}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_7(id *a1, void *a2)
{
  id v3;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  objc_copyWeak(&v5, a1 + 4);
  objc_copyWeak(&v6, a1 + 5);
  objc_copyWeak(&v7, a1 + 6);
  AXPerformSafeBlock();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 0;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_8(id *a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "_axAVPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(v3, "removePlayerViewController:animated:completion:", v7, 0, 0);

  v4 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(v4, "replacePlayerViewController:atIndex:animated:completion:", v7, 0, 0, 0);

  v5 = objc_loadWeakRetained(a1 + 5);
  v6 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v5, "addPlayerViewController:animated:completion:", v6, 0, 0);

}

id __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_314);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_4;
  v7[3] = &unk_2503D24E8;
  v8 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "ax_containsObjectUsingBlock:", v7);
  if (objc_msgSend(v2, "count") && (v3 & 1) == 0)
  {
    v4 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("multiview.game.removed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v6);

  }
}

uint64_t __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VideosUI.MultiPlayerContainerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "safeSwiftValueForKey:", CFSTR("playerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __76__VideosUI_CardViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __60__VideosUI_CardViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

  return 1;
}

uint64_t __60__VideosUI_CardViewAccessibility_accessibilityCustomActions__block_invoke_2()
{
  return 1;
}

uint64_t __52__VideosUI_CardViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  objc_msgSend(a2, "safeValueForKey:", CFSTR("textLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("textStyle"));

  objc_msgSend(v5, "safeValueForKey:", CFSTR("textLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("textStyle"));
  return objc_msgSend(*(id *)(a1 + 32), "_axCompareStyle:toStyle:", v7, v9);
}

BOOL __62__VideosUI_CardViewAccessibility_accessibilityUserInputLabels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("textLayout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("textStyle"));

  return (unint64_t)(v3 - 13) < 2;
}

uint64_t __62__VideosUI_CardViewAccessibility_accessibilityAttributedValue__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  char isKindOfClass;

  v4 = a2;
  MEMORY[0x2349244BC](CFSTR("_TVProgressView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a3 = 1;
  return isKindOfClass & 1;
}

uint64_t __51__VideosUI_CardViewAccessibility_accessibilityHint__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("newBannerAccessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_2503D28E0;
  v5 = *(_QWORD *)(a1 + 40);
  v11 = &v13;
  v12 = v5;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!objc_msgSend(v5, "isAccessibilityElement"))
      goto LABEL_7;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_6:
    *(_BYTE *)(v3 + 24) = 1;
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

LABEL_7:
}

uint64_t __82__VideosUI_EpicInlineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VideosUI.VerticalStackView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__VideosUI_EpicInlineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VUILabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __64__VideosUI_RootSideBarControllerAccessibility_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

uint64_t __64__VideosUI_RootSideBarControllerAccessibility_viewDidDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityLabel");
}

uint64_t __71__VideosUI_OfferListLockupCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 0x2000);

  return 1;
}

uint64_t __71__VideosUI_OfferListLockupCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 0x2000);

  return 1;
}

uint64_t __104__VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __67__VideosUI_LockupCollectionViewCellAccessibility_specialCharacters__block_invoke()
{
  void *v0;

  v0 = (void *)specialCharacters_specialCharacters;
  specialCharacters_specialCharacters = (uint64_t)&unk_2503DE210;

}

uint64_t __82__VideosUI_LockupCollectionViewCellAccessibility__accessibilityStackingPosterView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v2 = a2;
  v3 = (void *)StackingPosterViewSwiftClass___PosterClass;
  if (!StackingPosterViewSwiftClass___PosterClass)
  {
    v3 = (void *)MEMORY[0x2349244BC](CFSTR("VideosUI.StackingPosterView"));
    StackingPosterViewSwiftClass___PosterClass = (uint64_t)v3;
  }
  v4 = objc_retainAutorelease(v3);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = (void *)StackingPosterViewObjcClass___PosterClass;
    if (!StackingPosterViewObjcClass___PosterClass)
    {
      v6 = (void *)MEMORY[0x2349244BC](CFSTR("VUIStackingPosterView"));
      StackingPosterViewObjcClass___PosterClass = (uint64_t)v6;
    }
    v7 = objc_retainAutorelease(v6);
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __75__VideosUI_LockupCollectionViewCellAccessibility__accessibilityOverlayView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v2 = a2;
  v3 = (void *)UnifiedOverlayViewClass___PosterClass;
  if (!UnifiedOverlayViewClass___PosterClass)
  {
    v3 = (void *)MEMORY[0x2349244BC](CFSTR("VideosUI.UnifiedOverlayView"));
    UnifiedOverlayViewClass___PosterClass = (uint64_t)v3;
  }
  v4 = objc_retainAutorelease(v3);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = (void *)OverlayViewClass___PosterClass;
    if (!OverlayViewClass___PosterClass)
    {
      v6 = (void *)MEMORY[0x2349244BC](CFSTR("VideosUI.OverlayView"));
      OverlayViewClass___PosterClass = (uint64_t)v6;
    }
    v7 = objc_retainAutorelease(v6);
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __70__VideosUI_MultiPlayerGrabberViewAccessibility__axMultiviewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349244BC](CFSTR("VideosUI.MultiPlayerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __69__VideosUI_MultiPlayerGrabberViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDetailsViewControllerVisible:animated:completion:", *(_BYTE *)(a1 + 40) == 0, 0, 0);
}

double __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;

  return v3;
}

id __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("accessibilityTitleView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("accessibilitySubtitleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityFindSubviewDescendant:", &__block_literal_global_17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "sendActionsForControlEvents:", 64);

  return v3 != 0;
}

uint64_t __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VUIButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  int v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityHasDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VUIButton")));
  v3 = objc_msgSend(WeakRetained, "accessibilityTraits");
  v4 = (_QWORD *)MEMORY[0x24BDF73B0];
  if (!v2)
    v4 = (_QWORD *)MEMORY[0x24BDF73E0];
  v5 = *MEMORY[0x24BDF73C0] | v3 | *v4;

  return v5;
}

uint64_t __70__VideosUI_FloatingCardHostingCollectionViewCellAccessibility__axNode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("SwiftUI.AccessibilityNode"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__VideosUI_FloatingCardHostingCollectionViewCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
