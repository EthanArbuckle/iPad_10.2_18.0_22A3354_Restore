@implementation UIColor(HKAdditions)

+ (uint64_t)hk_chartLollipopValueColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)hk_chartLollipopLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)hk_activityKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("activity_category_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_medicationDoseEventTakenColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
}

+ (uint64_t)hk_chartInactiveSeriesColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_chartBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)hk_chartGrayGraphColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (uint64_t)hk_chartAxisLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (id)hk_activityMoveGoalLineColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.89, 0.01, 0.1, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.980392158, 0.0666666701, 0.309803933, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityStandGoalLineColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.08, 0.73, 0.87, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.964705884, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityExerciseGoalLineColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.13, 0.88, 0.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.650980413, 1.0, 0.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_medicationDoseEventSkippedColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.678431392, 0.870588243, 0.960784316, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.196078435, 0.411764711, 0.501960814, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_appTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)hk_appKeyColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkBlueColor");
  else
    objc_msgSend(a1, "hk_appTintColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_appErrorColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_appInteractionDisabledColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkMidGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_alertHeaderBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.870588243, 0.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.894117653, 0.172549024, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_alertHeaderForegroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (uint64_t)hk_vitalsKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
}

+ (uint64_t)hk_heartKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
}

+ (uint64_t)hk_bodyMeasurementsKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
}

+ (uint64_t)hk_medicationTrackingKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
}

+ (uint64_t)hk_mindfulnessKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemMintColor");
}

+ (uint64_t)hk_mobilityKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
}

+ (uint64_t)hk_nutritionKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
}

+ (uint64_t)hk_reproductiveHealthKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
}

+ (id)hk_reproductiveHealthStartOfCycleColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(a1, "hk_reproductiveHealthKeyColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.600000024, 0.796078444, 1.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_pregnancyKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("pregnancy_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_sleepKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemMintColor");
}

+ (id)hk_sleepAwakeColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("sleep_awake"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_sleepInBedColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("sleep_in_bed_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_sleepAsleepColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemMintColor");
}

+ (uint64_t)hk_sleepInactiveAwakeColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_sleepInactiveInBedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_sleepInactiveAsleepColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (id)hk_sleepOverlayTintColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("sleep_overlay_tint_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_sleepSecondaryColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("sleep_secondary_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_sleepAsleepREMColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
}

+ (uint64_t)hk_sleepAsleepCoreColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)hk_sleepAsleepDeepColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("sleep_deep_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_sleepInactiveAsleepREMColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_sleepInactiveAsleepCoreColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_sleepInactiveAsleepDeepColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (id)hk_sleepColorForSleepAnalysis:()HKAdditions
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "hk_sleepInBedColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "hk_sleepAsleepColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "hk_sleepAwakeColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "hk_sleepAsleepCoreColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "hk_sleepAsleepDeepColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "hk_sleepAsleepREMColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)hk_sleepInactiveColorForSleepAnalysis:()HKAdditions
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "hk_sleepInactiveInBedColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "hk_sleepInactiveAsleepColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "hk_sleepInactiveAwakeColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "hk_sleepInactiveAsleepCoreColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "hk_sleepInactiveAsleepDeepColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "hk_sleepInactiveAsleepREMColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)hk_sleepPrimaryTextColorForSleepAnalysis:()HKAdditions
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 5)
  {
    if (((1 << a3) & 5) != 0 || ((1 << a3) & 0x18) == 0)
    {
      objc_msgSend(a1, "hk_chartOverlayPillDarkColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "hk_chartOverlayPillLightColor", v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

+ (uint64_t)hk_respiratoryKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
}

+ (uint64_t)hk_otherKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)hk_insulinBasalKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (uint64_t)hk_profileKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (id)hk_otherSecondaryColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("other_secondary_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_symptomsKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
}

+ (id)hk_workoutKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("activity_category_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_workoutGradientTopColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.607843161, 0.968627453, 0.0, 1.0);
}

+ (uint64_t)hk_workoutGradientBottomColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.376470596, 0.909803927, 0.0, 1.0);
}

+ (uint64_t)hk_workoutChartGradientTopColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.494117647, 0.925490201, 0.192156866, 1.0);
}

+ (uint64_t)hk_workoutChartGradientBottomColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.247058824, 0.807843149, 0.168627456, 1.0);
}

