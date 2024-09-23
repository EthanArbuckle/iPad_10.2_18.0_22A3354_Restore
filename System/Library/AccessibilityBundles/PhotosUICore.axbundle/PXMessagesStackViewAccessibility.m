@implementation PXMessagesStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXMessagesStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXMessagesStackPlaybackControlView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXBaseMessagesStackView"), CFSTR("layout"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXMessagesStackView"), CFSTR("PXBaseMessagesStackView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXMessagesStackView"), CFSTR("currentAssetReference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXMessagesStackItemsLayout"), CFSTR("primaryItemIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXAssetReference"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXMessagesStackItemsLayout"), CFSTR("stackedItemsCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXMessagesStackPlaybackControlView"), CFSTR("_button"), "_PXMessagesStackPlayButton");

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[PXMessagesStackViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXMessagesStackViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[PXMessagesStackViewAccessibility _accessibilityCurrentIndex](self, "_accessibilityCurrentIndex") + 1;
    -[PXMessagesStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("stackedItemsCount"));

    if (-[PXMessagesStackViewAccessibility _accessibilityPlaybackStyle](self, "_accessibilityPlaybackStyle") == 4)
      v8 = CFSTR("photo.label.type.video");
    else
      v8 = CFSTR("photo.label.type.image");
    accessibilityPhotoLibraryServicesLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPhotosUICoreLocalizedString(CFSTR("messages.attachment.stack.view.format"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v5, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)accessibilityIncrement
{
  AXPerformSafeBlock();
}

uint64_t __58__PXMessagesStackViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollToIndex:animated:", objc_msgSend(*(id *)(a1 + 32), "_accessibilityCurrentIndex") + 1, 1);
}

- (void)accessibilityDecrement
{
  AXPerformSafeBlock();
}

uint64_t __58__PXMessagesStackViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollToIndex:animated:", objc_msgSend(*(id *)(a1 + 32), "_accessibilityCurrentIndex") - 1, 1);
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  v12.receiver = self;
  v12.super_class = (Class)PXMessagesStackViewAccessibility;
  -[PXMessagesStackViewAccessibility accessibilityActivationPoint](&v12, sel_accessibilityActivationPoint);
  v4 = v3;
  v6 = v5;
  if (-[PXMessagesStackViewAccessibility _accessibilityPlaybackStyle](self, "_accessibilityPlaybackStyle") == 4)
  {
    -[PXMessagesStackViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    v8 = (v6 - v7) * 0.5;
    -[PXMessagesStackViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    v6 = v9 + v8;
  }
  v10 = v4;
  v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)accessibilityCustomActions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityPhotosUICoreLocalizedString(CFSTR("memory.video.play"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__PXMessagesStackViewAccessibility_accessibilityCustomActions__block_invoke;
  v7[3] = &unk_24FF06AE8;
  objc_copyWeak(&v8, &location);
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v7);

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

uint64_t __62__PXMessagesStackViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityDescendantOfType:", MEMORY[0x2348C1678](CFSTR("PXMessagesStackPlaybackControlView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("_button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v9 = v5;
  v10 = v6;
  AXPerformSafeBlock();
  v7 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __62__PXMessagesStackViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  AX_CGRectGetCenter();
  result = objc_msgSend(v2, "handleTapAtPoint:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)_accessibilityPlaybackStyle
{
  void *v2;
  int64_t v3;

  -[PXMessagesStackViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("currentAssetReference.asset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("playbackStyle"));

  return v3;
}

- (unint64_t)_accessibilityCurrentIndex
{
  void *v2;
  unint64_t v3;

  -[PXMessagesStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("currentIndex"));

  return v3;
}

@end
