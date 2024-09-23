@implementation VideosPlaybackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosPlaybackViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VideosPlaybackViewController"), CFSTR("_overlayView"), "VideosPlaybackOverlayView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VideosPlaybackViewController"), CFSTR("_overlayViewVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPlaybackViewController"), CFSTR("_canHideOverlayView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPlaybackViewController"), CFSTR("_hideOverlayViewWithCompletionBlock:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPlaybackViewController"), CFSTR("_showOverlayViewQuickHide:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPlaybackViewController"), CFSTR("_handleSingleTap:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPlaybackViewController"), CFSTR("_overlayIdleTimerFired:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPlaybackViewController"), CFSTR("_cancelOverlayIdleTimer:"), "v", ":", 0);

}

- (BOOL)_canHideOverlayView
{
  int v3;
  objc_super v5;

  v3 = -[VideosPlaybackViewControllerAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXConsumeSingleTap"));
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (v3)
    {
      -[VideosPlaybackViewControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXConsumeSingleTap"));
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VideosPlaybackViewControllerAccessibility;
    return -[VideosPlaybackViewControllerAccessibility _canHideOverlayView](&v5, sel__canHideOverlayView);
  }
}

- (BOOL)_axOverlayViewVisible
{
  return -[VideosPlaybackViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_overlayViewVisible"));
}

- (void)_hideOverlayViewWithCompletionBlock:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL8 v6;
  objc_super v7;

  v4 = a3;
  v5 = -[VideosPlaybackViewControllerAccessibility _axOverlayViewVisible](self, "_axOverlayViewVisible");
  v7.receiver = self;
  v7.super_class = (Class)VideosPlaybackViewControllerAccessibility;
  -[VideosPlaybackViewControllerAccessibility _hideOverlayViewWithCompletionBlock:](&v7, sel__hideOverlayViewWithCompletionBlock_, v4);

  v6 = -[VideosPlaybackViewControllerAccessibility _axOverlayViewVisible](self, "_axOverlayViewVisible");
  if (v5 != v6)
    -[VideosPlaybackViewControllerAccessibility _axAnnounceControlsVisible:](self, "_axAnnounceControlsVisible:", v6);
}

- (void)_axAnnounceControlsVisible:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v4;
  id v5;

  v3 = a3;
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEE30]);
  if (v3)
    v4 = CFSTR("controls.shown");
  else
    v4 = CFSTR("controls.hidden");
  accessibilityLocalizedString(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)_handleSingleTap:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[VideosPlaybackViewControllerAccessibility _axOverlayViewVisible](self, "_axOverlayViewVisible"))
    -[VideosPlaybackViewControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXConsumeSingleTap"));
  v5.receiver = self;
  v5.super_class = (Class)VideosPlaybackViewControllerAccessibility;
  -[VideosPlaybackViewControllerAccessibility _handleSingleTap:](&v5, sel__handleSingleTap_, v4);

}

- (void)_showOverlayViewQuickHide:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  _BOOL8 v6;
  objc_super v7;

  v3 = a3;
  v5 = -[VideosPlaybackViewControllerAccessibility _axOverlayViewVisible](self, "_axOverlayViewVisible");
  v7.receiver = self;
  v7.super_class = (Class)VideosPlaybackViewControllerAccessibility;
  -[VideosPlaybackViewControllerAccessibility _showOverlayViewQuickHide:](&v7, sel__showOverlayViewQuickHide_, v3);
  v6 = -[VideosPlaybackViewControllerAccessibility _axOverlayViewVisible](self, "_axOverlayViewVisible");
  if (v5 != v6)
    -[VideosPlaybackViewControllerAccessibility _axAnnounceControlsVisible:](self, "_axAnnounceControlsVisible:", v6);
}

- (void)_overlayIdleTimerFired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  char v9;
  objc_super v10;

  v4 = a3;
  if (UIAccessibilityIsSwitchControlRunning())
  {
    UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x24BDF72D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_opt_class();
    -[VideosPlaybackViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_overlayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "_accessibilityIsDescendantOfElement:", v7) & 1) != 0)
    {
      AXPerformSafeBlock();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)VideosPlaybackViewControllerAccessibility;
      -[VideosPlaybackViewControllerAccessibility _overlayIdleTimerFired:](&v8, sel__overlayIdleTimerFired_, v4);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosPlaybackViewControllerAccessibility;
    -[VideosPlaybackViewControllerAccessibility _overlayIdleTimerFired:](&v10, sel__overlayIdleTimerFired_, v4);
  }

}

uint64_t __68__VideosPlaybackViewControllerAccessibility__overlayIdleTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelOverlayIdleTimer:", sel__accessibilitySnarfed);
}

@end