+ (uint64_t)hk_defaultPrimaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)hk_defaultSecondaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)hk_defaultTertiaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (uint64_t)hk_defaultQuaternaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (uint64_t)hk_defaultKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941176474, 0.941176474, 0.941176474, 1.0);
}

+ (uint64_t)hk_defaultGradientTopColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941176474, 0.941176474, 0.941176474, 1.0);
}

+ (uint64_t)hk_defaultGradientBottomColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941176474, 0.941176474, 0.941176474, 1.0);
}

+ (uint64_t)hk_defaultInfoButtonGlyphColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (uint64_t)hk_defaultInfoButtonBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 0.4);
}

+ (uint64_t)hk_darkInfoButtonGlyphColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.301960796, 0.301960796, 0.301960796, 1.0);
}

+ (uint64_t)hk_darkInfoButtonBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.301960784, 0.301960784, 0.301960784, 0.14);
}

+ (uint64_t)hk_chartAxisMajorGridColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (uint64_t)hk_chartAxisMinorGridColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (uint64_t)hk_chartGrayTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)hk_chartLightGrayTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)hk_chartLollipopBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (uint64_t)hk_chartLollipopStickColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
}

+ (uint64_t)hk_chartOverlayBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (id)hk_chartPointLabelBackgroundColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)hk_stackedBarSeriesUnselectedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (id)hk_chartOverlayPillLightColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("chart_overlay_pill_light_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_chartOverlayPillDarkColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("chart_overlay_pill_dark_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_chartOverlayPillAltColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("chart_overlay_pill_alt_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_populationChartSeriesColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_populationChartLevelBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (uint64_t)hk_populationChartTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)hk_activityCardGradientTopColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
}

+ (uint64_t)hk_activityCardGradientBottomColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
}

+ (id)hk_activityCardGrayColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_activityMoveGoalMetGradientTopColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988, 0.156, 0.457, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.97647059, 0.219607845, 0.521568656, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityMoveGoalMetGradientBottomColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.879, 0.0, 0.082, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.980392158, 0.0666666701, 0.309803933, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityMoveGoalMetNonGradientColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.980392158, 0.0666666701, 0.309803933, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.980392158, 0.0666666701, 0.309803933, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityMoveGoalMissedGradientTopColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996, 0.747, 0.837, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_activityMoveGoalMetGradientTopColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_activityMoveGoalMissedGradientBottomColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.964, 0.7, 0.725, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_activityMoveGoalMetGradientBottomColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_activityMoveGoalMissedNonGradientColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hk_activityMoveGoalMetNonGradientColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityExerciseGoalMetGradientTopColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.691, 0.996, 0.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.847058833, 1.0, 0.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityExerciseGoalMetGradientBottomColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.219, 0.859, 0.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.600000024, 1.0, 0.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityExerciseGoalMissedGradientTopColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.876, 0.998, 0.6, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_activityExerciseGoalMetGradientTopColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_activityExerciseGoalMissedGradientBottomColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6876, 0.944, 0.6, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_activityExerciseGoalMetGradientBottomColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_activityStandGoalMetGradientTopColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.977, 0.813, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.65882355, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityStandGoalMetGradientBottomColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.727, 0.871, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.847058833, 1.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_activityStandGoalMissedGradientTopColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.991, 0.925, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_activityStandGoalMetGradientTopColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_activityStandGoalMissedGradientBottomColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.891, 0.948, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_activityStandGoalMetGradientBottomColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_activityPausedColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_activitySeparatorDefaultColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (id)hk_activitySeparatorLollipopColor
{
  double v0;
  double v1;

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v0 = 0.337254912;
    v1 = 0.345098048;
  }
  else
  {
    v0 = 0.227450982;
    v1 = 0.235294119;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v0, v0, v1, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_activityLegendLabelColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.56, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_electrocardiogramCardHeaderColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("card_header_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_electrocardiogramCardBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
}

+ (id)hk_electrocardiogramCardOnboardingHeaderColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("card_onboarding_header_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_electrocardiogramCardOnboardingBackgroundColor
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "hk_electrocardiogramCardOnboardingHeaderColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)hk_electrocardiogramChartVeryMinorGridlineColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (uint64_t)hk_electrocardiogramChartMinorGridlineColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (id)hk_electrocardiogramChartMediumGridlineColor
{
  void *v0;
  void *v1;

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkMidGrayColor");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "colorWithAlphaComponent:", 0.3);
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

+ (uint64_t)hk_electrocardiogramChartMajorGridlineColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
}

+ (id)hk_electrocardiogramChartBorderColor
{
  void *v0;
  void *v1;

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "colorWithAlphaComponent:", 0.6);
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

+ (uint64_t)hk_hearingHealthKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)hk_hearingHealthInfoBackground
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.956862748, 0.956862748, 0.956862748, 1.0);
}

