@implementation AVTStickerPagingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTStickerPagingController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerPagingController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("AVTStickerPagingController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AVTStickerPagingController"), CFSTR("AVTStickerSheetControllerDelegate"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("AVTStickerSheetControllerDelegate"), CFSTR("stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:"), 1, 1);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerPagingControllerAccessibility;
  -[AVTStickerPagingControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[AVTStickerPagingControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityContainerType:", 0);
  objc_msgSend(v4, "setAccessibilityShouldBypassCollectionViewAccessibility:", 1);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTStickerPagingControllerAccessibility;
  -[AVTStickerPagingControllerAccessibility loadView](&v3, sel_loadView);
  -[AVTStickerPagingControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)stickerSheetController:(id)a3 didInteractWithStickerItem:(id)a4 atIndex:(int64_t)a5 byPeeling:(BOOL)a6
{
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTStickerPagingControllerAccessibility;
  -[AVTStickerPagingControllerAccessibility stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:](&v8, sel_stickerSheetController_didInteractWithStickerItem_atIndex_byPeeling_, a3, a4, a5, a6);
  v6 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("announcement.selected.sticker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v6, v7);

}

@end
