@implementation UIColor(MTUIStyling)

+ (uint64_t)mtui_disabledTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

+ (uint64_t)mtui_backgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_systemGroupedBackgroundColor");
}

+ (uint64_t)mtui_tintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

+ (uint64_t)mtui_quaternaryColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_quaternaryLabelColor");
}

+ (uint64_t)mtui_cellHighlightColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_quaternaryColor");
}

+ (uint64_t)mtui_switchTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.262745098, 0.262745098, 0.270588235, 1.0);
}

+ (uint64_t)mtui_primaryColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
}

+ (uint64_t)mtui_cellSeparatorColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_separatorColor");
}

+ (uint64_t)mtui_secondaryColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
}

+ (uint64_t)mtui_tertiaryColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_tertiaryLabelColor");
}

+ (uint64_t)mtui_foregroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "_secondarySystemGroupedBackgroundColor");
}

+ (uint64_t)mtui_cellAccessoryColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_tertiaryColor");
}

+ (uint64_t)mtui_buttonBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
}

+ (uint64_t)mtui_worldClockMapLandColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_tertiaryColor");
}

+ (uint64_t)mtui_primaryTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (uint64_t)mtui_secondaryTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

+ (uint64_t)mtui_tertiaryTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
}

+ (uint64_t)mtui_stopwatchMajorTickMarkColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
}

+ (uint64_t)mtui_stopwatchMinorTickMarkColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_tertiaryColor");
}

+ (id)mtui_startResumeButtonTintColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_startResumeButtonTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mtui_startResumeButtonTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
}

+ (id)mtui_pauseButtonTintColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_pauseButtonTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mtui_pauseButtonTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

+ (id)mtui_stopButtonTintColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_stopButtonTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mtui_stopButtonTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
}

+ (id)mtui_lapResetButtonTintColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_lapResetButtonTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mtui_lapResetButtonTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
}

+ (uint64_t)mtui_disabledButtonTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
}

+ (id)mtui_disabledStartButtonTintColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_startResumeButtonTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mtui_sleepColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "mtui_tintColor");
}

+ (uint64_t)mtui_wakeColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
}

@end
