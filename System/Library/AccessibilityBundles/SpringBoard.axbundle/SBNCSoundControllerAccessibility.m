@implementation SBNCSoundControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBNCSoundController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBNCSoundController"), CFSTR("_playingSounds"), "NSMutableDictionary");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCSoundController"), CFSTR("playSoundForNotificationRequest:presentingDestination:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCSoundController"), CFSTR("_killSounds"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCSoundController"), CFSTR("stopSoundForNotificationRequest:"), "v", "@", 0);

}

- (BOOL)_accessibilityIsAlarmRinging
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[SBNCSoundControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAlarmSoundPlayingDataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNCSoundControllerAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("_playingSounds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v5 != 0;
    _os_log_impl(&dword_232A0A000, v6, OS_LOG_TYPE_INFO, "Query is alarm ringing: %d", (uint8_t *)v8, 8u);
  }

  return v5 != 0;
}

- (void)playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBNCSoundControllerAccessibility;
  -[SBNCSoundControllerAccessibility playSoundForNotificationRequest:presentingDestination:](&v13, sel_playSoundForNotificationRequest_presentingDestination_, v6, a4);
  objc_msgSend(v6, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobiletimer"));

  if (v8)
  {
    -[SBNCSoundControllerAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("_playingSounds"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBNCSoundControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("AXAlarmSoundPlayingDataKey"));

    }
  }

}

- (void)_killSounds
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBNCSoundControllerAccessibility;
  -[SBNCSoundControllerAccessibility _killSounds](&v3, sel__killSounds);
  -[SBNCSoundControllerAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXAlarmSoundPlayingDataKey"));
}

- (void)stopSoundForNotificationRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBNCSoundControllerAccessibility;
  -[SBNCSoundControllerAccessibility stopSoundForNotificationRequest:](&v4, sel_stopSoundForNotificationRequest_, a3);
  -[SBNCSoundControllerAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXAlarmSoundPlayingDataKey"));
}

@end
