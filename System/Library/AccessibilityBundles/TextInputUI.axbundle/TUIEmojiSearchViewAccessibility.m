@implementation TUIEmojiSearchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIEmojiSearchView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIEmojiSearchView"), CFSTR("addButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TUIEmojiSearchView"), CFSTR("_searchTextField"), "TUIEmojiSearchTextField");
  objc_msgSend(v3, "validateClass:", CFSTR("_UIScenePresentationView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIEmojiSearchView"), CFSTR("updatePlaceholder"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchViewAccessibility;
  -[TUIEmojiSearchViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[TUIEmojiSearchViewAccessibility _axInstallAccessibilityLabels](self, "_axInstallAccessibilityLabels");
}

- (void)_axInstallAccessibilityLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[TUIEmojiSearchViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("create.emoji"), &stru_2503B5180, CFSTR("Accessibility-GreymatterTA"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

}

uint64_t __64__TUIEmojiSearchViewAccessibility__axInstallAccessibilityLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_imageAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("assetName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("emoji.face.grinning"));

  return v8;
}

- (void)updatePlaceholder
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUIEmojiSearchViewAccessibility;
  -[TUIEmojiSearchViewAccessibility updatePlaceholder](&v10, sel_updatePlaceholder);
  -[TUIEmojiSearchViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_209);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  objc_initWeak(&from, v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__TUIEmojiSearchViewAccessibility_updatePlaceholder__block_invoke_2;
  v5[3] = &unk_2503B4C90;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "_setAccessibilityFrameForSortingBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

uint64_t __52__TUIEmojiSearchViewAccessibility_updatePlaceholder__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;

  v2 = a2;
  objc_msgSend(v2, "accessibilityContainer");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349226DC](CFSTR("_UIScenePresentationView"));
  LOBYTE(v3) = objc_opt_isKindOfClass();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2349226DC](CFSTR("STKStickerRemoteSearchViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

double __52__TUIEmojiSearchViewAccessibility_updatePlaceholder__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  CGRectGetMaxY(v13);
  return v5;
}

- (void)addButtons
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchViewAccessibility;
  -[TUIEmojiSearchViewAccessibility addButtons](&v3, sel_addButtons);
  -[TUIEmojiSearchViewAccessibility _axInstallAccessibilityLabels](self, "_axInstallAccessibilityLabels");
}

@end
