@implementation AXOnboardingVoiceOverBridge

+ (BOOL)triggerEventCommand:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(getAXVoiceOverServerClass(), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "triggerEventCommand:", v3);

  return v5;
}

+ (void)connectToVO
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_updateRecognizedGestureNotification, (CFStringRef)*MEMORY[0x24BED2988], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, a1, (CFNotificationCallback)_updateSpeakingRateNotification, (CFStringRef)*MEMORY[0x24BED2980], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)setRecognizedGesture
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(getAXVoiceOverServerClass(), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognizedGestureForTutorial");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)recognizedGesture;
  recognizedGesture = v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("AXVOTTrainingSwiftNotification"), 0);

  return (id)recognizedGesture;
}

+ (id)getRecognizedGesture
{
  return (id)recognizedGesture;
}

+ (id)getRotorName
{
  void *v2;
  void *v3;

  objc_msgSend(getAXVoiceOverServerClass(), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRotorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)teachableBrailleItems
{
  id AXTeachableMomentsManagerClass;
  void *v3;
  void *v4;
  void *v5;

  AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  getAXTeachableFeatureBraille();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AXTeachableMomentsManagerClass, "teachableItemsForFeature:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__AXOnboardingVoiceOverBridge_teachableBrailleItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "itemTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemTitle:", v4);

  objc_msgSend(v2, "itemDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setItemDescription:", v5);
  return v3;
}

+ (id)teachableVoiceOverItems
{
  id AXTeachableMomentsManagerClass;
  void *v3;
  void *v4;
  void *v5;

  AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  getAXTeachableFeatureVoiceOver();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AXTeachableMomentsManagerClass, "teachableItemsForFeature:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_196);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__AXOnboardingVoiceOverBridge_teachableVoiceOverItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "itemTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemTitle:", v4);

  objc_msgSend(v2, "itemDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setItemDescription:", v5);
  return v3;
}

+ (id)teachableMomentsBuildVersion
{
  return (id)objc_msgSend(getAXTeachableMomentsManagerClass(), "buildVersion");
}

+ (BOOL)hasVoiceOverTeachableMomentsContent
{
  id AXTeachableMomentsManagerClass;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;

  AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  getAXTeachableFeatureVoiceOver();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AXTeachableMomentsManagerClass, "teachableItemsForFeature:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    v6 = getAXTeachableMomentsManagerClass();
    getAXTeachableFeatureBraille();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "teachableItemsForFeature:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "count") != 0;

  }
  return v5;
}

+ (BOOL)voTutorialUsageConfirmed
{
  return _AXSVoiceOverTouchTutorialUsageConfirmed() != 0;
}

+ (void)setVOTutorialUsageConfirmed:(BOOL)a3
{
  _AXSVoiceOverTouchSetTutorialUsageConfirmed();
}

+ (BOOL)voSplashScreenEnabled
{
  return 0;
}

+ (BOOL)voTutorialStartedFromSplash
{
  return 0;
}

+ (BOOL)isInBuddy
{
  return 0;
}

+ (void)enableVoiceOver:(BOOL)a3
{
  _AXSVoiceOverTouchSetEnabled();
}

+ (id)getVoiceOverEnabledDefaultName
{
  return (id)enabledOnLaunchDefault;
}

+ (id)getVoiceOverHintsEnabledDefaultName
{
  return (id)hintsEnabledOnLaunchDefault;
}

+ (void)synthesizerSpeakString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = v3;
  if (!synthesizer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDB18E8]);
    v5 = (void *)synthesizer;
    synthesizer = (uint64_t)v4;

    v3 = v8;
  }
  objc_msgSend(MEMORY[0x24BDB18F0], "speechUtteranceWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXOnboardingVoiceOverBridge getVolume](AXOnboardingVoiceOverBridge, "getVolume");
  objc_msgSend(v6, "setVolume:");
  objc_msgSend(v6, "setPreUtteranceDelay:", 3.0);
  +[AXOnboardingVoiceOverBridge getVoice](AXOnboardingVoiceOverBridge, "getVoice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setVoice:", v7);
  objc_msgSend((id)synthesizer, "speakUtterance:", v6);

}

+ (void)synthesizerStopSpeaking
{
  void *v2;

  objc_msgSend((id)synthesizer, "stopSpeakingAtBoundary:", 0);
  v2 = (void *)synthesizer;
  synthesizer = 0;

}

+ (void)setSpeakingRate:(float)a3
{
  _AXSVoiceOverTouchSetSpeakingRate();
}

+ (float)getSpeakingRate
{
  float v2;

  _AXSVoiceOverTouchSpeakingRate();
  return roundf(v2 * 100.0);
}

+ (float)getVolume
{
  return 1.0;
}

+ (id)getVoice
{
  return 0;
}

+ (BOOL)isVoiceOverHintsEnabled
{
  return 0;
}

+ (id)keyboardShortcutStringForCommand:(id)a3
{
  return 0;
}

+ (id)sfSymbolsForCommand:(id)a3
{
  return 0;
}

+ (id)keyboardShortcutSpelledOutForCommand:(id)a3
{
  return 0;
}

@end
