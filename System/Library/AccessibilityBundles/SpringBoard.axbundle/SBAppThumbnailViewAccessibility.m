@implementation SBAppThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppThumbnailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SBAppThumbnailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  int v3;
  __CFString *v4;

  -[SBAppThumbnailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isShowingQuitButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    v4 = CFSTR("phone.favorite.icon.quit.hint");
  else
    v4 = CFSTR("phone.favorite.icon.launch.hint");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  -[SBAppThumbnailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isShowingQuitButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[SBAppThumbnailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_quitButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityActivationPoint");
    v7 = v6;
    v9 = v8;

    v10 = v7;
    v11 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBAppThumbnailViewAccessibility;
    -[SBAppThumbnailViewAccessibility accessibilityActivationPoint](&v12, sel_accessibilityActivationPoint);
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_showQuitButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  -[SBAppThumbnailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isShowingQuitButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v12.receiver = self;
  v12.super_class = (Class)SBAppThumbnailViewAccessibility;
  -[SBAppThumbnailViewAccessibility _showQuitButton:](&v12, sel__showQuitButton_, v3);
  if (v3 && (v6 & 1) == 0)
  {
    -[SBAppThumbnailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_quitButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsAccessibilityElement:", 0);

    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("started.quit.app.mode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppThumbnailViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v11);
  }
}

@end
