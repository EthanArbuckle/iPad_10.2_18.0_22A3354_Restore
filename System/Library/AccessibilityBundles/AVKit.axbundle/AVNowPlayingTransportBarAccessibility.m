@implementation AVNowPlayingTransportBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVNowPlayingTransportBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVNowPlayingTransportBar"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingTransportBar"), CFSTR("createViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingTransportBar"), CFSTR("_updateRemainingTimeText"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingTransportBar"), CFSTR("setHint:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingTransportBar"), CFSTR("_elapsedTimeLabel"), "AVAnimatingLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingTransportBar"), CFSTR("_startTimeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingTransportBar"), CFSTR("_remainingTimeLabel"), "AVAnimatingLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingTransportBar"), CFSTR("_clonedPlayer"), "AVPlayer");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingTransportBar"), CFSTR("frameSource"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;
  char v7;

  v7 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning() && (objc_msgSend(v3, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVNowPlayingTransportBarAccessibility;
    v4 = -[AVNowPlayingTransportBarAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }

  return v4;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return -[AVNowPlayingTransportBarAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible") ^ 1;
}

- (int64_t)_accessibilityReinterpretVoiceOverCommand:(int64_t)a3
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  void *v4;

  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_remainingTimeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  if (v3)
  {
    accessibilityLocalizedString(CFSTR("transport.bar.label"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_updateRemainingTimeText
{
  void *v3;
  uint64_t v4;
  double Current;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVNowPlayingTransportBarAccessibility;
  -[AVNowPlayingTransportBarAccessibility _updateRemainingTimeText](&v14, sel__updateRemainingTimeText);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "voiceOverPreferredTVInteractionMode");

  if (v4 == 1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[AVNowPlayingTransportBarAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXLastPlayStateAnnouncementTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_opt_class();
    -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_clonedPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (Current - v8 > 3.0)
    {
      objc_msgSend(v10, "rate", Current - v8);
      if (fabsf(v11) > 1.0)
      {
        -[AVNowPlayingTransportBarAccessibility _axStringForElapsedAndRemainingTime](self, "_axStringForElapsedAndRemainingTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilitySpeakIfNotSpeaking();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVNowPlayingTransportBarAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v13, CFSTR("kAXLastPlayStateAnnouncementTime"));

      }
    }

  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVNowPlayingTransportBarAccessibility;
  -[AVNowPlayingTransportBarAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_elapsedTimeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AXElapsedTime"));

  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("AXStartTime"));

  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentClockTimeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("AXCurrentClock"));

  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endingClockTimeLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("AXEndingClock"));

  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_remainingTimeLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("AXRemainingTime"));

}

- (id)_axStringForElapsedAndRemainingTime
{
  int v3;
  const __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;

  v3 = -[AVNowPlayingTransportBarAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("displaysClockTimes"));
  if (v3)
    v4 = CFSTR("_currentClockTimeLabel");
  else
    v4 = CFSTR("_elapsedTimeLabel");
  -[AVNowPlayingTransportBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityViewIsVisible");
  objc_msgSend(v5, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    if (v3)
      v10 = CFSTR("media.time.current");
    else
      v10 = CFSTR("media.time.elapsed");
    accessibilityLocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v11, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v3)
    v12 = CFSTR("_endingClockTimeLabel");
  else
    v12 = CFSTR("_remainingTimeLabel");
  -[AVNowPlayingTransportBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_accessibilityViewIsVisible");
  objc_msgSend(v13, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = 0;
  }
  else
  {
    if (v3)
      v18 = CFSTR("media.time.ending");
    else
      v18 = CFSTR("media.time.remaining");
    accessibilityLocalizedString(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v19, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  __UIAXStringForVariables();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setHint:(int64_t)a3
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerValue");

  v12.receiver = self;
  v12.super_class = (Class)AVNowPlayingTransportBarAccessibility;
  -[AVNowPlayingTransportBarAccessibility setHint:](&v12, sel_setHint_, a3);
  switch(a3)
  {
    case 0:
    case 7:
      UIAccessibilityPostNotification(0xBD5u, 0);
      return;
    case 1:
      v6 = CFSTR("tv.player.fastforwarding");
      goto LABEL_9;
    case 2:
      v6 = CFSTR("tv.player.rewinding");
      goto LABEL_9;
    case 5:
      v6 = CFSTR("next.track");
      goto LABEL_9;
    case 6:
      v6 = CFSTR("previous.track");
LABEL_9:
      accessibilityLocalizedString(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_10;
      return;
    case 8:
      v7 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("tv.player.paused.with.remaining"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVNowPlayingTransportBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remainingTimeLabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessibilityLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        return;
LABEL_10:
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v11);

      break;
    default:
      return;
  }
}

@end
