@implementation CKUIThemeHUD

- (int64_t)keyboardAppearance
{
  int64_t v2;
  _BOOL4 v3;

  v2 = -[CKUITheme HUDStyle](self, "HUDStyle");
  if (keyboardAppearance_sHUDStyle == v2)
  {
    return (_BOOL4)keyboardAppearance_sBehavior_1318;
  }
  else
  {
    v3 = v2 != 2;
    keyboardAppearance_sBehavior_1318 = v2 != 2;
    keyboardAppearance_sHUDStyle = v2;
  }
  return v3;
}

- (id)green_sendButtonColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (green_sendButtonColor_sHUDStyle != v3 || green_sendButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme green_sendButtonColor](&v10, sel_green_sendButtonColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)green_sendButtonColor_sBehavior_1319;
    green_sendButtonColor_sBehavior_1319 = v7;

    green_sendButtonColor_sHUDStyle = v3;
    green_sendButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)green_sendButtonColor_sBehavior_1319;
}

- (id)blue_sendButtonColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (blue_sendButtonColor_sHUDStyle != v3 || blue_sendButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme blue_sendButtonColor](&v10, sel_blue_sendButtonColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)blue_sendButtonColor_sBehavior_1320;
    blue_sendButtonColor_sBehavior_1320 = v7;

    blue_sendButtonColor_sHUDStyle = v3;
    blue_sendButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)blue_sendButtonColor_sBehavior_1320;
}

- (id)siri_sendButtonColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (siri_sendButtonColor_sHUDStyle != v3 || siri_sendButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme siri_sendButtonColor](&v10, sel_siri_sendButtonColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)siri_sendButtonColor_sBehavior_1322;
    siri_sendButtonColor_sBehavior_1322 = v7;

    siri_sendButtonColor_sHUDStyle = v3;
    siri_sendButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)siri_sendButtonColor_sBehavior_1322;
}

- (id)entryFieldButtonColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldButtonColor_sHUDStyle != v3 || entryFieldButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme entryFieldButtonColor](&v10, sel_entryFieldButtonColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)entryFieldButtonColor_sBehavior_1324;
    entryFieldButtonColor_sBehavior_1324 = v7;

    entryFieldButtonColor_sHUDStyle = v3;
    entryFieldButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)entryFieldButtonColor_sBehavior_1324;
}

- (id)entryFieldCoverFillColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldCoverFillColor_sHUDStyle != v3
    || entryFieldCoverFillColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme entryFieldCoverFillColor](&v10, sel_entryFieldCoverFillColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)entryFieldCoverFillColor_sBehavior_1326;
    entryFieldCoverFillColor_sBehavior_1326 = v7;

    entryFieldCoverFillColor_sHUDStyle = v3;
    entryFieldCoverFillColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)entryFieldCoverFillColor_sBehavior_1326;
}

- (id)entryFieldCoverBorderColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldCoverBorderColor_sHUDStyle != v3
    || entryFieldCoverBorderColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme entryFieldCoverBorderColor](&v10, sel_entryFieldCoverBorderColor);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)entryFieldCoverBorderColor_sBehavior_1328;
      entryFieldCoverBorderColor_sBehavior_1328 = v7;
    }
    else
    {
      v8 = (void *)entryFieldCoverBorderColor_sBehavior_1328;
      entryFieldCoverBorderColor_sBehavior_1328 = 0;
    }

    entryFieldCoverBorderColor_sHUDStyle = v3;
    entryFieldCoverBorderColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)entryFieldCoverBorderColor_sBehavior_1328;
}

- (id)entryFieldTextColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldTextColor_sHUDStyle != v3 || entryFieldTextColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme entryFieldTextColor](&v10, sel_entryFieldTextColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)entryFieldTextColor_sBehavior_1330;
    entryFieldTextColor_sBehavior_1330 = v7;

    entryFieldTextColor_sHUDStyle = v3;
    entryFieldTextColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)entryFieldTextColor_sBehavior_1330;
}

- (id)entryFieldAudioRecordingBalloonColor
{
  int64_t v3;
  int v4;
  char v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[CKUITheme HUDStyle](self, "HUDStyle");
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldAudioRecordingBalloonColor_sHUDStyle != v3
    || entryFieldAudioRecordingBalloonColor_sIsIncreaseContrastEnabled != v4)
  {
    v6 = v4;
    if (v3 == 2)
    {
      v10.receiver = self;
      v10.super_class = (Class)CKUIThemeHUD;
      -[CKUITheme entryFieldAudioRecordingBalloonColor](&v10, sel_entryFieldAudioRecordingBalloonColor);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)entryFieldAudioRecordingBalloonColor_sBehavior_1332;
    entryFieldAudioRecordingBalloonColor_sBehavior_1332 = v7;

    entryFieldAudioRecordingBalloonColor_sHUDStyle = v3;
    entryFieldAudioRecordingBalloonColor_sIsIncreaseContrastEnabled = v6;
  }
  return (id)entryFieldAudioRecordingBalloonColor_sBehavior_1332;
}

@end
