@implementation FMAVPlayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMAVPlayerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMAVPlayerView"), CFSTR("accessibilityAssetName"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[FMAVPlayerViewAccessibility _axAssetVideoLabel](self, "_axAssetVideoLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_axAssetVideoLabel
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[FMAVPlayerViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityAssetName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("PairingLoopLight-HAWKEYE")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("PairingLoopDark-HAWKEYE")) & 1) != 0)
  {
    v3 = CFSTR("pairing.loop.video");
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Add-Button_iPhone-B389")) & 1) != 0
         || (objc_msgSend(v2, "isEqualToString:", CFSTR("Add-FaceID_iPhone-B389")) & 1) != 0)
  {
    v3 = CFSTR("add.item.to.iPhone");
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Add-Button_iPad-B389")) & 1) != 0
         || (objc_msgSend(v2, "isEqualToString:", CFSTR("Add-FaceID_iPad-B389")) & 1) != 0)
  {
    v3 = CFSTR("add.item.to.iPad");
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("BatterySwap_loop-B389")) & 1) != 0)
  {
    v3 = CFSTR("battery-swap-video");
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR("FMR1Found-B389")))
    {
      v4 = 0;
      goto LABEL_11;
    }
    v3 = CFSTR("found.item.video");
  }
  accessibilityB389LocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[FMAVPlayerViewAccessibility _axAssetVideoLabel](self, "_axAssetVideoLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FMAVPlayerViewAccessibility;
    -[FMAVPlayerViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
