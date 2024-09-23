@implementation CKVideoPlayerBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKVideoPlayerBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKVideoPlayerBalloonView"), CFSTR("CKImageBalloonView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoPlayerBalloonView"), CFSTR("playerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoPlayerBalloonView"), CFSTR("startPlayingInlineVideo"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKVideoPlayerBalloonViewAccessibility;
  LOBYTE(v3) = -[CKVideoPlayerBalloonViewAccessibility isAccessibilityElement](&v5, sel_isAccessibilityElement);
  if (-[CKVideoPlayerBalloonViewAccessibility accessibilityBalloonViewPlaysInlineVideo](self, "accessibilityBalloonViewPlaysInlineVideo"))
  {
    return !-[CKVideoPlayerBalloonViewAccessibility _isAccessibilityBalloonViewPlayingVideo](self, "_isAccessibilityBalloonViewPlayingVideo");
  }
  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKVideoPlayerBalloonViewAccessibility;
  -[CKVideoPlayerBalloonViewAccessibility accessibilityCustomActions](&v16, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKVideoPlayerBalloonViewAccessibility accessibilityBalloonViewPlaysInlineVideo](self, "accessibilityBalloonViewPlaysInlineVideo"))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    if (!-[CKVideoPlayerBalloonViewAccessibility _isAccessibilityBalloonViewPlayingVideo](self, "_isAccessibilityBalloonViewPlayingVideo"))
    {
      objc_initWeak(&location, self);
      v5 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("video.action.label.play"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __67__CKVideoPlayerBalloonViewAccessibility_accessibilityCustomActions__block_invoke;
      v13 = &unk_2501B1D80;
      objc_copyWeak(&v14, &location);
      v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &v10);
      objc_msgSend(v4, "addObject:", v7, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    v8 = objc_msgSend(v4, "copy");

    v3 = (void *)v8;
  }
  return v3;
}

uint64_t __67__CKVideoPlayerBalloonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __67__CKVideoPlayerBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPlayingInlineVideo");
}

- (BOOL)accessibilityBalloonViewPlaysInlineVideo
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE15A60], "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playsInlineVideo");

  return v3;
}

- (BOOL)_isAccessibilityBalloonViewPlayingVideo
{
  void *v2;
  BOOL v3;

  -[CKVideoPlayerBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
