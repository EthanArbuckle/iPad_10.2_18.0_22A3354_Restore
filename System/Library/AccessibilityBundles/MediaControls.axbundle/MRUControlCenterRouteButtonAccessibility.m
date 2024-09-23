@implementation MRUControlCenterRouteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUControlCenterRouteButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUControlCenterRouteButton"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUControlCenterRouteButton"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v15;

  -[MRUControlCenterRouteButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[MRUControlCenterRouteButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeStringForKey:", CFSTR("assetName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("airplayaudio")))
  {
    v10 = CFSTR("airplay.audio.label");
LABEL_12:
    accessibilityLocalizedString(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("airplayvideo")))
  {
    v10 = CFSTR("airplay.video.label");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("headphones")))
  {
    v10 = CFSTR("route.description.headphones");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("speaker.wave.2.fill")))
  {
    v10 = CFSTR("playback.destination.button.label");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("airpods"))
    || objc_msgSend(v9, "isEqualToString:", CFSTR("airpods.gen3")))
  {
    v10 = CFSTR("route.description.airpods");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("airpodspro")))
  {
    v10 = CFSTR("route.description.airpodspro");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("airpodsmax")))
  {
    v10 = CFSTR("route.description.airpodsmax");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("beats.fit.pro")))
  {
    v10 = CFSTR("route.description.beatspro");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("homepod.fill")))
  {
    v10 = CFSTR("route.description.homepod");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("display")))
  {
    v10 = CFSTR("route.description.display");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("hifispeaker.fill")))
  {
    v10 = CFSTR("route.description.speaker");
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("tv")))
  {
    v10 = CFSTR("route.description.tv");
    goto LABEL_12;
  }
  if (!v9)
  {
    v12 = 0;
    goto LABEL_14;
  }
  AXLogAppAccessibility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MRUControlCenterRouteButtonAccessibility accessibilityLabel].cold.1((uint64_t)v9, v15);

  objc_msgSend(v6, "accessibilityLabel");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v12 = (void *)v11;
LABEL_14:
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUControlCenterRouteButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MRUControlCenterRouteButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityLabel
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23273D000, a2, OS_LOG_TYPE_ERROR, "Unhandled asset name for media control button: %@", (uint8_t *)&v2, 0xCu);
}

@end
