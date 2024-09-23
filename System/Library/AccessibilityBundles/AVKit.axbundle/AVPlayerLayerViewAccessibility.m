@implementation AVPlayerLayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("__AVPlayerLayerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("__AVPlayerLayerView"), CFSTR("playerController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("contentDimensions"), "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("hasEnabledAudio"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("hasEnabledVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("isReadyToPlay"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AVPlaybackContentZoomingView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVPlaybackContentZoomingView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackContentZoomingView"), CFSTR("isZoomingEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("minimumZoomScale"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("maximumZoomScale"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("zoomScale"), "d", 0);

}

- (BOOL)_axHasVideo
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  char v7;

  -[AVPlayerLayerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("contentDimensions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeValue");
  if (v5 == *MEMORY[0x24BDBF148] && v4 == *(double *)(MEMORY[0x24BDBF148] + 8))
    v7 = 0;
  else
    v7 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("hasEnabledVideo"));

  return v7;
}

- (id)_axZoomableView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[AVPlayerLayerViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__AVPlayerLayerViewAccessibility__axZoomableView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("AVPlaybackContentZoomingView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsZoomable
{
  void *v2;
  char v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;

  -[AVPlayerLayerViewAccessibility _axZoomableView](self, "_axZoomableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isZoomingEnabled"));
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("minimumZoomScale"));
  v5 = v4;
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("maximumZoomScale"));
  if (v6 > v5)
    v7 = v3;
  else
    v7 = 0;
  if (v2)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_axCanZoomIn
{
  void *v2;
  double v3;
  BOOL v4;

  -[AVPlayerLayerViewAccessibility _axZoomableView](self, "_axZoomableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("zoomScale"));
  v4 = v3 == 1.0;

  return v4;
}

- (BOOL)_axCanZoomOut
{
  void *v2;
  double v3;
  BOOL v4;

  -[AVPlayerLayerViewAccessibility _axZoomableView](self, "_axZoomableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("zoomScale"));
  v4 = v3 != 1.0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;

  -[AVPlayerLayerViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[AVPlayerLayerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("media.background.view.label");
    if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("isReadyToPlay")))
    {
      if (-[AVPlayerLayerViewAccessibility _axHasVideo](self, "_axHasVideo"))
      {
        v7 = CFSTR("video.background.view.label");
      }
      else if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("hasEnabledAudio")))
      {
        v7 = CFSTR("audio.background.view.label");
      }
    }
    accessibilityLocalizedString(v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("media.background.ios.view.hint"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerLayerViewAccessibility;
  v3 = -[AVPlayerLayerViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[AVPlayerLayerViewAccessibility _axIsZoomable](self, "_axIsZoomable");
  v5 = *MEMORY[0x24BDFEFE8];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (CGPoint)accessibilityActivationPoint
{
  UIView *v2;
  double v3;
  double v4;
  double v5;
  CGPoint result;
  CGRect v7;
  CGRect v8;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](v2, "bounds");
  v8 = UIAccessibilityConvertFrameToScreenCoordinates(v7, v2);
  *(float *)&v8.origin.x = v8.size.width * 0.5;
  v3 = *(float *)&v8.origin.x;

  v4 = 0.0;
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  _BOOL4 v4;
  id v5;
  UIAccessibilityNotifications v6;
  void *v7;
  void *v9;

  v4 = -[AVPlayerLayerViewAccessibility _axCanZoomIn](self, "_axCanZoomIn");
  if (v4)
  {
    -[AVPlayerLayerViewAccessibility _axZoomableView](self, "_axZoomableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    AXPerformSafeBlock();
    v6 = *MEMORY[0x24BDF71E8];
    objc_msgSend(v5, "safeCGFloatForKey:", CFSTR("zoomScale"));
    AXFormatMagnificationFactor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v7);

  }
  return v4;
}

uint64_t __61__AVPlayerLayerViewAccessibility_accessibilityZoomInAtPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "zoomToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  _BOOL4 v4;
  id v5;
  UIAccessibilityNotifications v6;
  void *v7;
  void *v9;

  v4 = -[AVPlayerLayerViewAccessibility _axCanZoomOut](self, "_axCanZoomOut");
  if (v4)
  {
    -[AVPlayerLayerViewAccessibility _axZoomableView](self, "_axZoomableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    AXPerformSafeBlock();
    v6 = *MEMORY[0x24BDF71E8];
    objc_msgSend(v5, "safeCGFloatForKey:", CFSTR("zoomScale"));
    AXFormatMagnificationFactor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v7);

  }
  return v4;
}

uint64_t __62__AVPlayerLayerViewAccessibility_accessibilityZoomOutAtPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "zoomToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)isAccessibilityElement
{
  Class v3;
  void *v4;
  char v5;

  v3 = NSClassFromString(CFSTR("VideosUI.PaginatedSwipingContainerView"));
  if (v3)
  {
    -[AVPlayerLayerViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = -[AVPlayerLayerViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem");

  }
  else
  {
    v5 = -[AVPlayerLayerViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem");
  }
  return v5 ^ 1;
}

@end