+ (id)hk_hearingHealthAudioExposureOkFill
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00784313772, 0.866666675, 0.31764707, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hk_hearingHealthAudioExposureLoudFill
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.792156875, 0.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)hk_hearingHealthAudioExposureBackground
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
}

+ (id)hk_hearingHealthAudioExposureColorForClassification:()HKAdditions
{
  void *v3;

  if (a3 == 2)
  {
    objc_msgSend(a1, "hk_hearingHealthAudioExposureLoudFill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(a1, "hk_hearingHealthAudioExposureOkFill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)hk_hearingHealthAudiogramLeftEarLineColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.498039216, 0.737254918, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.360784322, 0.749019623, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_hearingHealthAudiogramLeftEarPointMarkerColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hk_hearingHealthAudiogramLeftEarDeemphasizedColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.749019623, 0.866666675, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.192156866, 0.400000006, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_hearingHealthAudiogramRightEarLineColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.749019623, 0.866666675, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.192156866, 0.400000006, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_hearingHealthAudiogramRightEarPointMarkerColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.498039216, 0.737254918, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.286274523, 0.600000024, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_hearingHealthAudiogramRightEarDeemphasizedColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.749019623, 0.866666675, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.192156866, 0.400000006, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_hearingHealthAudiogramAverageLineColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hk_hearingHealthAudiogramDisabledLineColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.909803927, 0.909803927, 0.917647064, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.20784314, 0.20784314, 0.219607845, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_hearingHealthAudiogramDisabledPointMarkerColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightMidGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.278431386, 0.278431386, 0.290196091, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColorIfNeeded:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hk_hearingHealthAudiogramSelectedFrequencyAnnotationColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)hk_clinicalRecordSeparatorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

+ (uint64_t)hk_clinicalRecordValueColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)hk_clinicalRecordUnitColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)hk_clinicalRecordShowMoreBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("clinical_record_show_more_background_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_allergiesClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("allergies_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_carePlansClinicalKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
}

+ (id)hk_clinicalNotesClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("clinical_notes_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_clinicalDocumentsKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (id)hk_conditionsClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("conditions_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_devicesClinicalKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (id)hk_immunizationsClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("immunizations_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_insuranceClinicalKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)hk_labResultsClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("lab_results_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_medicationsClinicalKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
}

+ (id)hk_proceduresClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("procedures_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hk_socialHistoryClinicalKeyColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
}

+ (id)hk_vitalsClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("vitals_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_unknownCategoryClinicalKeyColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hk_colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("unknown_category_clinical_key_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_lightGrayTextColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.462745098, 0.466666667, 0.462745098, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hk_sourceIconTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.109999999, 0.493999988, 0.984000027, 1.0);
}

+ (id)hk_colorNamed:()HKAdditions inBundle:compatibleWithTraitCollection:
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (_UIApplicationIsExtension())
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appTintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)hk_randomColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)random() / 2147483650.0, 1.0, 0.9, 1.0);
}

+ (id)_accessibilityColorView
{
  if (_accessibilityColorView_onceToken != -1)
    dispatch_once(&_accessibilityColorView_onceToken, &__block_literal_global_11);
  return (id)_accessibilityColorView_accessibilityColorView;
}

+ (id)_accessibilityHigherContrastTintColorForColorIfNeeded:()HKAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(a1, "_accessibilityColorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityHigherContrastTintColorForColor:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)_colorWithSaturationAdjustedByPercentage:()HKAdditions
{
  double v4;
  id v5;
  double v7;
  double v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, &v7) & 1) != 0)
  {
    v4 = 1.0;
    if (v9 + a2 <= 1.0)
      v4 = v9 + a2;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v10, v4, v8, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

@end
