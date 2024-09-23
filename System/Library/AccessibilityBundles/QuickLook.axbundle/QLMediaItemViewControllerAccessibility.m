@implementation QLMediaItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLMediaItemViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("isDragging"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLVideoScrubberView"), CFSTR("isUserInteractingWithScrubber"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLMediaItemViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLMediaItemViewController"), CFSTR("QLMediaItemBaseViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMediaItemViewController"), CFSTR("timeLabelScrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMediaItemViewController"), CFSTR("setUpTimeLabelIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMediaItemViewController"), CFSTR("setTimeLabelNeedsUpdate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMediaItemBaseViewController"), CFSTR("elapsedTime"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLMediaItemViewController"), CFSTR("_timeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLAudioItemViewController"), CFSTR("QLMediaItemViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLMovieItemViewController"), CFSTR("QLMediaItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLAudioItemViewController"), CFSTR("_playButton"), "QLOverlayPlayButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLMovieItemViewController"), CFSTR("_playButton"), "QLOverlayPlayButton");
  objc_msgSend(v3, "validateClass:", CFSTR("QLMovieItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMovieItemViewController"), CFSTR("isEditing"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLMediaItemViewControllerAccessibility;
  -[QLMediaItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[QLMediaItemViewControllerAccessibility _axSetUpScrubberView](self, "_axSetUpScrubberView");
}

- (void)_axApplyContentOffset:(id)a3 contentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x2348C1FC8](CFSTR("QLVideoScrubberView")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_axSetIsDragging:", 1);
  objc_msgSend(v8, "_axSetIsScrubbering:", 1);
  objc_msgSend(v6, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, x, y);
  v11 = v6;
  v12 = v8;
  v9 = v8;
  v10 = v6;
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __78__QLMediaItemViewControllerAccessibility__axApplyContentOffset_contentOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_axSetIsDragging:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_axSetIsScrubbering:", 0);
}

- (void)_axSetUpScrubberView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id from;
  _QWORD v16[4];
  id v17;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  -[QLMediaItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeLabelScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isAccessibilityElement") & 1) == 0)
  {
    objc_initWeak(&location, v4);
    objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("MediaScrubber"));
    v5 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke;
    v16[3] = &unk_24FF21C48;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v4, "_setIsAccessibilityElementBlock:", v16);
    accessibilityLocalizedString(CFSTR("media.scrubber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0]);
    accessibilityLocalizedString(CFSTR("media.scrubber.hint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityHint:", v7);

    objc_initWeak(&from, self);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_2;
    v13[3] = &unk_24FF21C70;
    objc_copyWeak(&v14, &from);
    objc_msgSend(v4, "_setAccessibilityValueBlock:", v13);
    objc_initWeak(&v12, v4);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_3;
    v10[3] = &unk_24FF21C98;
    objc_copyWeak(&v11, &v12);
    v10[4] = self;
    objc_msgSend(v4, "_setAccessibilityIncrementBlock:", v10);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_4;
    v8[3] = &unk_24FF21C98;
    objc_copyWeak(&v9, &v12);
    v8[4] = self;
    objc_msgSend(v4, "_setAccessibilityDecrementBlock:", v8);
    -[QLMediaItemViewControllerAccessibility _axUpdateAccessibleElements](self, "_axUpdateAccessibleElements");
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

uint64_t __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityViewIsVisible");

  return v2;
}

uint64_t __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeCGFloatForKey:", CFSTR("elapsedTime"));

  return AXDurationStringForDuration();
}

void __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contentSize");
  v5 = v4;
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "contentInset");
  v8 = v5 - v7;

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "contentOffset");
  v11 = v10;
  v13 = v12;

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "contentSize");
  v16 = v11 + v15 / 10.0;

  if (v16 >= v8)
    v16 = v8;
  v17 = *(void **)(a1 + 32);
  objc_opt_class();
  v19 = objc_loadWeakRetained(v2);
  __UIAccessibilityCastAsSafeCategory();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_axApplyContentOffset:contentOffset:", v18, v16, v13);

}

void __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contentOffset");
  v5 = v4;
  v7 = v6;

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "contentSize");
  v10 = v5 + v9 / -10.0;

  v11 = *(void **)(a1 + 32);
  objc_opt_class();
  v13 = objc_loadWeakRetained(v2);
  __UIAccessibilityCastAsSafeCategory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_axApplyContentOffset:contentOffset:", v12, v10, v7);

}

- (void)_axUpdateAccessibleElements
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__QLMediaItemViewControllerAccessibility__axUpdateAccessibleElements__block_invoke;
  v5[3] = &unk_24FF21CC0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityElementsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __69__QLMediaItemViewControllerAccessibility__axUpdateAccessibleElements__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MEMORY[0x2348C1FC8](CFSTR("QLMovieItemViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  v3 = objc_loadWeakRetained(v1);
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing"));

  if ((v4 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_playButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "safeValueForKey:", CFSTR("_timeLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_loadWeakRetained(v1);
    objc_msgSend(v10, "safeUIViewForKey:", CFSTR("timeLabelScrollView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityElementsHidden:", 1);

    objc_msgSend(v5, "axSafelyAddObject:", v7);
    objc_msgSend(v5, "axSafelyAddObject:", v9);
    objc_msgSend(v5, "axSafelyAddObject:", v11);

    return v5;
  }
  v5 = 0;
  return v5;
}

- (void)_axSetLabelForTimeLabel
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[QLMediaItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "hasPrefix:", CFSTR("-")))
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24FF21D18);
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = CFSTR("media.time.remaining");
      v4 = (void *)v5;
    }
    else
    {
      v6 = CFSTR("media.time.elapsed");
    }
    AXLocalizeDurationTime();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setAccessibilityLabel:", v9);
  }

}

- (void)setUpTimeLabelIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLMediaItemViewControllerAccessibility;
  -[QLMediaItemViewControllerAccessibility setUpTimeLabelIfNeeded](&v3, sel_setUpTimeLabelIfNeeded);
  -[QLMediaItemViewControllerAccessibility _axSetUpScrubberView](self, "_axSetUpScrubberView");
}

- (void)setTimeLabelNeedsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  UIAccessibilityNotifications v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLMediaItemViewControllerAccessibility;
  -[QLMediaItemViewControllerAccessibility setTimeLabelNeedsUpdate](&v9, sel_setTimeLabelNeedsUpdate);
  -[QLMediaItemViewControllerAccessibility _axSetLabelForTimeLabel](self, "_axSetLabelForTimeLabel");
  -[QLMediaItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeLabelScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x2348C1FC8](CFSTR("QLVideoScrubberView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isDragging"))
    && (objc_msgSend(v5, "safeBoolForKey:", CFSTR("_axIsScrubbering")) & 1) == 0)
  {
    v6 = *MEMORY[0x24BDF71E8];
    -[QLMediaItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v8);

  }
}

@end
