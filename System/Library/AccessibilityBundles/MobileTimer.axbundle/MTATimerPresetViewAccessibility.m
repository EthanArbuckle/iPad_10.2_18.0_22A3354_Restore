@implementation MTATimerPresetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerPresetView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axTimerPreset
{
  JUMPOUT(0x234916860);
}

- (void)_axSetTimerPreset:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPresetView"), CFSTR("setPresetItem:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPresetItem"), CFSTR("duration"), "d", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MTATimerPresetViewAccessibility _axTimerPreset](self, "_axTimerPreset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeTimeIntervalForKey:", CFSTR("duration"));
  AXDurationStringForDuration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (void)setPresetItem:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTATimerPresetViewAccessibility;
  v4 = a3;
  -[MTATimerPresetViewAccessibility setPresetItem:](&v5, sel_setPresetItem_, v4);
  -[MTATimerPresetViewAccessibility _axSetTimerPreset:](self, "_axSetTimerPreset:", v4, v5.receiver, v5.super_class);

}

@end
