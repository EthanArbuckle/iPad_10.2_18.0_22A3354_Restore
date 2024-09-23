@implementation AXUIVoiceOverBrailleAlertIntervalController

- (BOOL)numericalPreferenceEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceOverBrailleAlertsEnabled");

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoiceOverBrailleAlertsEnabled:", v3);

}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (double)minimumValue
{
  return *MEMORY[0x1E0CF3CC0];
}

- (double)maximumValue
{
  return *MEMORY[0x1E0CF3CB8];
}

- (double)numericalPreferenceValue
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceOverBrailleAlertDisplayDuration");
  v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoiceOverBrailleAlertDisplayDuration:", a3);

}

- (id)localizedFooterText
{
  return AXUILocalizedStringForKey(CFSTR("BRAILLE_DISPLAY_TIMEOUT_FOOTER_TEXT"));
}

- (BOOL)infiniteTimeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceOverBrailleAlertShowUntilDismissed");

  return v3;
}

- (void)setInfiniteTimeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoiceOverBrailleAlertShowUntilDismissed:", v3);

}

- (BOOL)supportsInfiniteTime
{
  return 1;
}

- (id)localizedTitle
{
  return AXUILocalizedStringForKey(CFSTR("BRAILLE_DISPLAY_TIMEOUT"));
}

- (double)stepAmount
{
  return 0.5;
}

- (int64_t)keyboardTypeForSpecifier:(id)a3
{
  return 8;
}

@end
