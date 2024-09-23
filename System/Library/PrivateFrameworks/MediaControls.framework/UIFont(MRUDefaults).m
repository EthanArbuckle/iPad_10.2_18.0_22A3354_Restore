@implementation UIFont(MRUDefaults)

+ (uint64_t)mru_volumeTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC48F8]);
}

+ (uint64_t)mru_volumeButtonSubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC48F8]);
}

+ (id)mru_titleFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC48D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_subtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48D8]);
}

+ (id)mru_routeFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC48D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "boldSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)mru_smallTitleFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC4900]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)mru_smallSubtitleFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A90], *MEMORY[0x1E0DC4900]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_expandedTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC4900]);
}

+ (uint64_t)mru_expandedSubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC4900]);
}

+ (id)mru_expandedRouteFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC4900]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "boldSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_timeFont
{
  return objc_msgSend(a1, "mru_timeFontWithScale:", 1.0);
}

+ (id)mru_timeFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "monospacedDigitSystemFontOfSize:weight:", v4 * a1, *MEMORY[0x1E0DC1438]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mru_buttonFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC48F8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "boldSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)mru_controlCenterTitleFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_controlCenterSubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48D8]);
}

+ (uint64_t)mru_controlCenterMediumTitleFont
{
  return objc_msgSend(a1, "mru_controlCenterMediumTitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterMediumTitleFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "systemFontOfSize:weight:", v4 * a1, *MEMORY[0x1E0DC1448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)mru_controlCenterMediumSubtitleFont
{
  return objc_msgSend(a1, "mru_controlCenterMediumSubtitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterMediumSubtitleFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    v4 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v2, "pointSize");
    objc_msgSend(v4, "systemFontOfSize:", v5 * a1);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

+ (uint64_t)mru_controlCenterLargeTitleFont
{
  return objc_msgSend(a1, "mru_controlCenterLargeTitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterLargeTitleFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "systemFontOfSize:weight:", v4 * a1, *MEMORY[0x1E0DC1448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)mru_controlCenterLargeSubtitleFont
{
  return objc_msgSend(a1, "mru_controlCenterLargeSubtitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterLargeSubtitleFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    v4 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v2, "pointSize");
    objc_msgSend(v4, "systemFontOfSize:", v5 * a1);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

+ (uint64_t)mru_controlCenterRouteButtonFont
{
  return objc_msgSend(a1, "mru_controlCenterRouteButtonFontWithScale:", 1.0);
}

+ (id)mru_controlCenterRouteButtonFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    v4 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v2, "pointSize");
    objc_msgSend(v4, "systemFontOfSize:", v5 * a1);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

+ (uint64_t)mru_controlCenterMoreButtonTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48D8]);
}

+ (id)mru_controlCenterMoreButtonTitleFontWithScale:()MRUDefaults
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    v4 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v2, "pointSize");
    objc_msgSend(v4, "systemFontOfSize:", v5 * a1);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

+ (uint64_t)mru_controlCenterMoreButtonBadgeFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC48D8]);
}

+ (id)mru_suggestionsTitleFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC4918]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "boldSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_suggestionsSubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC4918]);
}

+ (id)mru_routingHeaderFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "boldSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_routingTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (uint64_t)mru_routingSubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
}

+ (id)mru_volumeButtonTitleFont
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "mru_volumeButtonSubtitleFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v2, "boldSystemFontOfSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mru_ambientTitleFont
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = *MEMORY[0x1E0DC4AE8];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AE8], *MEMORY[0x1E0DC4900]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", v0, *MEMORY[0x1E0DC1420]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v2, "fontWithSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mru_ambientSubtitleFont
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = *MEMORY[0x1E0DC4B58];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC4900]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", v0, *MEMORY[0x1E0DC1448]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v2, "fontWithSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mru_ambientTimeFont
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC4900]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "monospacedDigitSystemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)mru_suggestedRouteActivityTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], 1280, *MEMORY[0x1E0DC4920]);
}

+ (uint64_t)mru_suggestedRouteActivitySubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], 1280, *MEMORY[0x1E0DC4920]);
}

+ (uint64_t)mru_suggestedRouteBannerTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], 1280, *MEMORY[0x1E0DC48F0]);
}

+ (uint64_t)mru_suggestedRouteBannerSubtitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], 1280, *MEMORY[0x1E0DC48F0]);
}

@end
