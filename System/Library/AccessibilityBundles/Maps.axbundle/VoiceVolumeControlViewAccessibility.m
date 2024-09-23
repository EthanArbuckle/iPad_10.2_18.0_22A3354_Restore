@implementation VoiceVolumeControlViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VoiceVolumeControlView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VoiceVolumeControlView"), CFSTR("_currentSelection"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VoiceVolumeControlView"), CFSTR("_buttons"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VoiceVolumeControlView"), CFSTR("_animateContentUpdate"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[VoiceVolumeControlViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_buttons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VoiceVolumeControlViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_currentSelection"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x24BDF7400];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v16 = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "tag");
        v13 = objc_msgSend(v11, "accessibilityTraits");
        if (v12 == v4)
          v14 = v9 | v13;
        else
          v14 = _AXTraitsRemoveTrait();
        objc_msgSend(v11, "setAccessibilityTraits:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)VoiceVolumeControlViewAccessibility;
  -[VoiceVolumeControlViewAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);

}

- (void)_animateContentUpdate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VoiceVolumeControlViewAccessibility;
  -[VoiceVolumeControlViewAccessibility _animateContentUpdate](&v3, sel__animateContentUpdate);
  -[VoiceVolumeControlViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
